local map = vim.keymap

map.set('n', '<space>n', ':tabnew', {})
-- map.set('n', '<space>c', ':tabclose', {})
map.set('n', '<space>b', ':+tabnext', {})
map.set('n', '<space>p', ':-tabnext', {})


