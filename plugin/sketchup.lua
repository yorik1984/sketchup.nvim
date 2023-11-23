local M = {}

M.SUcolors = {
    SketchUpModule = (vim.o.background == "dark") and "#B66F6D" or "#B54646",
    SketchUpClass = (vim.o.background == "dark") and "#AE4C55" or "#990000",
    SketchUpMethod = (vim.o.background == "dark") and "#EE6A77" or "#E72B3D",
    SketchUpConstant = (vim.o.background == "dark") and "#D6617F" or "#C7254E",
}

M.treesitterColors = {
    ["@definition.constant.sketchup.ruby"] = { fg = M.SUcolors.SketchUpConstant, nocombine = true },
    ["@definition.method.sketchup.ruby"] = { fg = M.SUcolors.SketchUpMethod, nocombine = true },
    ["@definition.type.sketchup.ruby"] = { fg = M.SUcolors.SketchUpClass, bold = true, nocombine = true },
    ["@definition.namespace.sketchup.ruby"] = { fg = M.SUcolors.SketchUpModule, bold = true, nocombine = true },
}

function M.Colors()
    if vim.g.sketchup_ruby_enabled == 1 then
        for g, c in pairs(M.treesitterColors) do
            vim.api.nvim_set_hl(0, g, c)
        end
    end
end

M.Colors()
