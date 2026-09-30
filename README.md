# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Offline use

The first launch (with internet) installs plugins, mason tools and treesitter
parsers. After that, startup makes no network calls: lazy.nvim's update
checker is off and mason's registry is never refreshed automatically.

Run `:UpdateAll` to update everything (plugins, parsers, mason registry and
packages) when you choose to.
