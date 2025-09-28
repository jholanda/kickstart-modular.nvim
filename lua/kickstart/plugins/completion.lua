-- lua/plugins/completion.lua

return {
  {
    -- O motor de autocompletar principal
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter', -- Carrega o plugin quando você entra no modo de inserção
    dependencies = {
      -- Fonte de sugestões para o LSP (é o que lê as sugestões do fortls)
      'hrsh7th/cmp-nvim-lsp',

      -- Motor de snippets
      'L3MON4D3/LuaSnip',

      -- Fonte de sugestões para os snippets do LuaSnip
      'saadparwaiz1/cmp_luasnip',

      -- (Opcional, mas recomendado) Coleção de snippets prontos
      'rafamadriz/friendly-snippets',
    },
    config = function()
      -- Esta é a função de configuração que rodará depois que o plugin for carregado.
      -- É aqui que você configura o comportamento do nvim-cmp.

      local cmp = require 'cmp'
      local luasnip = require 'luasnip'

      -- Carrega os snippets da coleção 'friendly-snippets'
      require('luasnip.loaders.from_vscode').lazy_load()

      cmp.setup {
        snippet = {
          -- Diz ao cmp para usar o LuaSnip para expandir os snippets
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        -- Mapeamentos de teclas para o menu de autocompletar
        -- As fontes de onde o nvim-cmp vai pegar as sugestões
        sources = cmp.config.sources {
          { name = 'nvim_lsp' }, -- Sugestões do fortls
          { name = 'luasnip' }, -- Sugestões de Snippets
          { name = 'buffer' }, -- Sugestões do texto do arquivo aberto
        },
      }
    end,
  },
}
