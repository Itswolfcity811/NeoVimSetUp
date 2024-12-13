sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

mkdir ~/.config/nvim/

cd ~/.config/nvim/

touch init.lua

pip3 install pynvim
pip3 install --upgrade pynvim

cat > init.lua << EOF
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- List your plugins here
Plug('theblob42/drex.nvim')
Plug('kyazdani42/nvim-web-devicons') -- optional

Plug("'ryleelyman/latex.nvim'")

Plug('puremourning/vimspector')
Plug('mfussenegger/nvim-jdtls')
Plug('elementdavv/vimspector-jdtls')

function UpdateRemotePlugins(...)
    -- Needed to refresh runtime files
    --let &rtp=&rtp
    vim.cmd("UpdateRemotePlugins")
end

Plug('gelguy/wilder.nvim', { ['do'] = UpdateRemotePlugins })

Plug('nvim-treesitter/nvim-treesitter')

Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')

-- For vsnip users.
Plug('hrsh7th/cmp-vsnip')
Plug('hrsh7th/vim-vsnip')

--package.path = "~/nvim/plugged/nvim-cmp"
-- Set up nvim-cmp.
local cmp = require("nvim-cmp")

cmp.setup({
snippet = {
  -- REQUIRED - you must specify a snippet engine
  expand = function(args)
    vim.fn["vsnip#anonymous"](args.body) -- For vsnip users.
    -- require('luasnip').lsp_expand(args.body) -- For luasnip users.
    -- require('snippy').expand_snippet(args.body) -- For snippy users.
    -- vim.fn["UltiSnips#Anon"](args.body) -- For ultisnips users.
    -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
  end,
},
window = {
  -- completion = cmp.config.window.bordered(),
  -- documentation = cmp.config.window.bordered(),
},
mapping = cmp.mapping.preset.insert({
  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.abort(),
  ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set select to false to only confirm explicitly selected items.
}),
sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
-- Set configuration for specific filetype.
--[[ cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' },
  }, {
    { name = 'buffer' },
  })
})
require("cmp_git").setup() ]]-- 

-- Use buffer source for / and ? (if you enabled native_menu, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled native_menu, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
  capabilities = capabilities
}

require('latex').setup{
  conceals = {
    enabled = {
      "greek",
      "math",
      "script",
      "delim",
      "font"
    },
    add = {}
  },
  imaps = {
    enabled = true,
    add = {},
    default_leader = "\`"
  },
  surrounds = {
    enabled = false,
    command = "c",
    environment = "e",
  },
}

call("plug#end")
EOF

sed -i 's/*/EOF/g' init.lua

echo "Completed Install!"
