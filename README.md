# Preface
This is my personal neovim configuration for development. This repository's main purpose is to be a reference point for me and is not meant to be a guide of any sort. 


## Current file structure:
nvim\
├── after\
│   └── plugin\
│       ├── cmp.lua\
│       ├── harpoon.lua\
│       ├── lsp.lua\
│       ├── telescope.lua\
│       └── treesitter.lua\
├── init.lua\
├── lazy-lock.json\
├── lua\
│   ├── keymaps.lua\
│   ├── options.lua\
│   ├── pluginlist.lua\
│   └── plugins.lua\
└── README.md\


### nvim/init.lua
- Config entry point
- points to files in the nvim/lua directory to source

### nvim/plugin/after/*.lua
- Plugin configuration point


## Installing a new plugin and configuring
- Add plugin through the nvim/lua/pluginlist.lua document
- Configure the plugin through nvim/after/plugin/\[plugin-name\].lua
- Note: configuration for each plugin can vary widely. Usually, basic plugins don't require much, however, plugins are used to serve a large purpose such as Mason or autocompletion will require more effort to configure. 

## Going forward
- I will update this repository whenever I make changes to my nvim config
- My personal goal with my config is to keep it lightweight but also competative to modern text editing solutions. Because of this the config will stay static for a while once I get it up and running and the changes I do make will be minimal in comparison to a neovim distrobution
