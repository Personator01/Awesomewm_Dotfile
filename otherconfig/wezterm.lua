local wezterm = require 'wezterm';

return {
    front_end = "OpenGL",
    font = wezterm.font({'Roboto Mono', stretch="UltraCondensed", weight="Regular"}),
    font_size = 12,
    colors = {
        foreground = "#9500ff",
        background = "#f0deff",
        cursor_bg = "#ff00ff",
        cursor_fg = "#ff00ff",
        cursor_border = "#4C296B",
        selection_fg = "#4C296B",
        selection_bg = "#000000",
        scrollbar_thumb = "#000000",
        split = "#f0deff",
        ansi = {'#00d5ff', '#ff00ff', '#009dff', '#c300ff', '#00ccff', '#9500ff', '#0077ff', '#6600ff'},
        brights = {'#00d5ff', '#ff00ff', '#009dff', '#c300ff', '#00ccff', '#9500ff', '#0077ff', '#6600ff'},
    },
    window_padding = {
      left = 20,
      right = 20,
      top = 20,
      bottom = 20,
    },
    enable_tab_bar = false,
    default_cursor_style = "BlinkingUnderline",
  }
