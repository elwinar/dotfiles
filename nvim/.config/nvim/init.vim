if &shell =~# 'fish$'
	set shell=sh
endif

call plug#begin()

" Seamless tmux/nvim split navigation.
Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-Left>  :TmuxNavigateLeft<CR>
nnoremap <silent> <C-Down>  :TmuxNavigateDown<CR>
nnoremap <silent> <C-Up>    :TmuxNavigateUp<CR>
nnoremap <silent> <C-Right> :TmuxNavigateRight<CR>

" Restarting neovim to reload the configuration is attrocious.
nnoremap <C-c> :so $MYVIMRC<CR>

" FZF integration.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <C-z> :FZF<CR>

" Native-navigation on steroids.
Plug 'justinmk/vim-dirvish'
autocmd FileType dirvish nnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>

" Basic conventions everywhere.
Plug 'editorconfig/editorconfig-vim'

" Use ALE for code completion.
let g:ale_completion_autoimport = 1
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_go_golangci_lint_options = '--enable gci'
let g:ale_go_langserver_executable = 'gopls'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_column_always = 1
" Linters.
let g:ale_linters = {
\   'go': ['golangci-lint'],
\}
" Fixers.
let g:ale_fixers = {
\	'go': ['goimports', 'trim_whitespace', 'remove_trailing_lines'],
\	'javascript': ['prettier', 'trim_whitespace', 'remove_trailing_lines'],
\	'css': ['prettier', 'trim_whitespace', 'remove_trailing_lines'],
\	'html': ['prettier', 'trim_whitespace', 'remove_trailing_lines'],
\	'php': ['php_cs_fixer', 'trim_whitespace', 'remove_trailing_lines'],
\}
Plug 'dense-analysis/ale'

" Table handling
Plug 'godlygeek/tabular'
nnoremap <C-t> :Tab /\|<CR>

" Vital visual cues.
set number
set lazyredraw
set ttyfast
set backspace=indent,eol,start
set list
set lcs=trail:-,tab:>\ 

" Fuck folding.
set nofoldenable

" Colorschemes.
Plug 'dracula/vim', { 'as': 'dracula' }

" Make the post-search window usable again!
nnoremap <C-l> :nohlsearch<CR>

" Copy-paste mode.
nnoremap <F8> :set  number! list!<CR>

" Go fuck yourself Ex mode.
map Q <Nop>
" You too terminal mode.
tnoremap <Esc> <C-\><C-n>

" For the duck-fingered days.
map ; :

" Watch daemon are a little lost with neovim's safe-write features.
set backupcopy=yes

call plug#end()

set termguicolors
colorscheme dracula
hi Normal guibg=none
hi LineNr guibg=none
hi StatusLine guibg=none
hi TabLine guibg=none
