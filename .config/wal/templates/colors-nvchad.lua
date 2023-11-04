-- credits to original theme https://github.com/ayu-theme/ayu-vim (dark)
-- This is just a modified version of it

local M = {{}}

M.base_30 = {{
  white = "#ced4df",
  darker_black = "#05080e",
  black = "{color0}", --  nvim bg
  black2 = "#14171d",
  one_bg = "#1c1f25",
  one_bg2 = "#24272d",
  one_bg3 = "#2b2e34",
  grey = "#33363c",
  grey_fg = "#3d4046",
  grey_fg2 = "#46494f",
  light_grey = "#54575d",
  red = "#F07178",
  baby_pink = "#ff949b",
  pink = "#ff8087",
  line = "#24272d", -- for lines like vertsplit
  green = "#AAD84C",
  vibrant_green = "#b9e75b",
  blue = "#36A3D9",
  nord_blue = "#43b0e6",
  yellow = "#E7C547",
  sun = "#f0df8a",
  purple = "#c79bf4",
  dark_purple = "#A37ACC",
  teal = "#74c5aa",
  orange = "#ffa455",
  cyan = "#95E6CB",
  statusline_bg = "#12151b",
  lightbg = "#24272d",
  pmenu_bg = "#ff9445",
  folder_bg = "#98a3af",
}}

-- M.base_16 = {{
--   base00 = '{color0}',
--   base01 = '{color1}',
--   base02 = '{color2}',
--   base03 = '{color3}',
--   base04 = '{color4}',
--   base05 = '{color5}',
--   base06 = '{color6}',
--   base07 = '{color7}',
--   base08 = '{color8}',
--   base09 = '{color9}',
--   base0A = '{color10}',
--   base0B = '{color11}',
--   base0C = '{color12}',
--   base0D = '{color13}',
--   base0E = '{color14}',
--   base0F = '{color15}',
-- }}

-- This weird config because NvTerm doesn't know how to fetch colors properly
M.base_16 = {{
  base00 = '{color0}', -- background
  base01 = '{color0}', -- 0
  base02 = '{color2}',
  base03 = '{color1}',
  base04 = '{color2}',
  base05 = '{color7}', -- 7
  base06 = '{color5}',
  base07 = '{color6}',
  base08 = '{color1}',
  base09 = '{color2}',
  base0A = '{color3}',
  base0B = '{color2}',
  base0C = '{color6}',
  base0D = '{color4}',
  base0E = '{color5}',
  base0F = '{color6}',
}}

-- M.polish_hl = {{
--   luaTSField = {{ fg = M.base_16.base0D }},
--   ["@tag.delimiter"] = {{ fg = M.base_30.cyan }},
--   ["@function"] = {{ fg = M.base_30.orange }},
--   ["@parameter"] = {{ fg = M.base_16.base0F }},
--   ["@constructor"] = {{ fg = M.base_16.base0A }},
--   ["@tag.attribute"] = {{ fg = M.base_30.orange }},
-- }}

M = require("base46").override_theme(M, "wal")
vim.g.transparency = true

M.type = "dark"

return M
