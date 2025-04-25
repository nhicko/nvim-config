local wez = require 'wezterm'

local c = {}
wez.config_builder()

c.font = wez.font 'Iosevka Nerd Font Mono'
--c.font = wez.font 'FiraCode Nerd Font'
c.color_scheme = 'Atom'
c.automatically_reload_config = true
c.window_decorations = 'RESIZE'
c.font_size = 13
c.audible_bell = "Disabled"
c.scrollback_lines = 3000
c.default_workspace = "main"
c.max_fps = 240

return c
