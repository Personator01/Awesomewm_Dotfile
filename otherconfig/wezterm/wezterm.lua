local wezterm = require 'wezterm';

return {
    front_end = "OpenGL",
    font = wezterm.font({'Roboto Mono', stretch="UltraCondensed", weight="Regular"}),
    font_size = 12,
    colors = {
        foreground = "#f0deff",
        background = "#675375",
        cursor_bg = "#ff00ff",
        cursor_fg = "#ff00ff",
        cursor_border = "#4C296B",
        selection_fg = "#4C296B",
        selection_bg = "#000000",
        scrollbar_thumb = "#000000",
        split = "#f0deff",
        ansi = {'#00d5ff', '#ff00ff', '#009dff', '#c300ff', '#00ccff', '#bb5cff', '#529dff', '#c573ff'},
        brights = {'#00d5ff', '#ff00ff', '#009dff', '#c300ff', '#00ccff', '#bb5cff', '#529dff', '#c573ff'},
    },
    window_padding = {
      left = 40,
      right = 40,
      top = 40,
      bottom = 40,
    },
    enable_tab_bar = false,
    default_cursor_style = "BlinkingUnderline",
  }
