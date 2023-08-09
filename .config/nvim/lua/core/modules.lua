-- ==================================================================
-- Packed Setup
-- ==================================================================
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


-- ==================================================================
-- Install Plugins
-- ==================================================================
packer.startup(function(use)

-- ==================================================================
    --

    use { 'wbthomason/packer.nvim' }

    use {
        'williamboman/mason.nvim',
        run = ":MasonUpdate",
        config = function()
            require('modules.mason.mason-config')
        end,
    }

    use { 'nvim-lua/plenary.nvim' }


-- ====================================================================
    -- Base

    use {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('modules.lualine')
        end,
    }

    use {
        'kdheepak/tabline.nvim',
        config = function()
            require('modules.tabline')
        end,
    }

    use {
        'windwp/nvim-autopairs',
        config = function()
            require('modules.autopairs')
        end,
    }

    use { 'nvim-tree/nvim-web-devicons' }

    use {
        'nvim-tree/nvim-tree.lua',
        config = function()
            require('modules.nvimtree')
        end,
    }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('modules.comment')
        end,
    }


-- ====================================================================
    -- LSP Server

    use { 'williamboman/mason-lspconfig.nvim' }

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

    use { 'onsails/lspkind.nvim' } -- config through nvim-cmp



-- ====================================================================
    -- Treesitter

    use {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require('modules.treesitter')
        end,
    }


-- ====================================================================
    -- Telescope

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        config = function()
            require('modules.telescope')
        end,
    }

    use {
        'nvim-telescope/telescope-fzf-native.nvim'
    }


-- ====================================================================
    -- Compiler

    -- use {
    --     'stevearc/overseer.nvim',
    --     config = function()
    --         require('overseer').setup()
    --     end,
    -- }
    --
    -- use {
    --     'Zeioth/compiler.nvim',
    -- }


-- ====================================================================
    -- Other plugins

    use {
        'ThePrimeagen/harpoon',
        config = function()
            require('modules.harpoon')
        end,
    }

    use {
        'ellisonleao/gruvbox.nvim',
        config = function()
            require('modules.gruvbox')
        end,
    }

    use {
        'bartekprtc/gruv-vsassist.nvim',
        config = function()
            require('modules.assistX')
        end,
    }

    use { 'folke/tokyonight.nvim' }

    use { 'RRethy/nvim-base16' }


-- ====================================================================
    -- Plugin to connect tmux and neovim

    use { 'christoomey/vim-tmux-navigator' }


-- ====================================================================
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
-- ====================================================================
    if packer_bootstrap then
        require('packer').sync()
    end
end)
