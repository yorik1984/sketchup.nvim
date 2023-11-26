local M = {}

function M.setupStyle(config)
    local style = {}
    for key, value in pairs(config.theme.style) do
       style[key] = value
    end

    return style
end

return M
