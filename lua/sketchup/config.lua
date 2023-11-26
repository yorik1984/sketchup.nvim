local check = require("sketchup.check")

local M = {}

M.config = {
    theme = {
        enable_on_start = true,
        style = {
            operator = "bold",
            bracket = "bold",
            constant = "NONE",
            method = "NONE",
            class = "bold",
            module = "bold",
        },
        highlight = {},
        treesitter = {},
        syntax = {},
    },
}

function M.applyConfiguration(userConfig, configApply)
    local error_theme_help = {
        style = "Use: style = { operator = '<style>', bracket = '<style>', constant = '<style>', method = '<style>', class = '<style>', module = '<style>' }",
        highlight = "Use: highlight = { SketchUp<Type> = '#XXXXXX' }",
        syntax = "Use: custom_syntax = { <type1> = { '<group1>', '<group2>' } ... }",
        treesitter = "Use: treesitter = { '[@definition.<...>.sketchup.ruby'] = { fg = '#XXXXXX' ... } }",
    }

    local config = vim.tbl_deep_extend('force', configApply, userConfig)

    for key, help in pairs(error_theme_help) do
        check.notTableError(key, config.theme[key], help)
    end

    for _, value in pairs(config) do
        if value ~= nil then
            check.keyExistsError(userConfig, configApply, "Option", "See :help sketchup.nvim-configuration")
        end
    end

    return config
end

return M
