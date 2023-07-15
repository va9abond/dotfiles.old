require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'gruvbox',
        -- component_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = ''},
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = { {'pdf'},
            statusline = {},       -- only ignores the ft for statusline.
            winbar = {},           -- only ignores the ft for winbar.
        },

        ignore_focus = {'NvimTree'},
            -- If current filetype is in this list it'll
            -- always be drawn as inactive statusline
            -- and the last window will be drawn as active statusline.
            -- for example if you don't want statusline of
            -- your file tree / sidebar window to have active
            -- statusline you can add their filetypes here.

        always_divide_middle = true,
            -- When set to true, left sections i.e. 'a','b' and 'c'
            -- can't take over the entire statusline even
            -- if neither of 'x', 'y' or 'z' are present.

        globalstatus = false,
            -- enable global statusline (have a single statusline
            -- at bottom of neovim instead of one for  every window).
            -- This feature is only available in neovim 0.7 and higher.

        refresh = {              -- sets how often lualine should refresh it's contents (in ms)
            statusline = 1000,   -- The refresh option sets minimum time that lualine tries
            tabline = 1000,      -- to maintain between refresh. It's not guarantied if situation
            winbar = 1000        -- arises that lualine needs to refresh itself before this time
                -- it'll do it.

                -- Also you can force lualine's refresh by calling refresh function
                -- like require('lualine').refresh()
        }
    },

    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding'}, -- fileformat, filetype
        lualine_y = {'location'},
        lualine_z = {'progress'}
    },

    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {'progress'},
        lualine_z = {}
    },

    tabline = {
        -- lualine_a = {
        --     'tabs',
        --     max_length = vim.o.columns / 3,
        --     mode = 1 -- 0: tab_nr, 2: tab_nr + tab_name
        -- },
        lualine_a = {
            'tabs',
        },
        -- lualine_c = {
        --     require('tabline').tabline_tabs
        -- },
        -- lualine_c = {
        --     'filename',
        --     file_status = false,
        --     newfile_status = false,
        --     path = 4
        -- },
        -- lualine_x = {
        --     require('tabline').tabline_buffers
        -- },
        lualine_z = {
            'buffers'
        }
    },

    winbar = {
        -- lualine_z = {'filename'}
    },
    inactive_winbar = {},
    extensions = {}
}
