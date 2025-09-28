return {
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        styles = {

          comments = { fg = '#79b8a1', italic = false }, -- Disable italics in comments
          sidebars = 'dark',
          floats = 'dark',
          transparent = true,
        },
        on_colors = function(colors)
          colors.fg_gutter = '#4a5568'
          colors.bg = '#0d1117' -- Main background
          colors.bg_dark = '#010409' -- Darker background
          colors.bg_float = '#0d1117' -- Floating windows
          colors.bg_sidebar = '#0d1117' -- Sidebar background
          colors.comment = '#5c6370'
        end,
      }

      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'tokyonight-night'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
