local g = vim.g
g.t_co = 256
g.background = "dark"

-- file explorer
-- disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.netrw_liststyle = 1
g.netrw_banner = 0
g.netrw_preview = 1
g.netrw_timefmt = "%Y-%m-%d(%a) %H:%M:%S"
g.netrw_sizestyle = "H"
g.netrw_keepdir = 1
g.netrw_chgwin = vim.fn.winnr()
g.netrw_special_syntax = 3

-- for windows os
-- g.netrw_localmovecmd = "Move-Item"
-- g.netrw_localcopycmd = "Copy-Item"
