<div align="center">
<p align="center">
    <img src="https://raw.githubusercontent.com/yorik1984/sketchup.nvim/main/assets/logo/logo-sketchup.nvim.png" width="200" alt="Logo"/><br/>
</p>

# sketchup.nvim

### W.I.P.🚧

![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)
![Lua](https://img.shields.io/badge/lua-%232C2D72.svg?style=for-the-badge&logo=lua&logoColor=white)

</div>

**_Changelog_**

23 Nov 2023 -- *version 2023.1*

- *Initial release*
- *Sketchup 2023.1 API*

## ℹ️ Info

Neovim plugin for [SketchUp](https://sketchup.com/) API development.

## 🌟 Features

+ full [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter) syntax support:
    - [Sketchup API Classes and Modules Index](https://ruby.sketchup.com/class_list.html)
    - [Sketchup API Methods Index](https://ruby.sketchup.com/method_list.html)
    - [Sketchup API Constant Summary](https://ruby.sketchup.com/top-level-namespace.html#constant_summary)

## 📦 Installation

Install via your favorite package manager:

**[lazy.nvim](https://github.com/folke/lazy.nvim)**

```lua
require("lazy").setup({
    "yorik1984/sketchup.nvim",
    event = "BufEnter *.rb",
    init = function()
        vim.g.sketchup_ruby_enabled = true
    end
})
```

## 🛠 TODO
* [ ] Add autocomplete
     * [ ] `Sketchup::Color`
     * [ ] `Sketchup::OptionsProviderObserver`
     * [ ] `Sketchup::RenderingOptions`
     * [ ] `Sketchup::ShadowInfo`
     * [ ] `Sketchup::ShadowInfoObserver`
     * [ ] `Sketchup::ToolsObserver`

