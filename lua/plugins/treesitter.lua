require('nvim-treesitter.configs').setup({
    auto_install = true,
    ensure_installed = {
        'c',
        'lua',
        'rust',
        'go',
        'javascript',
        'typescript',
        'tsx',
        'markdown',
        'html',
        'css',
        'json',
        'bash',
        'fish',
        'elm',
        'haskell',
        'python',
        'clojure',
        'org',
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
    autotag = {
        enable = true,
    },
    playground = {
        enable = true,
        disable = {},
        updatetime = 25,
        persist_queries = false,
    },
    refactor = {
        highlight_definitions = { enable = true },
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
})
