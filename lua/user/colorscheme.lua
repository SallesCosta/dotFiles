-- Material Theme config
--https://github.com/marko-cerovac/material.nvim
vim.g.material_style = 'deep ocean' -- oceanic / deep ocean / palenight / lighter / darker

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

vim.cmd [[
try
  colorscheme nord " material | nightfox | dayfox | nordfox | dawnfox | duskfox | terafox  | nord | tokyon
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme nightfox 
  set background=dark
endtry
]]
