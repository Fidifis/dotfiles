require("nvchad.mappings")

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

map("n", "S", "a<CR><ESC>", { noremap = true, desc = "Insert newline below" })

map("n", "dr", function()
	-- Get the current line number
	local line_num = vim.api.nvim_win_get_cursor(0)[1]
	-- Replace the line content with an empty string, preserving the newline
	vim.api.nvim_buf_set_lines(0, line_num - 1, line_num, false, { "" })
end, { desc = "Remove line content" })

map({ "n", "v" }, "<C-p>", '"0p', { desc = "Paste yanked text" })

map("n", "<leader>fm", function()
	vim.cmd("retab")
	require("conform").format({ lsp_fallback = true })
end, { desc = "Format Files" })

map("n", "<leader>fn", function()
	require("conform").format({ lsp_fallback = true })
end, { desc = "Format Files without retab" })

map("n", "<leader>b", "") -- unmap <leader>b
map("n", "<leader>bn", "<cmd>enew<CR>", { desc = "New Buffer"})

map("n", "<leader>bx", function()
	local tabufline = require("nvchad.tabufline")
	local current_bufnr = vim.api.nvim_get_current_buf()
	for _, bufnr in ipairs(vim.t.bufs) do
		if bufnr ~= current_bufnr then
			tabufline.close_buffer(bufnr)
		end
	end
end, { desc = "Close all buffers except current" })

map("n", "<A-o>", function()
	local row, _ = unpack(vim.api.nvim_win_get_cursor(0)) -- nvim should use 5.1 internally. Ignore warning ->
	vim.api.nvim_buf_set_lines(0, row, row, false, { "", "" })
	vim.api.nvim_win_set_cursor(0, { row + 1, 0 })
	vim.cmd("startinsert")
end, { desc = "Insert and surround with empty lines" })
