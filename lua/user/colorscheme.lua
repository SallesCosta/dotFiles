-- Material Theme config
vim.g.material_style = 'deep ocean'

require('material').setup({
  contrast = {
    sidebars = true,
    floating_windows = true,
  },
  italics = {
    keywords = true,
    functions = true,
  },
  contrast_filetypes = {
    'terminal',
    'packer',
    'qf',
  },
  disable = {
    borders = false,
    eob_lines = false
  },
  lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )

  async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)

  custom_highlights = {} -- Overwrite highlights with your own
})
-- vim.cmd 'colorscheme material'

vim.cmd [[
try
  colorscheme nightfox 
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
