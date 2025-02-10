# Neovim

Author: Nathan Tebbs  
Purpose: My personal neovim configuration and qol scripts  
Edited: Feb 10th, 2025  

_NOTE:_ This repository is under active development. I am still learning shell scripting, lua, neovim, etc. So help is appreciated, thanks!

Usage
--

*Clone repo:*
```bash
git clone https://github.com/nathantebbs/neovim.git
```

For the instant access to LSP support I'm currently using nightly neovim builds. I have included a script to fetch the latest nightly build, currently only for MacOS.

*Run installation script:*
```bash
./updt_nightly
```

*create custom alias for nightly build:*
```bash
alias nv=~/.config/nvim/nightly/arm64/neovim/bin/nvim
```
> If you would like this alias to persist across multiple sessions consider adding it to your terminals configuration file
