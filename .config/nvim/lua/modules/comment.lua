-- `gco` - Insert comment to the next line and enters INSERT mode
-- `gcO` - Insert comment to the previous line and enters INSERT mode
-- `gcA` - Insert comment to end of the current line and enters INSERT mode

-- # Linewise

-- `gcw` - Toggle from the current cursor position to the next word
-- `gc$` - Toggle from the current cursor position to the end of line
-- `gc}` - Toggle until the next blank line
-- `gc5j` - Toggle 5 lines after the current cursor position
-- `gc8k` - Toggle 8 lines before the current cursor position
-- `gcip` - Toggle inside of paragraph
-- `gca}` - Toggle around curly brackets

-- # Blockwise

-- `gb2}` - Toggle until the 2 next blank line
-- `gbaf` - Toggle comment around a function (w/ LSP/treesitter support)
-- `gbac` - Toggle comment around a class (w/ LSP/treesitter support)


require('Comment').setup {

    ---Add a space b/w comment and the line
    padding = true,
    
    ---Whether the cursor should stay at its position
    sticky = true,

    ---Lines to be ignored w 
    ignore = nil,
    
    ---LHS of toggle mappings in NORMAL mode
    toggler = {
        ---Line-comment toggle keymap
        line = 'gcc',
       
        ---Block-comment toggle keymap
        block = 'gbc',
    },
    
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        ---Line-comment keymap
        line = 'gc',
        
        ---Block-comment keymap
        block = 'gb',
    },
    
    ---LHS of extra mappings
    extra = {
        ---Add comment on the line above
        above = 'gcO',
        
        ---Add comment on the line below
        below = 'gco',
       
        ---Add comment at the end of line
        eol = 'gcA',
    },
   
    ---Enable keybindings
    ---NOTE: If given `false` then the plugin won't create any mappings
    mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = true,
    },
    
    ---Function to call before (un)comment
    pre_hook = nil,
   
    ---Function to call after (un)comment
    post_hook = nil,

}
