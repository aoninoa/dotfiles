local map = vim.keymap
local opts = { silent = true, noremap = true }

-- normal mode
-- insert new line without entering insert mode
map.set("n", "<Leader>o", "o<ESC>", opts)
map.set("n", "<leader>O", "O<ESC>", opts)
-- disable highlihgt
map.set("n", "<leader>h", "<CMD>noh<CR>", opts)
-- buffer
-- toggle buffer
map.set("n", "<Tab>", "<CMD>bnext<CR>", opts)
map.set("n", "<S-Tab>", "<CMD>bprevious<CR>", opts)
-- delete/wipeout buffer
map.set("n", "<leader>z", "<CMD>DelBuf<CR>", opts)
map.set("n", "<leader>w", "<CMD>bw<CR>", opts)
map.set("n", "<leader>d", "<CMD>bp<bar>sp<bar>bn<bar>DelBuf<CR>", opts)
-- tab
-- close
map.set("n", "<leader>tz", "<CMD>tabc", opts);
-- file manager
-- return from filemanger
map.set("n", "<leader>r", "<CMD>Rex<CR>", opts)

-- insert mode
-- escape from insert mode
map.set("i", "<C-c>", "<ESC>", opts)
