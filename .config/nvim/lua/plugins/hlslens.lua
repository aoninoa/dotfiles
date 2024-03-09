return {
    "kevinhwang91/nvim-hlslens",
    lazy = true,
    keys = {
        { "/", mode = "n" },
        { "?", mode = "n" },
    },
    config = function()
        local hlslens = require("hlslens")
        hlslens.setup()
        hlslens.start()
    end
}
