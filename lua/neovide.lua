local v = vim.g
if v.neovide then
  require 'notify'.notify "Konichiwa nya!"
  vim.opt.guifont = "FiraCode Nerd Font:h12"
  v.neovide_scale_factor = 1
  v.neovide_scroll_animation_length = 0.3
  v.neovide_hide_mouse_when_typing = true
  v.neovide_refresh_rate = 60
  v.neovide_refresh_rate_idle = 5
  v.neovide_cursor_animation_length = 0.10
  v.neovide_cursor_animate_in_insert_mode = true
  v.neovide_cursor_trail_size = 0.75
  v.neovide_cursor_antialiasing = true
  v.neovide_cursor_vfx_mode = "pixiedust"
  v.neovide_transparency = 0.6
  v.neovide_padding_top = 10
  v.neovide_padding_bottom = 10
  v.neovide_padding_right = 10
  v.neovide_padding_left = 10
  v.neovide_profiler = false
  -- v.neovide_floating_blur_amount_x = 2.0
  -- v.neovide_floating_blur_amount_y = 2.0
end
