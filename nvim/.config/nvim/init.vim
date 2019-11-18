call plug#begin()

Plug 'justinmk/vim-dirvish'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'

Plug 'joshdick/onedark.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'levelone/tequila-sunrise.vim'
Plug 'danilo-augusto/vim-afterglow'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'nanotech/jellybeans.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'shawncplus/skittles_berry'
Plug 'dsolstad/vim-wombat256i'
Plug 'sjl/badwolf'
Plug 'doums/darcula'
Plug 'relastle/bluewery.vim'

Plug 'dag/vim-fish'
Plug 'fatih/vim-go'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'

call plug#end()

let g:tmux_navigator_no_mappings = 1
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_types = 1

nnoremap <C-l> :nohlsearch<CR>
nnoremap <C-z> :FZF<CR>
nnoremap <C-c> :so $MYVIMRC<CR>
nnoremap <F8> :set  number! list!<CR>
nnoremap <silent> <C-Left>  :TmuxNavigateLeft<CR>
nnoremap <silent> <C-Down>  :TmuxNavigateDown<CR>
nnoremap <silent> <C-Up>    :TmuxNavigateUp<CR>
nnoremap <silent> <C-Right> :TmuxNavigateRight<CR>
autocmd FileType dirvish nnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>

let _color_list = ['onedark', 'palenight', 'tequila-sunrise', 'afterglow', 'deep-space', 'jellybeans', 'solarized', 'bluewery', 'wombat256i', 'badwolf', 'darcula']
let _color = _color_list[str2nr(matchstr(reltimestr(reltime()), '\v\.@<=\d+')[1:]) % len(_color_list)]
execute "color "._color
set termguicolors
set background=dark
highlight Normal guibg=None
highlight NonText guibg=None
highlight LineNr guibg=None
highlight StatusLine guibg=None guifg=None
highlight StatusLineNC guibg=None guifg=None
set number
set lazyredraw
set ttyfast
set backspace=indent,eol,start
set list lcs=trail:.,tab:»\ 
set nofoldenable

set backupcopy=yes

set statusline=
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
set statusline+=%{_color} " colorscheme
set statusline+=\ 

