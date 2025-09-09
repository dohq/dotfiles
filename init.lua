-- init {{
vim.o.encoding = 'utf8'

local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd([[
if !v:vim_did_enter && has('reltime')
  let g:startuptime = reltime()
  augroup vimrc-startuptime
    autocmd! VimEnter * let g:startuptime = reltime(g:startuptime) | redraw | echomsg 'startuptime: ' . reltimestr(g:startuptime)
  augroup END
endif
]])

vim.cmd([[
augroup vimrc
  autocmd!
augroup END
]])
-- }}

require('plugins')
require('options')
require('keymaps')

require('gitsigns').setup {
  keymaps = {noremap = false},
  signs = {
    add = {hl = "GitGutterAdd", text = "+"},
    change = {hl = "GitGutterChange", text = "~"},
    delete = {hl = "GitGutterDelete", text = "_"},
    topdelete = {hl = "GitGutterDelete", text = "‾"},
    changedelete = {hl = "GitGutterChange", text = "~"}
  }
}

require('nvim-treesitter.configs').setup {
  ensure_installed = "maintained",
  highlight = {enable = true},
}

-- nvim-cmp
local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<TAB>'] = cmp.mapping.select_next_item(),
    ['<S-TAB>'] = cmp.mapping.select_prev_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    })
  },
  sources = {
    {name = "nvim_lsp"},
    {name = 'nvim_lua'},
    {name = 'buffer'},
    {name = 'path'},
    {name = 'vsnip'},
    {name = 'emoji'},
    {name = 'calc'},
  }
})

-- LSP
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  -- Mappings.
  local opts = {noremap=true, silent=true}
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
end

-- available server is
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
local nvim_lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lsp_opts = {capabilities = capabilities, on_attach = on_attach, flags = {debounce_text_changes = 150}}
nvim_lsp.gopls.setup(lsp_opts)
nvim_lsp.terraformls.setup(lsp_opts)
nvim_lsp.yamlls.setup(lsp_opts)
nvim_lsp.vimls.setup(lsp_opts)
