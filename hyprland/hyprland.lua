terminal = "kitty"
fileManager = "yazi"
menu = "rofi -show combi"

theme = dofile("/home/stmichael/.config/theme/theme.lua")

require("monitors")
require("startup")
require("theme")
require("layout")
require("input")
require("keybindings")
require("rules")
