call plug#begin()
" """"""""""""""
" Features & UI.
" """"""""""""""
" 
" Table-related features.
Plug 'godlygeek/tabular'
" Deoplete for completion.
Plug 'Shougo/deoplete.nvim'
let g:deoplete#enable_at_startup = 1
set completeopt+=noinsert
set completeopt+=noselect
" Editorconfig because.
Plug 'editorconfig/editorconfig-vim'
" Seamless tmux/nvim split navigation.
Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-Left>  :TmuxNavigateLeft<CR>
nnoremap <silent> <C-Down>  :TmuxNavigateDown<CR>
nnoremap <silent> <C-Up>    :TmuxNavigateUp<CR>
nnoremap <silent> <C-Right> :TmuxNavigateRight<CR>
" FZF integration.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <C-z> :FZF<CR>
" Native-navigation on steroids.
Plug 'justinmk/vim-dirvish'
autocmd FileType dirvish nnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>

" """"""""""
" Languages.
" """"""""""
"
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'cakebaker/scss-syntax.vim'
Plug 'groenewege/vim-less'
Plug 'dag/vim-fish'
Plug 'pangloss/vim-javascript'
Plug 'sapphirecat/php-psr2-vim'
" Mardown.
Plug 'plasticboy/vim-markdown'
nnoremap <C-T> :TableFormat<CR>
" Golang & co.
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_auto_type_info = 0
nnoremap <C-M> :GoMetaLinter<CR>
" Golang-related deoplete features.
Plug 'deoplete-plugins/deoplete-go', {'do': 'make'}
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#builtin_objects = 1
let g:deoplete#sources#go#unimported_packages = 1
let g:deoplete#sources#go#pointer = 1
" gS and gJ to split an object. Go-AST aware.
Plug 'AndrewRadev/splitjoin.vim'

" """"""""""""""
" Color schemes.
" """"""""""""""

Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'dracula/dracula-theme', {'rtp': 'vim/'}
Plug 'jnurmine/Zenburn'
Plug 'NLKNguyen/papercolor-theme'

let s:color_list_dark = ['onehalfdark', 'gruvbox', 'molokai', 'dracula', 'zenburn', 'PaperColor']
let s:color_list_light = ['onehalflight', 'gruvbox', 'PaperColor']

" We need to end the plugin manager before changing the color scheme or it
" won't know they exist.
call plug#end()

" Pseudo-random generation function.
function! Random()
	return str2nr(matchstr(reltimestr(reltime()), '\v\.@<=\d+')[1:])
endfunction

" Select a random color scheme.
function! RandomColor()
	if &background == 'dark'
		execute "color ".s:color_list_dark[Random() % len(s:color_list_dark)]
	else
		execute "color ".s:color_list_light[Random() % len(s:color_list_light)]
	endif
endfunction

" Load a random color scheme everytime the editor loads the configuration.
set termguicolors
set background=dark
call RandomColor()

function! ToggleStyle()
	if &background == 'dark'
		set background=light
	else
		set background=dark
	endif
	echo &background
	call RandomColor()
endfunction

nnoremap <C-t> :call ToggleStyle()<cr>
nnoremap <C-s> :call RandomColor()<cr>

" """""""""""""""""""""
" Custom mappings & co.
" """""""""""""""""""""
"
" Restarting neovim to reload the configuration is attrocious. In addition, it
" changes the color scheme used….
nnoremap <C-c> :so $MYVIMRC<CR>
" Make the post-search window usable again!
nnoremap <C-l> :nohlsearch<CR>
" Copy-paste mode.
nnoremap <F8> :set  number! list!<CR>
" Quick navigation in quickfix buffers.
nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprevious<CR>
nnoremap <C-q> :cclose<CR>
" Go fuck yourself Ex mode.
map Q <Nop>
" For the duck-fingered days.
map ; :
" For the env files
vnoremap <C-x> :s/",/"\r/g<CR>
" Vital visual cues.
set number
set lazyredraw
set ttyfast
set backspace=indent,eol,start
set list lcs=trail:.,tab:»\ 
" Fuck folding.
set nofoldenable
" Watch daemon are a little lost with neovim's safe-write features.
set backupcopy=yes
" Minimal status line.
set statusline=
set statusline+=\ 
set statusline+=%{mode()} " current vim mode
set statusline+=\ 
set statusline+=%F " filename
set statusline+=\ 
set statusline+=%l/%L " cursorline/totalline
set statusline+=\ 
set statusline+=%c " cursorcolumn
set statusline+=\ 
set statusline+=%m " modified flag
set statusline+=%r " readonly flag
set statusline+=%=
set statusline+=%{strlen(&ft)?&ft:'none'} " filetype
set statusline+=\ 
set statusline+=%{get(g:,'colors_name','default')} " colorscheme
set statusline+=\ 
set statusline+=%{&background} " colorscheme

