local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
  [[                               __                ]],
  [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
  [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
  [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
  [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
  [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}
dashboard.section.buttons.val = {
  dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
  dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
  dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
  dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
  dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
  dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
  -- NOTE: requires the fortune-mod package to work
  -- local handle = io.popen("fortune")
  -- local fortune = handle:read("*a")
  -- handle:close()
  -- return fortune
  return {
    "newcapital.in@gmail.com",
    "Mover linhas para cima   (v) Shift + j | Shift + k",
    "Mecher na identação      (v) Shift + j | Shift + k",
    "Resize                   (n)        option + setas",
    "Delete to end of line    (n)                     D",
    "Insert after the cursor  (n)                     a",
    "Delete two lines         (n)                   2dd",
    "Redo Changes             (n)              ctrl + r",
    "Search 'newcpital'       (n)           /newcapital",
    "Go to next search result (n)                     n",
    "Replace Go to Roll       (n)           :%s/Go/Roll",
    "Go to previous search result   (n)               N",
    "Go to matching parentheses or brackets   (n)     %",
    "",
    "ArrowFunction Snippets   (i)             af<enter>",
    "Check out commits        (n)             <space>gc",
    "console.log()            (i)            log<enter>",
  }
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
