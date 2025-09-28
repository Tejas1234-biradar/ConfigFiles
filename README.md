
# DSA Practice IDE (Neovim)

A lightweight **C++ IDE framework for DSA practice**, designed to track coding workflow and timing per problem. Helps you monitor progress and stay consistent during practice sessions.

## Features

* Floating HUD showing **current problem timing**
* Split tracking with **previous best comparison**
* Color-coded progress for quick visual reference
* Automatic timers for each new `.cpp` file
* Focused on **efficient DSA problem solving** in Neovim

## Installation

1. Copy `lua/contest_hud.lua` and `lua/contest_timer.lua` to your Neovim config folder:

```text
~/.config/nvim/lua/
```

2. Require them in your `init.lua` or separate config:

```lua
require("contest_hud")
require("contest_timer")
```

3. Keymaps (default):

* `<leader>rs` – Start a run
* `<leader>ra` – Add split for current file
* `<leader>re` – End run

## Notes

* Works with only **C++ `.cpp` files**
* HUD and timers are customizable
* Intended for **personal DSA workflow tracking**, not for public use


