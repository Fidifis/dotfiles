require("nvchad.mappings")

local map = vim.keymap.set

local append_end = function(char)
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  vim.cmd("normal! $")
  vim.api.nvim_put({ char }, "c", true, true)
  vim.api.nvim_win_set_cursor(0, cursor_pos)
end

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", ";", function() append_end(";") end, { desc = "Write ; at line end"})
map("n", ",", function() append_end(",") end, { desc = "Write , at line end"})

map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

map({ "n", "v" }, "<A-h>", "^", { noremap = true, desc = "Go to line start"})
map({ "n", "v" }, "<A-j>", "G", { noremap = true, desc = "Go to file end"})
map({ "n", "v" }, "<A-k>", "gg", { noremap = true, desc = "Go to file start"})
map({ "n", "v" }, "<A-l>", "$", { noremap = true, desc = "Go to line end"})

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
end, { desc = "Format by LSP" })

map("n", "<leader>fn", function()
	require("conform").format({ lsp_fallback = true })
end, { desc = "Format by LSP without retab" })

map("n", "<leader>b", "") -- unmap <leader>b
map("n", "<leader>bn", "<cmd>enew<CR>", { desc = "Buffer New Buffer"})

map("n", "<leader>bx", function()
	local tabufline = require("nvchad.tabufline")
	local current_bufnr = vim.api.nvim_get_current_buf()
	for _, bufnr in ipairs(vim.t.bufs) do
		if bufnr ~= current_bufnr then
			tabufline.close_buffer(bufnr)
		end
	end
end, { desc = "Buffer Close all buffers except current" })

map("n", "<A-o>", function()
	local row, _ = unpack(vim.api.nvim_win_get_cursor(0)) -- nvim should use 5.1 internally. Ignore warning ->
	vim.api.nvim_buf_set_lines(0, row, row, false, { "", "" })
	vim.api.nvim_win_set_cursor(0, { row + 1, 0 })
	vim.cmd("startinsert")
end, { desc = "Insert and surround with empty lines" })

map("n", "Q", "<cmd>qa<CR>", { noremap = true, desc = "Command Quit"})
