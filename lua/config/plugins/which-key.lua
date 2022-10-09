require("which-key").setup {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = '<c-d>', -- binding to scroll down inside the popup
    scroll_up = '<c-u>', -- binding to scroll up inside the popup
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
  -- disable the WhichKey popup for certain buf types and file types.
  -- Disabled by deafult for Telescope
  disable = {
    buftypes = {},
    filetypes = { "TelescopePrompt" },
  },
}

local wk = require("which-key")
wk.register({
  f = {
    name = "+file", -- optional group name
    f = { "<CMD>Telescope find_files<CR>", "Find File" }, -- create a binding with label
    r = { "<CMD>Telescope oldfiles<CR>", "Open Recent File", noremap=false, buffer = 1 }, -- additional options for creating the keymap
    n = { "New File" }, -- just a label. don't create any mapping
    e = "Edit File", -- same as above
    ["1"] = "which_key_ignore",  -- special label to hide it in the popup
    b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
  },

  w = {
    name = "+window",
    w = { "<CMD>:w<CR>", "Write Window" },
    v = { "<CMD>:vsp<CR>", "V-Split" },
    s = { "<CMD>:sp<CR>", "Split" },
  },

  q = {
    name = "+quit",
    a = { "<CMD>:wqa<CR>", "Write Quit All" },
    q = { "<CMD>:wq<CR>", "Quit Window"},
    c = { "<CMD>:qa!<CR>", "Quit Whithout Saving" },
  },

  b = {
    name = "+buffer",
    n = { "<CMD>:bnext<CR>", "Next Buffer" },
    p = { "<CMD>:bprev<CR>", "Previous Buffer" },
  },

  l = {
    name = "+LSP",
    D = { "vim.lsp.buf.declaration", "Declaration" },
    d = { "vim.lsp.buf.definition", "Definition" },
    K = { "vim.lsp.buf.hover", "Hover" },
    i = { "vim.lsp.buf.implementation", "Implementation" },
    k = { "vim.lsp.buf.signature_help", "Signature Help" },
    w = {
      name = "+Buffer Workspace",
      a = { "vim.lsp.buf.add_workspace", "Add Workspace" },
      r = { "vim.lsp.buf.remove_workspace", "Remove Workspace" },
      l = { function () print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, "Print Workspaces" },
    },
    t = { "vim.lsp.buf.type_signature", "Type Signature" },
    r = { "vim.lsp.buf.rename", "Rename" },
    a = { "vim.lsp.buf.code_action", "Code_action" },
    r = { "vim.lsp.buf.references", "References" },
    f = { "vim.lsp.buf.formatting", "Formatting" },
  },

}, { prefix = "<leader>" })
