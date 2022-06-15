if &shell =~# 'fish$'
	set shell=sh
endif

call plug#begin()

Plug 'christoomey/vim-tmux-navigator'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'justinmk/vim-dirvish'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'godlygeek/tabular'
Plug 'editorconfig/editorconfig-vim'

call plug#end()

" Set the leader key to an easily reachable key on my keyboard.
let mapleader=";"
"
" Restarting neovim to reload the configuration is attrocious.
nnoremap <leader>c :so $MYVIMRC<cr>

" Go fuck yourself Ex mode and terminal mode.
map Q <Nop>
map W <Nop>
tnoremap <Esc> <C-\><C-n>

" Watch daemon are a little lost with neovim's safe-write features.
set backupcopy=yes

" Seamless tmux/nvim split navigation.
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-Left>  :TmuxNavigateLeft<cr>
nnoremap <silent> <C-Down>  :TmuxNavigateDown<cr>
nnoremap <silent> <C-Up>    :TmuxNavigateUp<cr>
nnoremap <silent> <C-Right> :TmuxNavigateRight<cr>

" Treesitter for better syntax highlighting.
lua <<EOF
require 'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true,
	},
	ensure_installed = { "c", "lua", "go", "rust", "javascript", "typescript"},
	indent = {
		enable = true
	},
}
EOF

" LSP configuration
lua <<EOF
-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Memoize the keymap function.
	local opts = { noremap=true, silent=true }
	local function keymap(mapping, command) 
		vim.api.nvim_buf_set_keymap(bufnr, "n", mapping, command, opts)
	end

	keymap("<leader>lf", "<cmd>lua vim.lsp.buf.format { async = true }<cr>")
	keymap("<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>")
	keymap("<leader>lo", "<cmd>lua vim.lsp.buf.references()<cr>")
	keymap("<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>")

	vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format { async = false }]]

	if client.server_capabilities then
	end
end

local lsp = require('lspconfig')
lsp["gopls"].setup {
	on_attach = on_attach,
	root_dir = lsp.util.root_pattern('.git', 'src/go.mod', 'go.mod'),
}
lsp["eslint"].setup {
	on_attach = on_attach,
}
lsp["tsserver"].setup {
	on_attach = on_attach,
}
lsp["graphql"].setup{
	on_attach = on_attach,
}
EOF

" Completion using nvim-compe.
lua << EOF
vim.o.completeopt = "menuone,noselect"
local compe = require('compe')
compe.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 3;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    buffer = true;
    nvim_lsp = true;
  };
}
EOF

" Telescope rocks hard. |..|.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Format tables
nnoremap <leader>t <cmd>Tab /\|<cr>
"
" Make the post-search window usable again!
nnoremap <leader>s <cmd>nohlsearch<cr>

" Copy-paste mode.
nnoremap <leader>p <cmd>set number! list!<cr>

" Dirvish configuration
autocmd FileType dirvish nnoremap <silent><buffer> t <cmd>call dirvish#open('tabedit', 0)<cr>

" Colorscheme
set termguicolors
colorscheme dracula
hi Normal guibg=none
hi LineNr guibg=none
hi StatusLine guibg=none
hi TabLine guibg=none
set number
set lazyredraw
set ttyfast
set backspace=indent,eol,start
set list
set lcs=trail:-,tab:>\ 
