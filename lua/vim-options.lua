vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.opt.number = true
vim.opt.relativenumber = true
vim.g.mapleader = " "

-- Sair do modo terminal com 'jj'
vim.keymap.set("t", "<C-j>", [[<C-\><C-n>]], { desc = "Sair do terminal (modo normal)" })

-- Toggle terminal
function _G.toggle_terminal()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local buftype = vim.api.nvim_buf_get_option(buf, "buftype")
    if buftype == "terminal" then
      vim.api.nvim_win_close(win, true)
      return
    end
  end
  vim.cmd("botright split | terminal")
  vim.cmd("startinsert")
end

vim.keymap.set("t", "<C-t>", toggle_terminal, { desc = "Sair do terminal (modo normal)" })


vim.keymap.set("n", "<C-t>", toggle_terminal, { desc = "Toggle Terminal" })

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

