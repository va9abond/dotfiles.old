--

local builtin = require('telescope.builtin')
local actions  = require('telescope.actions')
local lactions = require('telescope.actions.layout')

require('telescope').setup{
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<C-k>"] = "which_key",
                ['<ESC>'] = actions.close,
                -- ['<TAB>'] = actions.toggle_selection + actions.move_selection_next,
                -- ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_prev,
                -- ['<C-s>'] = actions.send_selected_to_qflist,
                ['<C-q>'] = actions.send_to_qflist,
                ['<C-h>'] = lactions.toggle_preview,
                -- ["<C-d>"] = actions.cycle_previewers_next,
                -- ["<C-f>"] = actions.cycle_previewers_prev,
            }
        }
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
    },
    extensions = {
        extensions = {
            fzy_native = {
                override_generic_sorter = false,
                override_file_sorter = true,
            }
        }
    }
}


vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fa', builtin.builtin, {})
-- vim.keymap.set('n', '<leader>fd', builtin.builtin, {bufnr=0})
vim.keymap.set('n', '<leader>tr', builtin.treesitter, {})
vim.keymap.set('n', '<leader>ft', builtin.tags, {})
