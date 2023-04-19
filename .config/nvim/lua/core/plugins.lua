-- 

-- #### Section 1 ####

-- auto install packer.nvim
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- reloads nvim every time I save file plugins.lua
vim.cmd([[
    augroup packer_user_config
      autocmd!
     autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup END
]])


--- #### Section 2 ####

return require('packer').startup(function(use) 
    
    use { 'wbthomason/packer.nvim' }

    use { 
        'williamboman/mason.nvim',
        run = ":MasonUpdate",
        config = function()
            require('modules.mason.mason-config')
        end,
    }


-- ====================================================================
    -- base IDE tools

    use {
        'windwp/nvim-autopairs',
        config = function()
            require('modules.autopairs')
        end,
    }

    -- use { 
    --     'nvim-tree/nvim-tree.lua',
    --     config = function()
    --         require('modules.nvimtree')
    --     end,
    --
    --     requires = {
    --         'nvim-tree/nvim-web-devicons', 
    --     }
    -- }

    use { 
        'numToStr/Comment.nvim',
        config = function()
            require('modules.comment')
        end,
    }

-- ====================================================================
    -- LSP Server
    
    use {
        'williamboman/mason-lspconfig.nvim',

        'neovim/nvim-lspconfig',
        config = function()
            require('modules.lsp.lspconfig')
        end,

        requires = {
            'hrsh7th/cmp-nvim-lsp'
        }
    }

    use {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',

        'hrsh7th/nvim-cmp',
        config = function()
            require('modules.lsp.nvimcmp')
        end,
    }

    use {
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip'
    }

    -- to look pretier
    
    use {
        'onsails/lspkind.nvim' -- config through nvimcmp
    }

-- ====================================================================
    -- treesitter

    use {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require('modules.treesitter')
        end,
    }

-- ====================================================================
    -- Other plugins

    use {
        'ellisonleao/gruvbox.nvim'
    }

-- ====================================================================

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
