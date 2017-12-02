scriptencoding utf-8

" no vi-compatible
" If vim detects a .vimrc, it will set this on it's own
set nocompatible

call plug#begin('~/.vim/bundle')

"" Better file browser
Plug 'scrooloose/nerdtree'
"" Relative numbering
Plug 'myusuf3/numbers.vim'
"" Code commenter
Plug 'scrooloose/nerdcommenter', { 'on': 'NERDTreeToggle' }
"" Airline uses this to show current branch
Plug 'tpope/vim-fugitive'
"" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"" Better autocompletion
Plug 'Shougo/neocomplcache.vim'
"" Git/mercurial/others diff icons on the side of the file lines
Plug 'mhinz/vim-signify'
"" Python and other languages code checker
Plug 'scrooloose/syntastic'
"" Paint css colors with the real color
Plug 'lilydjwg/colorizer', { 'for': ['javascript', 'html', 'css'] }
"" For JS
Plug 'pangloss/vim-javascript', { 'for': ['javascript'] }
Plug 'peterhoeg/vim-qml', { 'for': 'qml' }
" Fuzzy finder: fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'google/vim-searchindex'
Plug 'justinmk/vim-gtfo'
Plug 'mkitt/tabline.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
Plug 'Glench/Vim-Jinja2-Syntax'
call plug#end()

set hidden
" don't use \t, use 4 spaces instead
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" highlight cursor line and column
set cursorline
set cursorcolumn

" highlight the 80 char line
set cc=80

" Some toggles
set pastetoggle=<F9>
nnoremap <F5> :UndotreeToggle<cr>
map <F3> :NERDTreeToggle<CR>

" hidden startup messages
set shortmess=atI
" auto read and write
set autowrite
set autoread
" when deal with unsaved files ask what to do
set confirm
" no backup files
set nobackup
" other settings 
set langmenu=en_US.UTF-8
set mouse=a
set whichwrap+=<,>,h,l,[,]
set background=dark
set encoding=utf-8

set backspace=2 " make backspace work like most other apps
set backspace=indent,eol,start

" readme in numbers.vim plugin wars for vim >= 7.4
set number

" tab length exceptions on some file types
" Use 2 space for tab in html/js files
 autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
 autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
 autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2

" auto open or close NERDTree
" autocmd vimenter * if !argc() | NERDTree | endif
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" always show status bar
" Airline needs this
set laststatus=2
" incremental search
" set incsearch
" highlighted search results
set hlsearch
" search ignore case
set ignorecase
" muting search highlighting 
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" syntax highlight on
syntax on

" show line numbers
set nu

" tab navigation mappings
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm 
map tt :tabnew 
map ts :tab split<CR>


map <C-b> :Buffers<CR>
map <C-n> :Files<CR>

" navigate windows with meta+arrows
map <M-Right> <c-w>l
map <M-Left> <c-w>h
map <M-Up> <c-w>k
map <M-Down> <c-w>j

" Fav color scheme
colorscheme wombat256mod

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" autocompletion of files and commands behaves like zsh
" (autocomplete menu)
set wildmenu
set wildmode=full

" better backup, swap and undos storage
set directory=~/.vim/dirs/tmp//     " directory to place swap files in
set backup                        " make backup files
set backupdir=~/.vim/dirs/backups// " where to put backup files
set undofile                      " persistent undos - undo after you re-open the file
set undodir=~/.vim/dirs/undos//
set viminfo+=n~/.vim/dirs/viminfo
" store yankring history file there too
let g:yankring_history_dir = '~/.vim/dirs/'

" create needed directories if they don't exist
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif

" There used to be a pause when leaving the insert or visual
" Workaround: https://www.johnhawthorn.com/2012/09/vi-escape-delays/
set timeoutlen=1000 ttimeoutlen=0


" ============================================================================
" Plugins settings and mappings

" NERDTree ----------------------------- 

" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']


" Syntastic ------------------------------
" show list of errors and warnings on the current file
nmap <leader>e :Errors<CR>
" Whether to perform syntastic checking on opening of file
" This made it very slow on open, so don't
let g:syntastic_check_on_open = 0
" Don't check everytime i save the file
" I will call you when i need you
let g:syntastic_check_on_wq = 0
" By default, keep syntastic in passive mode
let g:syntastic_mode_map = { 'mode': 'passive' }
" Use :Sc to perform syntastic check
:command Sc :SyntasticCheck

" Check pylint for python and eslint for js
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_javascript_checkers = ['eslint']

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_ignore_case = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_auto_select = 1

let g:neocomplcache_enable_fuzzy_completion = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_fuzzy_completion_start_length = 1
let g:neocomplcache_auto_completion_start_length = 1
let g:neocomplcache_manual_completion_start_length = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_keyword_length = 1
let g:neocomplcache_min_syntax_length = 1
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" complete with workds from any opened file
let g:neocomplcache_same_filetype_lists = {}
let g:neocomplcache_same_filetype_lists._ = '_'
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()


" Signify ------------------------------

" The VCS list
" I am relatively new to tech so only introduced to git
let g:signify_vcs_list = [ 'git' ]
" mappings to jump to changed blocks
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

" Airline ------------------------------

let g:airline_powerline_fonts = 0
let g:airline_theme = 'simple'
let g:airline#extensions#whitespace#enabled = 1


" Show total lines in file
function! AirlineInit()
    let g:airline_section_z = airline#section#create_right(['%L'])
endfunction
autocmd VimEnter * call AirlineInit()

" to use fancy symbols for airline, uncomment the following lines and use a
" patched font (more info on the README.rst)
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif


" new file set title
autocmd BufNewFile *.sh,*.py exec ":call SetTitle()"
function SetTitle()
    if &filetype == 'sh'
        call setline(1,"\#!/bin/sh")

    elseif &filetype == 'python'
        call setline(1,"# coding=utf-8")

    endif
endfunction
autocmd BufNewFile * normal G

let g:fzf_action = {'ctrl-n': 'tab split','ctrl-x': 'split', 'ctrl-v': 'vsplit' }
