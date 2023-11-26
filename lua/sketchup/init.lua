local util         = require("sketchup.util")
local theme        = require("sketchup.theme")
local configModule = require("sketchup.config")

local function setup(userConfig)
    local configApply = configModule.config

    if userConfig then
        configApply = configModule.applyConfiguration(userConfig, configApply)
    end

    local configColors = require("sketchup.colors").setup(configApply)
    local configStyle = require("sketchup.style").setupStyle(configApply)

    util.loadHighlight(configApply, theme.setup(configColors, configStyle))
end

return { setup = setup }
