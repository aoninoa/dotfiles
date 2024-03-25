local map = vim.keymap
local opts = { silent = true, noremap = true }

-- disable default key mappings
map.set("n", "<C-O>", "<Nop>", opts)
map.set("n", "<C-I>", "<Nop>", opts)
map.set({ "n", "i" }, "<C-Space>", "<Nop>", opts)

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
map.set("n", "<leader>d", function()
    if #vim.api.nvim_list_wins() == 1 then
        vim.cmd("DelBuf")
    else
        local win_height =
            vim.api.nvim_win_get_height(vim.api.nvim_get_current_win())
        vim.cmd("bp | sp | bn | bd")
        vim.cmd("res " .. win_height)
    end
end, opts)

-- vimgrep
map.set("n", "[q", "<CMD>cnext<CR>")
map.set("n", "]q", "<CMD>cprevious<CR>")
map.set("n", "[Q", "<CMD>cfirst<CR>")
map.set("n", "]Q", "<CMD>clast<CR>")

-- tab
-- close
map.set("n", "<leader>tz", "<CMD>tabc<CR>", opts)

-- file manager
-- return from filemanger
map.set("n", "<leader>r", "<CMD>Rex<CR>", opts)

-- window
-- close all windows except current window
map.set("n", "<C-w>a", "<CMD>WinCloseAnother<CR>", opts)

-- insert mode
-- escape from insert mode
map.set("i", "<C-c>", "<ESC>", opts)
