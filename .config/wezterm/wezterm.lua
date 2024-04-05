local wezterm  = require("wezterm")
local platform = require("platform")

local config   = {}

platform.common(config)

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
    platform.windows(config)
end

if wezterm.target_triple == "x86_64-unknown-linux-gnu" then
    platform.linux(config)
end

return config
