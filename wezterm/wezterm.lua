local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

-- 1. Appearance and Themes
config.color_scheme = 'Catppuccin Mocha'
config.font = wezterm.font_with_fallback {
  'FiraCode Nerd Font Mono',
}
config.font_size = 11.5
config.harfbuzz_features = { 'calt', 'liga' } -- Enable ligatures

-- Window Styling
config.window_background_opacity = 0.90
config.macos_window_background_blur = 30
config.window_decorations = 'RESIZE' -- Clean border with no bulky title bars
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 10,
}

-- Tab Bar
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_max_width = 32

-- Colors & Styling (Catppuccin Mocha theme matches)
config.colors = {
  tab_bar = {
    background = '#11111b', -- Catppuccin Crust
    active_tab = {
      bg_color = '#cba6f7', -- Catppuccin Mauve
      fg_color = '#11111b',
    },
    inactive_tab = {
      bg_color = '#181825', -- Catppuccin Mantle
      fg_color = '#a6adc8',
    },
    inactive_tab_hover = {
      bg_color = '#313244',
      fg_color = '#cdd6f4',
    },
  },
}

-- General Settings
config.audible_bell = 'Disabled'


-- 2. Developer Keymaps (Tmux-like workflow)
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }

config.keys = {
  -- Split Panes
  { key = '|', mods = 'LEADER|SHIFT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = '-', mods = 'LEADER', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = 'x', mods = 'LEADER', action = act.CloseCurrentPane { confirm = true } },

  -- Pane Navigation
  { key = 'k', mods = 'LEADER', action = act.ActivatePaneDirection 'Up' },
  { key = 'j', mods = 'LEADER', action = act.ActivatePaneDirection 'Down' },
  { key = 'h', mods = 'LEADER', action = act.ActivatePaneDirection 'Left' },
  { key = 'l', mods = 'LEADER', action = act.ActivatePaneDirection 'Right' },

  -- Resize Panes
  { key = 'UpArrow', mods = 'LEADER', action = act.AdjustPaneSize { 'Up', 5 } },
  { key = 'DownArrow', mods = 'LEADER', action = act.AdjustPaneSize { 'Down', 5 } },
  { key = 'LeftArrow', mods = 'LEADER', action = act.AdjustPaneSize { 'Left', 5 } },
  { key = 'RightArrow', mods = 'LEADER', action = act.AdjustPaneSize { 'Right', 5 } },

  -- Tabs
  { key = 't', mods = 'LEADER', action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'n', mods = 'LEADER', action = act.ActivateTabRelative(1) },
  { key = 'p', mods = 'LEADER', action = act.ActivateTabRelative(-1) },

  -- Reload configuration quickly
  { key = 'r', mods = 'LEADER', action = act.ReloadConfiguration },
}

-- 3. Visual Leader Key Indicator
wezterm.on('update-right-status', function(window, pane)
  local leader = ""
  if window:leader_active() then
    leader = " 👑 LEADER "
  end
  window:set_right_status(wezterm.format {
    { Foreground = { Color = '#f38ba8' } }, -- Catppuccin Red
    { Attribute = { Intensity = 'Bold' } },
    { Text = leader },
  })
end)

return config

