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
        use ("wbthomason/packer.nvim")

        -- Native Lsp --

        -- Plugin to help configure the Native Lsp
        use ({ 
            "neovim/nvim-lspconfig",
            event = 'BufRead',
            config = function()
                require("lsp.lsp-config")
            end,
            requires = {
                {
                    "hrsh7th/cmp-nvim-lsp",
                },
            },
        })

        -- Autocomplete engine for the Native Lsp
        use({
            {
                'hrsh7th/nvim-cmp',
                event = 'InsertEnter',
                config = function()
                    require('lsp.nvim-cmp')
                end,
                requires = {
                    {
                        'L3MON4D3/LuaSnip',
                        event = 'InsertEnter',
                        config = function()
                            require('lsp.luasnip')
                        end,
                        requires = {
                            {
                                'rafamadriz/friendly-snippets',
                                event = 'CursorHold',
                            },
                        },
                    },
                },
            },
            { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
        })


        use ({ "nvim-lua/plenary.nvim" })
        

        -- Theme
        use ({
            'folke/tokyonight.nvim',
            config = function()
                require('plugins.tokyonight')
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
                require('plugins.lualine')
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
                require('plugins.nvim-tree')
            end
        })


        -- Syntax Highlighting
        use ({
            {
                'nvim-treesitter/nvim-treesitter',
                event = 'CursorHold',
                run = ':TSUpdate',
                config = function()
                    require('plugins.treesitter')
                end
            },
            { 'nvim-treesitter/playground', after = 'nvim-treesitter' },
            { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' },
            { 'nvim-treesitter/nvim-treesitter-refactor', after = 'nvim-treesitter' },
            { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' },
            { 'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter' },
        })


        -- Finder
        use ({
            {
                'nvim-telescope/telescope.nvim',
                event = 'CursorHold',
                config = function()
                    require('plugins.telescope')
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
        
        
        -- Productivity
        use { "nvim-orgmode/orgmode" }

        -- Doom Emacs style leader key help
        use {
            'folke/which-key.nvim',
            event = 'VimEnter',
            config = function()
                require('plugins.which-key')
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




