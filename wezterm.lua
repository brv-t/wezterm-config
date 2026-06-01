local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- =========================================================
-- MACOS INPUT BEHAVIOR (stable terminal semantics)
-- =========================================================

config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true
config.use_dead_keys = false

-- =========================================================
-- KEYBINDINGS (iTerm2-style hybrid, no leader system)
-- =========================================================

config.keys = {

  -- ==================== SPLITS ====================

  -- horizontal split
  {
    key = '\\',
    mods = 'CMD',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },

  -- vertical split
  {
    key = '-',
    mods = 'CMD',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },

  -- ==================== PANE NAVIGATION (stable replacement for Cmd+arrows) ====================

  {
    key = 'h',
    mods = 'CTRL',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'l',
    mods = 'CTRL',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    key = 'k',
    mods = 'CTRL',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'j',
    mods = 'CTRL',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },

  -- ==================== PANE RESIZE ====================

  {
    key = 'h',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.AdjustPaneSize { 'Left', 5 },
  },
  {
    key = 'l',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.AdjustPaneSize { 'Right', 5 },
  },
  {
    key = 'k',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.AdjustPaneSize { 'Up', 5 },
  },
  {
    key = 'j',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.AdjustPaneSize { 'Down', 5 },
  },

  -- ==================== CLOSE ====================

  -- smart close (pane-first, natural cascade handled by WezTerm)
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = false },
  },

  -- ==================== TABS ====================

  {
    key = 't',
    mods = 'CMD',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  },

  {
    key = ']',
    mods = 'CMD',
    action = wezterm.action.ActivateTabRelative(1),
  },
  {
    key = '[',
    mods = 'CMD',
    action = wezterm.action.ActivateTabRelative(-1),
  },

  -- ==================== ZOOM ====================

  {
    key = 'z',
    mods = 'CMD',
    action = wezterm.action.TogglePaneZoomState,
  },

  -- ==================== TEXT NAVIGATION (terminal standard) ====================

  -- word movement
  {
    key = 'LeftArrow',
    mods = 'OPT',
    action = wezterm.action.SendString '\x1bb',
  },
  {
    key = 'RightArrow',
    mods = 'OPT',
    action = wezterm.action.SendString '\x1bf',
  },

  -- delete word / line
  {
    key = 'Backspace',
    mods = 'OPT',
    action = wezterm.action.SendString '\x17',
  },
  {
    key = 'Backspace',
    mods = 'CMD',
    action = wezterm.action.SendString '\x15',
  },
}

-- =========================================================
-- APPEARANCE (PRESERVED FROM YOUR CONFIG)
-- =========================================================

config.window_decorations = "TITLE | RESIZE"
config.window_close_confirmation = 'NeverPrompt'

config.color_scheme = "Solarized (dark) (terminal.sexy)"

config.font = wezterm.font("FiraCode Nerd Font", { weight = "Regular" })
config.font_size = 13.0

config.harfbuzz_features = { "calt", "clig", "liga" }
config.line_height = 1.1

config.window_padding = {
  left = 12,
  right = 12,
  top = 12,
  bottom = 12,
}

config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true

-- =========================================================
-- PERFORMANCE / UX
-- =========================================================

config.scrollback_lines = 10000
config.front_end = "WebGpu"

return config
