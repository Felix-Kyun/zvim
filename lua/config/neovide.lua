local alpha = function(value)
    return string.format("%x", math.floor(255 * value))
end

if vim.g.neovide then
    -- font
    vim.opt.guifont = "JetBrainsMono NF:h12"
    vim.g.neovide_scale_factor = 1
    vim.opt.linespace = 7

    -- padding
    vim.g.neovide_padding_top = 10
    vim.g.neovide_padding_bottom = 5
    vim.g.neovide_padding_right = 5
    vim.g.neovide_padding_left = 5

    -- opacity
    vim.g.neovide_opacity = 0.95
    vim.g.neovide_normal_opacity = 0.95

    -- theme
    vim.g.neovide_theme = "dark"
    vim.opt.termguicolors = true

    vim.g.neovide_position_animation_length = 0.30
    vim.g.neovide_scroll_animation_length = 0.5
    vim.g.neovide_scroll_animation_far_lines = 1
    vim.g.neovide_hide_mouse_when_typing = true
    vim.g.neovide_cursor_animation_length = 0.150
    vim.g.neovide_cursor_short_animation_length = 0.04

    vim.g.neovide_floating_shadow = true
    vim.g.neovide_floating_corner_radius = 5.0
end
