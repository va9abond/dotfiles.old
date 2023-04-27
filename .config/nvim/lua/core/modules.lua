-- 

-- #### Section 1 ####

local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installed")
	return
end

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
        autocmd BufWritePost modules.lua source <afile> | PackerSync
    augroup END
]])


--- #### Section 2 ####

packer.startup(function(use) 
    
    use { 'wbthomason/packer.nvim' }

    use { 
        'williamboman/mason.nvim',
        run = ":MasonUpdate",
        config = function()
            require('modules.mason.mason-config')
        end,
    }

    use {
        'nvim-lua/plenary.nvim'
    }


-- ====================================================================
    -- base IDE tools

    use {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('modules.evilline')
        end,
    }

    use {
        'windwp/nvim-autopairs',
        config = function()
            require('modules.autopairs')
        end,
    }

    use {
        'nvim-tree/nvim-web-devicons'
    }
    
    -- use { 
    --     'nvim-tree/nvim-tree.lua',
    --     config = function()
    --         require('modules.nvimtree')
    --     end, 
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
        'williamboman/mason-lspconfig.nvim' 
    }
    
    use {
        'neovim/nvim-lspconfig',
        config = function()
            require('modules.lsp.lspconfig')
        end,
    } 

    use {
        'hrsh7th/nvim-cmp',
        config = function()
            require('modules.lsp.nvim-cmp')
        end,
    }

    use {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua'
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
        'ThePrimeagen/harpoon',
        config = function()
            require('modules.harpoon')
        end,
    }

    use {
        'ellisonleao/gruvbox.nvim'
    }

    -- use {
    --     'morhetz/gruvbox'
    -- }
    
    use {
        'folke/tokyonight.nvim'
    }

    use {
        'RRethy/nvim-base16'
    }

    -- ====================================================================

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
