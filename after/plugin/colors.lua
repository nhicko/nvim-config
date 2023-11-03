require('kanagawa').setup({
    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {
        theme = {
            all = {
                ui = {
                    bg_gutter = "none"
                }
            }
        }
    },
--    colors = {                   -- add/modify theme and palette colors
--        palette = {},
--        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
--    },
    overrides = function(colors) -- add/modify highlights
        local theme = colors.theme
        return {
        NormalFloat = { bg = "none" },
        FloatBorder = { bg = "none" },
        FloatTitle = { bg = "none" },

        -- Save an hlgroup with dark background and dimmed foreground
        -- so that you can use it where your still want darker windows.
        -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
        NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

        -- Popular plugins that open floats will link to NormalFloat by default;
        -- set their background accordingly if you wish to keep them dark and borderless
        LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
        MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
        TelescopeTitle = { fg = theme.ui.special, bold = true },
        TelescopePromptNormal = { bg = theme.ui.bg_p1 },
        TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
        TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
        TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
        TelescopePreviewNormal = { bg = theme.ui.bg_dim },
        TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
        }
    end,
    theme = "wave",              -- Load "wave" theme when 'background' option is not set
    background = {               -- map the value of 'background' option to a theme
        dark = "wave",           -- try "dragon" !
        light = "lotus"
    },
})

vim.cmd("colorscheme kanagawa")
--  require('rose-pine').setup({
--      --- @usage 'auto'|'main'|'moon'|'dawn'
--      variant = 'moon',
--      --- @usage 'main'|'moon'|'dawn'
--      dark_variant = 'main',
--      bold_vert_split = false,
--      dim_nc_background = false,
--      disable_background = false,
--      disable_float_background = false,
--      disable_italics = false,
--  
--      --- @usage string hex value or named color from rosepinetheme.com/palette
--      groups = {
--          background = 'base',
--          background_nc = '_experimental_nc',
--          panel = 'surface',
--          panel_nc = 'base',
--          border = 'highlight_med',
--          comment = 'muted',
--          link = 'iris',
--          punctuation = 'subtle',
--  
--          error = 'love',
--          hint = 'iris',
--          info = 'foam',
--          warn = 'gold',
--  
--          headings = {
--              h1 = 'iris',
--              h2 = 'foam',
--              h3 = 'rose',
--              h4 = 'gold',
--              h5 = 'pine',
--              h6 = 'foam',
--          }
--          -- or set all headings at once
--          -- headings = 'subtle'
--      },
--  
--      -- Change specific vim highlight groups
--      -- https://github.com/rose-pine/neovim/wiki/Recipes
--      highlight_groups = {
--          ColorColumn = { bg = 'rose' },
--  
--          -- Blend colours against the "base" background
--          CursorLine = { bg = 'foam', blend = 10 },
--          StatusLine = { fg = 'love', bg = 'love', blend = 10 },
--  
--          -- By default each group adds to the existing config.
--          -- If you only want to set what is written in this config exactly,
--          -- you can set the inherit option:
--          Search = { bg = 'gold', inherit = false },
--      }
--  })
--  
--  -- Set colorscheme after options
--  vim.cmd('colorscheme rose-pine')
