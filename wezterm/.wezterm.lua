local wezterm = require 'wezterm'
local config = wezterm.config_builder()

local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle

config.automatically_reload_config = true

config.font_size = 9.5
config.use_ime = true
config.macos_window_background_blur = 20

config.color_scheme = 'Tokyo Night'
config.window_background_opacity = 0.9
config.text_background_opacity = 0.85

config.window_decorations = 'RESIZE | MACOS_FORCE_SQUARE_CORNERS'
config.window_frame = {
    border_left_width = '1',
    border_right_width = '1',
    border_bottom_height = '1',
    border_top_height = '1',
    border_left_color = '#283457',
    border_right_color = '#283457',
    border_bottom_color = '#283457',
    border_top_color = '#283457',
}
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true
config.show_new_tab_button_in_tab_bar = false
config.show_close_tab_button_in_tabs = false
config.hide_tab_bar_if_only_one_tab = true

config.window_content_alignment = {
    horizontal = 'Center',
    vertical = 'Bottom',
}

config.colors = {
    tab_bar = {
        inactive_tab_edge = "none",
    },
}

config.window_frame = {
    inactive_titlebar_bg = "none",
    active_titlebar_bg = "none",
}

wezterm.on('gui-startup', function()
    local _, main_pane, window = wezterm.mux.spawn_window {}
    window:gui_window():maximize()
end)

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
    local background = "#5c6d74"
    local foreground = "#FFFFFF"
    local edge_background = "none"

    if tab.is_active then
        background = "#ae8b2d"
        foreground = "#FFFFFF"
    end

    local edge_foreground = background
    local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "

    return {
        { Background = { Color = edge_background } },
        { Foreground = { Color = edge_foreground } },
        { Text = SOLID_LEFT_ARROW },
        { Background = { Color = background } },
        { Foreground = { Color = foreground } },
        { Text = title },
        { Background = { Color = edge_background } },
        { Foreground = { Color = edge_foreground } },
        { Text = SOLID_RIGHT_ARROW },
    }
end)

return config
