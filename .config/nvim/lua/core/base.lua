-- 

local g   = vim.g
local o   = vim.o
local opt = vim.opt
local cmd = vim.cmd



-- #### Section 1 ####

cmd ([[
    filetype indent plugin on
    syntax enable
]])

opt.mouse    = 'a'      -- allow me use mouse
o.hidden     = true	    -- allow me open next buffer without presaving previous
o.history    = 100      -- 
o.autowrite  = true     -- auto save before :next, :make etc
o.autoread   = true     -- auto reread changed files without asking me anything
o.scrolloff  = 11       -- cursor line will not drop bellow <n> lines when scrolling 
opt.encoding = "utf-8"  -- enable mouse 

o.timeoutlen = 9999 -- I need more time to remember what key is going next
o.updatetime = 750  -- just a time at all

o.clipboard  = "unnamedplus"  -- make public clipboard for OS and Vim

o.splitright = true
o.splitbelow = true

-- case insensitive searching unless /C or capital in search
o.ignorecase = true
o.smartcase  = true
o.incsearch  = true
o.hlsearch   = true


-- #### Section 2 ####

opt.termguicolors = true
o.background      = 'dark'

-- local function change_colorscheme()
--     -- if (vim.bo.filetype == '.cpp' )
--     vim.cmd.colorscheme('gruv-vsassist')
-- end
--
-- cmd([[
--     augroup cppFileColorscheme
--         autocmd!
--         auto FileTyep c,cpp,h,hpp lua change_colorscheme()
--     augroup END
-- ]])

cmd([[
    colorscheme gruvbox
]])
-- cmd([[
--     colorscheme gruv-vsassist
-- ]])
-- cmd([[
--     colorscheme tokyonight-night
-- ]])
-- cmd([[
--     colorscheme base16-gruvbox-dark-hard
-- ]])

-- #### Section 3 ####

g.tagbar_compact     = 1 -- compact tagbar view
g.tagbar_sort        = 0 -- disable alphabetic tags sort
-- g.loaded_netrw       = 1
-- g.loaded_netrwPlugin = 1
g.netrw_banner       = 0 -- hide netrw banner 
g.netrw_liststyle    = 3 -- tree instead of plain view
g.netrw_browse_split = 3 -- open file in new tab 

-- explanation https://habr.com/ru/post/64224/
o.number      = true
o.tabstop     = 4     -- indentation is equal <n> spaces
o.shiftwidth  = 4     -- in normal mode use >> and << to indent and outdent; in visual mode use > and <
o.smarttab    = true
o.expandtab   = true  -- tab to spaces?
o.smartindent = true
o.cindent     = true  -- nice indentation in C files

o.wrap      = false   -- soft wrap 
o.tw        = 0
o.linebreak = true   -- no linebreak in the middle of a word


-- #### Section 4 ####

o.backup      = false
o.writebackup = false
o.undofile    = true
o.swapfile    = false

