local util         = require("sketchup.util")
local theme        = require("sketchup.theme")
local configModule = require("sketchup.config")
local colors       = require("sketchup.colors")
local style        = require("sketchup.style")

local function setup(userConfig)
    local configApply = configModule.config

    if userConfig then
        configApply = configModule.applyConfiguration(userConfig, configApply)
    end

    local configColors = colors.setup(configApply)
    local configStyle = style.setupStyle(configApply)

    util.loadHighlight(configApply, theme.setup(configColors, configStyle))
end

return { setup = setup }
