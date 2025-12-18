local status, n = pcall(require, 'neosolarized')
if (not status) then return end

n.setup({
  commit_italics = true,
  background_set = false, -- 基础开关：不设背景
})

local colorbuddy = require('colorbuddy.init')
local Color = colorbuddy.Color
local colors = colorbuddy.colors
local Group = colorbuddy.Group
local groups = colorbuddy.groups
local styles = colorbuddy.styles

-- 1. 定义核心颜色
Color.new('black', '#000000')

-- 2. 【全透明核心】
-- 增加 TabLine (标签栏) 和 Folded (折叠行)，防止折叠代码时出现色块
local bg_none_groups = {
  "Normal", "NormalNC", "LineNr", "SignColumn", "FoldColumn", 
  "EndOfBuffer", "MsgArea", "StatusLine", "StatusLineNC",
  "VertSplit", "WinSeparator", "NonText", "TabLine", "TabLineFill", "Folded"
}
for _, g in ipairs(bg_none_groups) do
  Group.new(g, colors.base1, colors.none, styles.NONE)
end

-- 3. 【精致 UI】
Group.new("NormalFloat", colors.base1, colors.none, styles.NONE)
Group.new("FloatBorder", colors.base1, colors.none, styles.NONE)
Group.new("Pmenu",       colors.base1, colors.none, styles.NONE) 
-- PmenuSel (菜单选中): 背景用 base02 稍微深一点，文字用 yellow，这样在透明背景下极具辨识度
Group.new("PmenuSel",    colors.yellow, colors.base02, styles.bold) 

-- 光标行与选中
Group.new('CursorLine',   colors.none, colors.none, styles.NONE)
Group.new('CursorLineNr', colors.yellow, colors.none, styles.bold)
-- Visual: 稍微调亮背景色（base02），确保选中代码时能看清
Group.new('Visual',       colors.none, colors.base02, styles.reverse)

-- 4. 【诊断信息】适配 Nvim 0.11
-- 增加保护，确保即使 groups 为空也不会崩
local cError = (groups.DiagnosticError or groups.Error or {}).fg or colors.red
local cWarn  = (groups.DiagnosticWarn  or groups.Warning or {}).fg or colors.yellow
local cInfo  = (groups.DiagnosticInfo  or groups.Information or {}).fg or colors.blue
local cHint  = (groups.DiagnosticHint  or groups.Hint or {}).fg or colors.cyan

-- 虚拟文本使用 italic (斜体)，让它看起来像“注释”一样优雅
Group.new("DiagnosticVirtualTextError", cError, colors.none, styles.italic)
Group.new("DiagnosticVirtualTextInfo",  cInfo,  colors.none, styles.italic)
Group.new("DiagnosticVirtualTextWarn",  cWarn,  colors.none, styles.italic)
Group.new("DiagnosticVirtualTextHint",  cHint,  colors.none, styles.italic)

-- 5. 【波浪线】
Group.new("DiagnosticUnderlineError", colors.none, colors.none, styles.undercurl, cError)
Group.new("DiagnosticUnderlineWarn",  colors.none, colors.none, styles.undercurl, cWarn)
Group.new("DiagnosticUnderlineInfo",  colors.none, colors.none, styles.undercurl, cInfo)
Group.new("DiagnosticUnderlineHint",  colors.none, colors.none, styles.undercurl, cHint)

-- 6. 特殊边框
Group.new("HoverBorder", colors.yellow, colors.none, styles.NONE)
-- 补充：让 Telescope 的边框也变漂亮
Group.new("TelescopeBorder", colors.base1, colors.none, styles.NONE)
