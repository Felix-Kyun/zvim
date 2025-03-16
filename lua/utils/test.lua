local keymap_manager = require "utils.keybind"

keymap_manager({
  n = {
    {"key", "cmd"},
    {"key", "cmd", { opts = "felix2" }}, 
    opts = {
      noremap = true
    }
  }
})
