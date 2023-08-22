set nocompatible "We are VIM

set encoding=utf-8
set fileencoding=utf-8

set mouse=a

set backspace=indent,eol,start

let mapleader=","
let maplocalleader="\\"

set ttimeout
set ttimeoutlen=100

filetype on  "detect filetype
filetype plugin indent on "load indent file for filetype

set nomodeline
let g:secure_modelines_verbose=1

augroup django
    autocmd!
    autocmd BufRead,BufNewFile models.py,views.py,forms.py,admin.py,urls.py setlocal ft=python.django
    autocmd BufNewFile,BufRead urls.py setlocal nowrap
augroup END

augroup angular
    autocmd!
    autocmd VimEnter * if !empty(globpath('.','angular.json')) | let g:js_angular=1 | endif
    autocmd FileType typescript if exists('g:js_angular') | set ft=typescript.angular | endif
    autocmd FileType typescript if exists('g:js_angular') | call angular_cli#init() | endif
augroup END

augroup gitcommit
    autocmd!
    autocmd FileType gitcommit setlocal textwidth=72
    autocmd FileType gitcommit setlocal spell
augroup END

augroup MKDX
    au!
    au FileType markdown so $HOME/.vim/pack/ide/start/mkdx/ftplugin/markdown.vim
augroup END

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType typescript setlocal ts=2 sts=2 sw=2 expandtab

"augroup web
"    autocmd BufNewFile,BufRead *.js, *.html, *.css setlocal tabstop=2 softtabstop=2 shiftwidth=2
"augroup END


set list "show special chars
set list listchars=tab:»·,eol:¶,trail:·,precedes:→,extends:←

"interface
set ruler
set showcmd
set showmatch
set title
set number
set relativenumber
set cmdheight=2
set laststatus=2
set scrolloff=3
set visualbell

set guifont=SauceCodePro\ Nerd\ Font\ 10
set guioptions=-m

set hidden "allow hidden buffers

set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.obj
set wildmode=longest,list,full
set wildmenu

set backupcopy=yes
set nobackup
set undofile
set backupdir=~/.vim/backup//
set undodir=~/.vim/undodir//
set directory=~/.vim/swp//
set history=1000
set ignorecase "ignore case by default
set smartcase  "unless I use capitals

"folding
set foldmethod=indent
set foldlevel=99
set foldnestmax=4

"indent
set autoindent
set softtabstop=4 shiftwidth=4 expandtab


inoremap <F1> <Nop>
nnoremap <F1> <Nop>
vnoremap <F1> <Nop>
inoremap jk <Esc>

" undo in insert mode
inoremap <C-U> <C-G>u<C-U>

nnoremap <leader>i :set list!<cr>
nnoremap <leader>n :set relativenumber!<cr>

set tags=.tags,$HOME/.tags/python27.tags
"buffers
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
nnoremap <Leader>l :bnext<CR>
nnoremap <Leader>h :bprevious<CR>
nnoremap <Leader>c :Bdelete<CR>
nnoremap <Leader>o :%bd\|e#<CR>


"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"quickfix window
nnoremap <leader>q :call asyncrun#quickfix_toggle(8)<CR>

" paste without formatting it.
map <MouseMiddle> <Esc>"*p

" clear hlsearch
nnoremap <Leader>/ :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><Leader>/

nnoremap <Leader>g :Ggrep! <cword><CR><CR>

"tagbar
let g:tagbar_usearrows = 1
let g:tagbar_compact = 1
let g:tagbar_autofocus = 1
let g:tagbar_foldlevel = 1
nnoremap <silent> <F9> :TagbarToggle<CR>

"NERD tree
nnoremap <F8> :NERDTreeToggle<CR>
nnoremap <Leader><F8> :NERDTreeFind<CR>
let NERDChristmasTree = 1
let NERDTreeMinimalUI=1
let NERDTreeRespectWildIgnore=1
let NERDTreeShowHidden=1


" CtrlP
let g:ctrlp_extensions = ['tag', 'buffertag', 'mixed']
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
" let g:ctrlp_working_path_mode = 'ra'
nnoremap <Leader>p :CtrlPMRU<CR>


let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_enable_inlay_hints = 1
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" let g:ycm_server_python_interpreter = 'python3.8'

let g:ycm_extra_conf_globlist = ['~/devel/projects/*','!~/*']
nnoremap <leader>] :YcmCompleter GoTo<CR>
nnoremap <leader>\ :YcmCompleter GetDoc<CR>
nnoremap <leader>f :YcmCompleter FixIt<CR>

let g:ale_linters = {
\    'go': ['golangci-lint', 'gopls'],
\}
let g:ale_fixers = {
\    'javascript': ['eslint', 'prettier'],
\    'typescript': ['eslint', 'prettier'],
\    'typescriptreact': ['eslint', 'prettier'],
\    'python': ['ruff', 'black'],
\    'go': ['goimports'],
\}
let g:ale_completion_tsserver_autoimport = 1
let g:ale_cache_executable_check_failures = 1
let g:ale_python_auto_pipenv = 1
let g:ale_python_black_auto_pipenv = 1
let g:ale_python_flake8_auto_pipenv = 1
let g:ale_python_mypy_auto_pipenv = 1
let g:ale_python_mypy_ignore_invalid_syntax = 1
" let g:ale_python_black_options = '-S'
let g:ale_go_golangci_lint_options = '--fast'
nnoremap <leader>' :ALEFix<CR>

let g:SuperTabDefaultCompletionType = '<C-n>'
let g:SuperTabClosePreviewOnPopupClose = 1

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:ultisnips_python_style = "google"
let g:UltiSnipsSnippetsDir = '$HOME/.vim/snippets/'

let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*\.spec\.ts$'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*\.module\.ts$'] = ''

let g:mkdx#settings = { 'toc': { 'details': { 'enable': 1 } } }

let g:yats_host_keyword = 1

let g:terraform_fmt_on_save = 1

function! OnlyAndNerdtree()
    let currentWindowID = win_getid()

    windo if win_getid() != currentWindowID && &filetype != 'nerdtree' | close | endif
endfunction
command! Only call OnlyAndNerdtree()

"python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF

if &t_Co > 2 || has("gui_running") "have colors
  syntax enable "syntac highlighting
  set hlsearch  "highlight search pattern
  set background=dark
  if &t_Co > 255 || has("gui_running")
    set termguicolors
    "let g:solarized_termtrans=1
    colorscheme solarized8_flat
    " airline statusbar
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_theme='solarized'
    let g:airline_solarized_bg='dark'
    let g:airline#extensions#ale#enabled = 1
    packadd vim-airline
    packadd vim-airline-themes
  else
    colo desert
  endif
endif
