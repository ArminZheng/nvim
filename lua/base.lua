-- 禁用兼容模式，允许使用 Neovim 的一些高级功能。
-- vim.opt.compatible = false -- Neovim 中此项默认为 false，且已废弃，建议直接注释
-- 如果语法高亮功能可用，则启用它。
if vim.fn.has('syntax') == 1 then
    vim.opt.syntax = 'on'
end
-- 显示行号。
vim.opt.number = true
vim.opt.relativenumber = true
-- 不显示行尾空格。
vim.opt.list = true
vim.opt.listchars:append('trail:·')
-- 设置 Tab 键宽度为 4 个空格。
vim.opt.tabstop = 4
-- 开启自动缩进。
vim.opt.autoindent = true
-- 将 Tab 转换为空格。
vim.opt.expandtab = true
-- 设置缩进宽度为 4 个空格。
vim.opt.shiftwidth = 4
-- 在括号匹配时高亮显示匹配的括号。
vim.opt.showmatch = true
-- 设置文件编码，可以处理多种编码的文件。
vim.opt.fileencodings = {'utf-8', 'ucs-bom', 'gb18030', 'gbk', 'gb2312', 'cp936', 'iso-8859-1'}
-- 设置当前 Vim 编码。
vim.opt.encoding = 'utf-8'
-- 告诉编辑器终端使用什么编码
-- vim.opt.termencoding = 'utf-8' -- 原生强制使用 UTF-8。不再需要
-- 启用 Neovim 的真彩色支持
vim.opt.termguicolors = true
-- 设置 GUI 模式下的字体和大小。
vim.opt.guifont = 'Fira Code:h13'
-- 不自动折行。
vim.opt.wrap = false
-- 允许在 Neovim 和系统剪贴板之间复制粘贴
vim.opt.clipboard:append { 'unnamedplus' }
-- 设置脚本编码为 UTF-8
vim.scriptencoding = 'UTF-8'
-- 在终端标题中显示文件名
vim.opt.title = true

vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
-- vim.opt.laststatus = 2
vim.opt.laststatus = 3 -- Nvim 0.10.0 推荐使用全局状态栏
vim.opt.scrolloff = 5
-- vim.opt.shell = 'fish'
vim.opt.shell = 'zsh' -- 已改为你实际使用的 zsh
vim.opt.backupskip = '/tmp/*,/private/tmp/*'
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.ai = true -- Auto indent
vim.opt.si = true -- Smart indent
vim.opt.backspace = 'start,eol,indent'
vim.opt.path:append { '**' }
vim.opt.wildignore:append { '*/node_modules/*' }

-- sounds
-- Enable visual feedback
vim.o.visualbell = true
-- Disable error bells
vim.o.errorbells = false

-- auto save
-- vim.o.autowriteall = true -- 这个内置功能比较“粗暴”。不分青红皂白地保存一切
-- 现在的 gopls（Go 语言服务器）通常在内存中就能实时分析你的代码。如果你开启了自动保存，频繁的写盘操作可能会触发频繁的 LSP 重扫或外部构建脚本（如 go watch），导致电脑风扇狂转。
-- 插件方案更智能：如果你真的想要自动保存，通常会使用专门的插件（如 auto-save.nvim），它们可以设置“只在进入正文超过 1 秒没输入时保存”，或者“不保存空文件”，比 autowriteall 灵活得多。
