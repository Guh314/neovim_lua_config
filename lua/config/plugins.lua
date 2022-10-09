-- Plug-ins for nvim

-- Automatically run :PackerCompile whenever plugins.lua is update with an autocommand:
vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
    pattern = 'plugins.lua',
    command = 'source <afile> | PackerCompile',
})

vim.cmd [[packadd packer.nvim]]

return require('packer').startup({
    function(use)
    
        -- Packer to manage itself
        use ('wbthomason/packer.nvim')
        

        -- Help to use the native lsp.
        use ({ "neovim/nvim-lspconfig" })


        use ({ "nvim-lua/plenary.nvim" })
        

        -- Theme
        use ({
            'folke/tokyonight.nvim',
            config = function()
                require('config.plugins.tokyonight')
            end
        })
        

        use ({
            'kyazdani42/nvim-web-devicons',
            config = function()
                require('nvim-web-devicons').setup()
            end
        })
        

        -- A better status line -> Lua line
        use ({
            'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true},
            config = function()
                require('config.plugins.lualine')
            end
        })
        

        -- Navigation
        use ({
            'kyazdani42/nvim-tree.lua',
            requires = {
                'kyazdani42/nvim-web-devicons', -- optional, for file icons
            },
            tag = 'nightly',
            config = function()
                require('config.plugins.nvim-tree')
            end
        })


        -- Syntax Highlighting
        use ({
            {
                'nvim-treesitter/nvim-treesitter',
                event = 'CursorHold',
                run = ':TSUpdate',
                config = function()
                    require('config.plugins.treesitter')
                end
            },
            { 'nvim-treesitter/playground', after = 'nvim-treesitter' },
            { 'nvim-treesitter/nvim-treesitter-refactor', after = 'nvim-treesitter' },
        })


        -- Finder
        use({
            {
                'nvim-telescope/telescope.nvim',
                event = 'CursorHold',
                config = function()
                    require('config.plugins.telescope')
                end,
            },
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                after = 'telescope.nvim',
                run = 'make',
                config = function()
                    require('telescope').load_extension('fzf')
                end,
            },
            {
                'nvim-telescope/telescope-symbols.nvim',
                after = 'telescope.nvim',
            },
        })


        -- Doom Emacs style leader key help
        use {
            'folke/which-key.nvim',
            event = 'VimEnter',
            config = function()
                require('config.plugins.which-key')
            end
        }

    end,
    
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'single'})
            end,
        },
    },
})




