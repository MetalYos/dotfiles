vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set cursorcolumn")
vim.cmd("set cursorline")
vim.cmd("set hlsearch")
vim.cmd("set incsearch")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set scrolloff=10")
vim.cmd("set smartcase")
vim.cmd("set termguicolors")

-- Set leader key to be the space key
vim.g.mapleader = " "

-- Press <leader>ns to turn off search highlighting (until the next search)
vim.keymap.set('n', "<leader>ns", function() 
	vim.cmd("nohlsearch") 
end)

-- Press <leader>t to open terminal at a bottom pane and enter inser mode
vim.keymap.set('n', "<leader>t", function()
	vim.cmd("belowright 14split")
	vim.cmd.terminal()
	-- Enter insert mode
	vim.api.nvim_feedkeys("a", "t", false)
end)
