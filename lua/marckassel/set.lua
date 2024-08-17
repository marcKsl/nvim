-- Set the cursor shape for GUI mode. An empty string means default cursor shape.
vim.opt.guicursor = ""

-- Show line numbers.
vim.opt.nu = true

-- Show relative line numbers (line numbers relative to the current line).
vim.opt.relativenumber = true

-- Number of spaces to use for a tab character.
vim.opt.tabstop = 4

-- Number of spaces to use for a tab character while editing (useful for visual alignment).
vim.opt.softtabstop = 4

-- Number of spaces to use for each step of (auto)indentation.
vim.opt.shiftwidth = 4

-- Use spaces instead of tabs for indentation.
vim.opt.expandtab = true

-- Automatically adjust indentation based on the context.
vim.opt.smartindent = true

-- Disable line wrapping; lines longer than the screen width will not wrap.
vim.opt.wrap = false

-- Disable creation of swap files (which are used for crash recovery).
vim.opt.swapfile = false

-- Disable backup files; use undo files instead.
vim.opt.backup = false

-- Set the directory where undo files will be stored.
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Enable persistent undo by saving undo history to a file.
vim.opt.undofile = true

-- Activate highlighting of search matches.
vim.opt.hlsearch = true

-- Highlight matches as you type the search query.
vim.opt.incsearch = true

-- Enable true color support in the terminal (for better color accuracy).
vim.opt.termguicolors = true

-- Set the number of lines to keep above and below the cursor when scrolling.
vim.opt.scrolloff = 8

-- Always show the sign column (where signs like linting errors appear).
vim.opt.signcolumn = "yes"

-- Add '@-@' to the list of characters considered part of a file name.
vim.opt.isfname:append("@-@")

-- Set the time (in milliseconds) that Neovim will wait before triggering an event (e.g., when typing).
vim.opt.updatetime = 50

-- Highlight the column at the 80th character position to help with line length.
vim.opt.colorcolumn = "80"

