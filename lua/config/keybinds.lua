local function map(m, k, v)
        vim.keymap.set(m, k, v, { silent = true})
end

-- Keymaps without Leader --

-- Quit
map('n', '<C-Q>', ':q<CR>')


-- Mimic Shell Movement
map('i', '<C-E>', '<Esc>A')
map('i', '<C-A>', '<Esc>i')


-- Quit
map('n', '<C-Q>', '<CMD>q<CR>')


-- Move to last buffer
map('n', "''", '<CMD>b#<CR>')


-- vscode behaviour of making splits
map('n', '<C-\\>', '<CMD>vsplit<CR>')
map('n', '<A-\\>', '<CMD>vsplit<CR>')


-- Move line up and down in NORMAL and VISUAL modes
map('n', '<C-j>', '<CMD>move .+1<CR>')
map('n', '<C-k>', '<CMD>move .-2<CR>')
map('x', '<C-j>', ":move '>+1<CR>gv=gv")
map('x', '<C-k>', ":move '<-2<CR>gv=gv")

map('i', 'ii', '<Esc>')


-- Moving bettween buffers in the same window
map('n', '<C-h>', '<C-w>h')
map('n', '<C-l>', '<C-w>l')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')


-- Keymap with Leader --


-- Quickly save the current buffer or all buffers
map('n', '<leader>w', '<CMD>update<CR>')
map('n', '<leader>W', '<CMD>wall<CR>')


-- Leader o/O inserts blank line below/above
map('n', '<leader>o', 'o<Esc>')
map('n', '<leader>O', 'O<Esc>')


-- Move to the next/previous buffer
map('n', '<leader>[', '<CMD>bp<CR>')
map('n', '<leader>]', '<CMD>bn<CR>')
