call plug#begin()

Plug 'justinmk/vim-dirvish'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go'
Plug 'christoomey/vim-tmux-navigator'

Plug 'joshdick/onedark.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'levelone/tequila-sunrise.vim'
Plug 'danilo-augusto/vim-afterglow'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'nanotech/jellybeans.vim'
Plug 'altercation/vim-colors-solarized'

call plug#end()

let g:tmux_navigator_no_mappings = 1
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_types = 1

nnoremap <C-l> :nohlsearch<cr>
nnoremap <C-f> :NERDTreeTabsToggle<cr>
nnoremap <C-z> :FZF<cr>
nnoremap <silent> <C-Left>  :TmuxNavigateLeft<cr>
nnoremap <silent> <C-Down>  :TmuxNavigateDown<cr>
nnoremap <silent> <C-Up>    :TmuxNavigateUp<cr>
nnoremap <silent> <C-Right> :TmuxNavigateRight<cr>
nnoremap <silent> <C-Tab>   :tabnext<cr>
nnoremap <silent> <C-S-Tab> :tabprevious<cr>
nnoremap <F8> :set  number! list!<cr>
autocmd FileType dirvish nnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>

let color_list = ['onedark', 'palenight', 'tequila-sunrise', 'afterglow', 'deep-space', 'jellybeans', 'solarized']
execute "color ".color_list[str2nr(matchstr(reltimestr(reltime()), '\v\.@<=\d+')[1:]) % len(color_list)]
set termguicolors
set background=dark
highlight Normal guibg=None
highlight NonText guibg=None
set number
set lazyredraw
set ttyfast
set backspace=indent,eol,start
set list lcs=trail:.,tab:»\ 
set nofoldenable
