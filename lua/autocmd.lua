local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local general = augroup("General Settings", { clear = true })

autocmd("BufEnter", {
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
	group = general,
	desc = "Disable New Line Comment",
})

autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 300 })
	end,
	group = general,
	desc = "Highlight yanked text",
})
