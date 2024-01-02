local map = vim.keymap

local opts = { silent = true }

map.set('n', '<space>n', ':tabnew', opts)
map.set('n', '<space>q', ':tabclose', opts)
map.set('n', '<Leader>o', 'o<ESC>', opts)

