local wezterm = require("wezterm")
local act     = wezterm.action

local colors  = require("color")
-- local navigator = require("navigator")

local module  = {}

function module.common(config)
    -- load color config
    colors.load_theme(config)
    config.set_environment_variables = {
        prompt = '$E]7;file://localhost/$P$E\\$E[32m$T$E[0m $E[35m$P$E[36m$_$G$E[0m ',
    }

    config.inactive_pane_hsb = {
        saturation = 1,
        brightness = 1
    }

    config.check_for_updates = true

    -- window
    config.window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    }

    -- tab bar
    config.tab_bar_at_bottom = true
    config.tab_and_split_indices_are_zero_based = true
    config.tab_max_width = 8

    -- keybinding
    config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
    config.keys = {
        -- Disable default key bindings
        {
            key = "Tab",
            mods = "CTRL",
            action = act.DisableDefaultAssignment
        },
        {
            key = "Tab",
            mods = "CTRL|SHIFT",
            action = act.DisableDefaultAssignment
        },
        -- Send normal <c-a> key signal when press the leader key twice
        {
            key = "a",
            mods = "LEADER|CTRL",
            action = act.SendKey { key = "a", mods = "CTRL" }
        },
        -- Customize keybindings --
        -- Open New Window
        {
            key = "c",
            mods = "LEADER",
            action = act.SpawnTab "CurrentPaneDomain",
        },
        {
            key = "-",
            mods = "LEADER",
            action = act.SplitVertical { domain = "CurrentPaneDomain" },
        },
        {
            key = "|",
            mods = "LEADER|SHIFT",
            action = act.SplitHorizontal { domain = "CurrentPaneDomain" },
        },
        {
            key = "p",
            mods = "LEADER",
            action = act.ActivateTabRelative(-1),
        },
        {
            key = "n",
            mods = "LEADER",
            action = act.ActivateTabRelative(1),
        },
        {
            key = "l",
            mods = "LEADER",
            action = act.ActivatePaneDirection("Right"),
        },
        {
            key = "h",
            mods = "LEADER",
            action = act.ActivatePaneDirection("Left"),
        },
        {
            key = "k",
            mods = "LEADER",
            action = act.ActivatePaneDirection("Up"),
        },
        {
            key = "j",
            mods = "LEADER",
            action = act.ActivatePaneDirection("Down"),
        }
    }

    -- activate tab with its index
    for i = 0, 7 do
        table.insert(config.keys, {
            key = tostring(i),
            mods = "LEADER",
            action = act.ActivateTab(i),
        })
    end
    --
    -- for _, v in ipairs(navigator.keys) do
    --     table.insert(config.keys, v)
    -- end
end

function module.windows(config)
    -- default program that is launched at opening wezterm
    -- It's powershell on windows
    config.font = wezterm.font("Noto Sans Mono")
    config.font_size = 14.0
    config.default_prog = { "powershell.exe", "-NoLogo" }
end

function module.linux(_)
    -- TODO: Configure target dependent settings(linux)
end

return module
