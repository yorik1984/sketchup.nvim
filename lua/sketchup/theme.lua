local M = {}

function M.setup(configColors, configStyle)
    -- stylua: ignore start

    local theme    = {}
    theme.colors   = configColors
    theme.style    = configStyle
    local SUColors = theme.colors
    local style    = theme.style

    theme.treesitterColors = {
        ["@operator.sketchup.ruby"]             = { fg = SUColors.SketchUpOperator, style = style.operator, nocombine = true },
        ["@punctuation.bracket.sketchup.ruby"]  = { fg = SUColors.SketchUpBracket,  style = style.bracket,  nocombine = true },
        ["@definition.constant.sketchup.ruby"]  = { fg = SUColors.SketchUpConstant, style = style.constant, nocombine = true },
        ["@definition.method.sketchup.ruby"]    = { fg = SUColors.SketchUpMethod,   style = style.method,   nocombine = true },
        ["@definition.type.sketchup.ruby"]      = { fg = SUColors.SketchUpClass,    style = style.class,    nocombine = true },
        ["@definition.namespace.sketchup.ruby"] = { fg = SUColors.SketchUpModule,   style = style.module,   nocombine = true },
    }

    theme.treesitterDefaultColors = {
        ["@operator.sketchup.ruby"]             = { link = "@operator.ruby" },
        ["@@punctuation.bracket.sketchup.ruby"] = { link = "@punctuation.bracket.ruby" },
        ["@definition.constant.sketchup.ruby"]  = { link = "@constant.ruby" },
        ["@definition.method.sketchup.ruby"]    = { link = "@function.call.ruby" },
        ["@definition.type.sketchup.ruby"]      = { link = "@type.ruby" },
        ["@definition.namespace.sketchup.ruby"] = { link = "@type.ruby" },
    }

    -- stylua: ignore end

    return theme
end

return M
