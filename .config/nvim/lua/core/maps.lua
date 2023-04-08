-- 

local function map(m,k,v)
	vim.keymap.set(m,k,v, {noremap = true, silent = false})
end


map('i', '<leader>tb', '<CMD>TagbarToggle<CR>')
map('n', '<leader>tb', '<CMD>TagbarToggle<CR>')

map('i', 'jk', '<ESC>')

map('n', '<leader>h', '<CMD>nohlsearch<CR>')

map('n', '<C-s>', '<CMD>w<CR>')      -- Ctr-s : to save the file in nmode 
map('i', '<C-s>', '<ESC><CMD>w<CR>') -- Ctr-s : to save the file in imode

-- Fix * (Keep cursor position, don't move to next match)
-- map('n', '*', '*N')

-- Fix n and N. Keeping cursor in center
-- map('n', 'n', 'nzz')
-- map('n', 'N', 'Nzz')

-- Mimic shell movements
-- map('i', '<C-E>', '<C-o>$')
-- map('i', '<C-A>', '<C-o^>')

-- Quickly save the current buffer or all buffers
map('n', '<leader>w', '<CMD>update<CR>')
map('n', '<leader>W', '<CMD>wall<CR>')

-- leader-o/O inserts blank line below/above
map('n', '<leader>o', 'o<ESC>')
map('n', '<leader>O', 'O<ESC>')


-- Move through windows
-- map('n', 'C-h', '<CMD>tabp<CR>')
-- map('n', 'C-l', '<CMD>tabn<CR>')

-- Move to the next/previous buffer
-- map('n', 'C-x', '<CMD>bp<CR>')
-- map('n', 'C-z', '<CMD>bn<CR>')

-- split window
map('n', '<leader>v', '<CMD>vsplit<CR>')
map('n', '<leader>b', '<CMD>split<CR>')

-- map('n', '<C-j>', '<C-W>j')
-- map('i', '<C-j>', '<C-W>j')

-- map('n', '<C-k>', '<C-W>k')
-- map('i', '<C-k>', '<C-W>k')

-- map('n', '<C-h>', '<C-W>h')
-- map('i', '<C-h>', '<C-W>h')

-- map('n', '<C-l>', '<C-W>l')
-- map('i', '<C-l>', '<C-W>l')

-- Use operator pending mode to visually select the whole buffer
-- e.g. dA = delete buffer ALL, yA = copy whole buffer ALL
-- map('o', 'A', ':<C-U>normal! mzggVG<CR>`z')
-- map('x', 'A', ':<C-U>normal! ggVG<CR>')