local util = require("sketchup.util")

local M = {}

function M.setup(config)
    -- stylua: ignore start

    local SUColors = {
        SketchUpOperator = (vim.o.background == "dark") and "#4646FF" or "#0000FF",
        SketchUpBracket  = (vim.o.background == "dark") and "#D25071" or "#C7254E",
        SketchUpConstant = (vim.o.background == "dark") and "#6469FF" or "#585CF6",
        SketchUpMethod   = (vim.o.background == "dark") and "#EE6A77" or "#E94050",
        SketchUpClass    = (vim.o.background == "dark") and "#AE4C55" or "#AD3232",
        SketchUpModule   = (vim.o.background == "dark") and "#B66F6D" or "#BC5858",
    }
    -- stylua: ignore end

    if config.theme.highlight then
        util.colorOverrides(SUColors, config.theme.highlight)
    end

    return SUColors
end

return M
