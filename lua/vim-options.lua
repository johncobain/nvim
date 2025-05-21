vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.opt.number = true
vim.opt.relativenumber = true
vim.g.mapleader = " "

vim.api.nvim_create_augroup("neotree", {})
vim.api.nvim_create_autocmd("UiEnter", {
	desc = "Open Neotree automatically",
	group = "neotree",
	callback = function()
		if vim.fn.argc() == 0 then
			vim.cmd("Neotree toggle")
		end
	end,
})
