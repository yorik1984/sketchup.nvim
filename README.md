<div align="center">
<p align="center">
    <img src="https://www.sketchup.com/themes/sketchup_www_terra/images/SketchUp-Horizontal-RGB.svg" width="200" alt="Logo"/>
</p>
# sketchup.nvim

![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)
![Lua](https://img.shields.io/badge/lua-%232C2D72.svg?style=for-the-badge&logo=lua&logoColor=white)

**_Changelog_**

23 Nov 2023 -- *version 2023.1*

- *Initial release*
- *Sketchup 2023.1 API*

## ℹ️ Info

Neovim plugin for Sketchup API development.

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
    config = true,
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

