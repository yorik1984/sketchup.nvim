local check = require("sketchup.check")
local M = {}

function M.contains(tbl, string)
    for k, v in pairs(tbl) do
        if type(v) == "table" then
            if M.contains(tbl[k], string) then
                return true
            end
        end
        if v == string then
            return true
        end
    end
    return false
end

function M.syntax(syntax)
    for group, colors in pairs(syntax) do
        M.highlight(group, colors)
    end
end

function M.highlight(group, color)
    if color.style then
        if type(color.style) == "table" then
            color = vim.tbl_extend("force", color, color.style)
        elseif color.style:lower() ~= "none" then
            -- handle old string style definitions
            for s in string.gmatch(color.style, "([^,]+)") do
                color[s] = true
            end
        end
        color.style = nil
    end

    vim.api.nvim_set_hl(0, group, color)
end

function M.loadTreeSitter(config)
    local async
    async = vim.loop.new_async(vim.schedule_wrap(function()
        M.syntax(config.theme.treesitter)
        if async then
            async:close()
        end
    end))
    if async then
        async:send()
    end
end

function M.loadHighlight(config, theme)
    local tresitterColors = theme.treesitterDefaultColors
    if config.theme.enable_on_start then
        tresitterColors = theme.treesitterColors
        if config.theme.treesitter then
            M.loadTreeSitter(config)
        end
        M.autocmds(tresitterColors)
    end
end

function M.autocmds(colors)
    local group = vim.api.nvim_create_augroup("sketchup", {})
    vim.api.nvim_create_autocmd({ "BufEnter" }, {
        group = group,
        pattern = { "*.rb" },
        callback = function()
            require("sketchup.util").syntax(colors)
        end,
    })
end

function M.colorOverrides(colors, configColors)
    for key, value in pairs(configColors) do
        check.keyExistsError(configColors, colors, "color", "Use: from sketchup/colors.lua")
        if type(colors[key]) == "table" then
            M.colorOverrides(colors[key], { colors = value })
        else
            if value:lower() == "none" then
                colors[key] = "NONE"
            elseif check.isHex(value) then
                colors[key] = value
            elseif not colors[value] then
                error("sketchup.nvim: color '" .. value .. "' has wrong format. Use: '#XXXXXX'")
            else
                colors[key] = colors[value]
            end
        end
    end
end

return M
