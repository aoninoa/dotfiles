local module = {}

local fg = "#CCCCCC"
local bg = "#1A1A1A"

function module.load_theme(config)
    config.colors = {
        foreground = fg,
        background = bg,
        -- cursor
        cursor_bg = fg,
        cursor_border = fg,
        cursor_fg = bg,
    }
end

return module
