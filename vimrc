set nocompatible "We are VIM

"set t_Co=256 "force 256 colors

"set ttyfast

set encoding=utf-8
set fileencoding=utf-8

set mouse=a

if &t_Co > 2 || has("gui_running") "have colors
  syntax enable "syntac highlighting
  set hlsearch  "highlight search pattern
  set background=dark
  if &t_Co > 255 || has("gui_running")
    set termguicolors
    colorscheme solarized8_dark_flat
    " airline statusbar
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
    packadd vim-airline
    packadd vim-airline-themes
  else
    colo desert
  endif
endif

set backspace=indent,eol,start

let mapleader=","
let maplocalleader="\\"

syntax on "syntax highlighting
filetype on  "detect filetype
filetype plugin indent on "load indent file for filetype

set nomodeline
let g:secure_modelines_verbose=1

"TODO: check for djangoish directory?
augroup django
    autocmd!
    autocmd BufRead,BufNewFile models.py,views.py,forms.py,admin.py,urls.py setlocal ft=python.django
    autocmd BufNewFile,BufRead urls.py setlocal nowrap
augroup END

augroup gitcommit
    autocmd!
    autocmd FileType gitcommit setlocal textwidth=72
    autocmd FileType gitcommit setlocal spell
augroup END

augroup web
    autocmd BufNewFile,BufRead *.js, *.html, *.css setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END


set ofu=syntaxcomplete#Complete

set list "show special chars
set list listchars=tab:»·,eol:¶,trail:·,precedes:→,extends:←
set number "show line numbers

"interface
set ruler
set showcmd
set showmatch
set title "change the terminal's title
set number
set relativenumber
set cmdheight=2
set laststatus=2
"set statusline=%F%m%r%h%w%<\ %{&ff}\ %Y\ %{fugitive#statusline()}\ %=%l,%v\ (%L)\ %p%%
set scrolloff=3
set visualbell

set hidden "allow hidden buffers
"set autochdir


set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.obj,*.jpg,*.jpeg,*.png,*.gif
set wildmode=longest,list,full
set wildmenu

set nobackup
set undodir=~/.vim/undodir
set undofile

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

nnoremap <leader>i :set list!<cr>
nnoremap <leader>n :set number! relativenumber!<cr>

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

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let g:use_zen_complete_tag = 1
let g:user_zen_settings = { 'indentation':'    '}

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"inoremap <C-space> <C-x><C-o>

let g:secure_modelines_verbose=1

let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

"python tweaks
"let g:virtualenv_auto_activate = 1
let python_highlight_all = 1

"minibufexpl
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplUseSingleClick = 1

"tagbar
let g:tagbar_usearrows = 1
let g:tagbar_compact = 1
nnoremap <silent> <F9>   :TagbarToggle<CR>

"NERD tree
nnoremap <F8> :NERDTreeToggle<CR>
nnoremap <Leader><F8> :NERDTreeFind<CR>
let NERDChristmasTree = 1
let NERDTreeMinimalUI=1
let NERDTreeRespectWildIgnore=1

"surround
let g:surround_{char2nr("b")} = "{% block\1 \r..*\r &\1%}\r{% endblock %}"
let g:surround_{char2nr("i")} = "{% if\1 \r..*\r &\1%}\r{% endif %}"
let g:surround_{char2nr("w")} = "{% with\1 \r..*\r &\1%}\r{% endwith %}"
let g:surround_{char2nr("c")} = "{% comment\1 \r..*\r &\1%}\r{% endcomment %}"
let g:surround_{char2nr("f")} = "{% for\1 \r..*\r &\1%}\r{% endfor %}"
let g:surround_{char2nr("v")} = "{{ \1 \r..*\r &\1\r }}"

let g:syntastic_scss_checkers=['sassc', 'scss_lint']
"let g:syntastic_debug=1

" Rope AutoComplete
" let ropevim_vim_completion = 1
" let ropevim_extended_complete = 1
" let g:ropevim_autoimport_modules = ["os.*","traceback","django.*","lxml.etree","lxml.*"]
" imap <c-space> <C-R>=RopeCodeAssistInsertMode()<CR>

" paste without formatting it.
map <MouseMiddle> <Esc>"*p

" powerline statusbar
" set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim


" ctrlP
let g:ctrlp_extensions = ['tag', 'buffertag', 'mixed']
" let g:ctrlp_working_path_mode = 'ra'

set guioptions=-m

" ultisnips
"let g:UltiSnipsListSnippets="<tab>"
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:ultisnips_python_style = "google"

" jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#use_splits_not_buffers = "bottom"

let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_select_first = 0
let g:jedi#completions_enabled = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"

let g:jedi#goto_assignments_command = "<leader>pa"
let g:jedi#goto_definitions_command = "<leader>pd"
let g:jedi#documentation_command = "<leader>pk"
let g:jedi#usages_command = "<leader>pu"
let g:jedi#rename_command = "<leader>pr"


" YouCompleteMe
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:ycm_python_binary_path = 'python'

"python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF

