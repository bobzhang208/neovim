-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}
local pluginKeys = {}
-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)


vim.keymap.set('i', 'jj', '<ESC>', opts)
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
vim.keymap.set("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
vim.keymap.set("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
vim.keymap.set("n", "<C-p>", ":Telescope find_files<CR>", opt)
vim.keymap.set("n", "<C-f>", ":Telescope live_grep<CR>", opt)

-- terminal
vim.api.nvim_set_keymap('n', '<Leader>th', ':split | terminal<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>tv', ':vsplit | terminal<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>t', ':terminal<CR>', { noremap = true, silent = true })
-- 在终端模式下按 Esc 切回普通模式
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

pluginKeys.mapDAP = function()
	-- 结束
	map(
		"n",
		"<S-F5>",
		":lua require'dap'.terminate()<CR>"
		.. ":lua require'dap'.close()<CR>"
		.. ":lua require'dap.repl'.close()<CR>"
		.. ":lua require'dapui'.close()<CR>"
		.. ":lua require('dap').clear_breakpoints()<CR>"
		.. "<C-w>o<CR>",
		opt
	)
	-- 开始/继续
	map("n", "<C-F5>", ":lua require'dap'.continue()<CR>", opt)
	-- 设置断点
	map("n", "<F6>", ":lua require'dap'.toggle_breakpoint()<CR>", opt)
	map("n", "<S-F6>", ":lua require'dap'.clear_breakpoints()<CR>", opt)
	--  stepOver, stepOut, stepInto
	map("n", "<F12>", ":lua require'dap'.step_over()<CR>", opt)
	map("n", "<S-F7>", ":lua require'dap'.step_out()<CR>", opt)
	map("n", "<F7>", ":lua require'dap'.step_into()<CR>", opt)
	-- 弹窗
	map("n", "<S-F12>", ":lua require'dapui'.eval()<CR>", opt)
	-- 重启
	map("n", "<F10>", ":lua require'dap'.restart()<CR>", opt)
	map("n", "<S-F10>", ":lua require'dap'.terminate()<CR>", opt)
end

