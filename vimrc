"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"                                                                              "
"                       __   _ _ _ __ ___  _ __ ___                            "
"                       \ \ / / | '_ ` _ \| '__/ __|                           "
"                        \ V /| | | | | | | | | (__                            "
"                         \_/ |_|_| |_| |_|_|  \___|                           "
"                                                                              "
"                                                                              "
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

let $vimhome=fnamemodify(resolve(expand("~/.vimrc")), ':p:h')
let $vundle=$vimhome."/bundle/Vundle.vim"

" Be iMproved
set nocompatible

"=====================================================
"" Vundle settings
"=====================================================
filetype off
set rtp+=$vundle
call vundle#begin()

    Plugin 'VundleVim/Vundle.vim'               " let Vundle manage Vundle, required

    "-------------------=== Code/Project navigation ===-------------
    Plugin 'scrooloose/nerdtree'                " Project and file navigation
    Plugin 'majutsushi/tagbar'                  " Class/module browser
    Plugin 'kien/ctrlp.vim'                     " Fast transitions on project files

    "-------------------=== Other ===-------------------------------
    Plugin 'bling/vim-airline'                  " Lean & mean status/tabline for vim
    Plugin 'vim-airline/vim-airline-themes'     " Themes for airline
    Plugin 'Lokaltog/powerline'                 " Powerline fonts plugin
    "Plugin 'fisadev/FixedTaskList.vim'          " Pending tasks list
    "Plugin 'rosenfeld/conque-term'              " Consoles as buffers
    Plugin 'tpope/vim-surround'                 " Parentheses, brackets, quotes, XML tags, and more
    Plugin 'flazz/vim-colorschemes'             " Colorschemes

    "-------------------=== Snippets support ===--------------------
    Plugin 'garbas/vim-snipmate'                " Snippets manager
    Plugin 'MarcWeber/vim-addon-mw-utils'       " dependencies #1
    Plugin 'tomtom/tlib_vim'                    " dependencies #2
    Plugin 'honza/vim-snippets'                 " snippets repo

    "-------------------=== Languages support ===-------------------
    Plugin 'tpope/vim-commentary'               " Comment stuff out
    Plugin 'mitsuhiko/vim-sparkup'              " Sparkup(XML/jinja/htlm-django/etc.) support
    Plugin 'Rykka/riv.vim'                      " ReStructuredText plugin
    "Plugin 'Valloric/YouCompleteMe'             " Autocomplete plugin
    Plugin 'rkulla/pydiction'             " Autocomplete plugin

    "-------------------=== Python  ===-----------------------------
"    Plugin 'klen/python-mode'                   " Python mode (docs, refactor, lints...)
    Plugin 'scrooloose/syntastic'               " Syntax checking plugin for Vim

    "-------------------=== Tmp  ===--------------------------------
    Plugin 'corntrace/bufexplorer'
    Plugin 'mileszs/ack.vim'
    Plugin 'terryma/vim-multiple-cursors'

call vundle#end()                           " required
filetype on
filetype plugin on
filetype plugin indent on

"=====================================================
"" General settings
"=====================================================
syntax enable                               " syntax highlight

set t_Co=256                                " set 256 colors
set background=dark
colorscheme wombat256mod                    " set color scheme
"colorscheme solarized                      " set color scheme

set number                                  " show line numbers
set ruler
set ttyfast                                 " terminal acceleration

set tabstop=4                               " 4 whitespaces for tabs visual presentation
set shiftwidth=4                            " shift lines by 4 spaces
set smarttab                                " set tabs for a shifttabs logic
set expandtab                               " expand tabs into spaces
set autoindent                              " indent when moving to the next line while writing code

set cursorline                              " shows line under the cursor's line
set showmatch                               " shows matching part of bracket pairs (), [], {}

set enc=utf-8	                            " utf-8 by default

set nobackup 	                            " no backup files
set nowritebackup                           " only in case you don't want a backup file while editing
set noswapfile 	                            " no swap files

set backspace=indent,eol,start              " backspace removes all (indents, EOLs, start) What is start?

set scrolloff=10                            " let 10 lines before/after cursor during scroll

set clipboard=unnamed                       " use system clipboard

set exrc                                    " enable usage of additional .vimrc files from working directory
set secure                                  " prohibit .vimrc files to execute shell, create files, etc...

set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Additional mappings for Esc (useful for MacBook with touch bar)
inoremap jj <Esc>
inoremap jk <Esc>

" Set to auto read when a file is changed from the outside
set autoread
"
" " With a map leader it's possible to do extra key combinations
" " like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" " Fast saving
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>

"
" " :W sudo saves the file 
" " (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing and reloading of vimrc configs
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>e :e! ~/.vim/vimrc<cr>


"=====================================================
"" Tabs / Buffers settings
"=====================================================
"tab sball
"set switchbuf=useopen
"set laststatus=2
"nmap <F9> :bprev<CR>
"nmap <F10> :bnext<CR>
"nmap <silent> <leader>q :SyntasticCheck # <CR> :bp <BAR> bd #<CR>

"" Search settings
"=====================================================
set incsearch	                            " incremental search
set hlsearch	                            " highlight search results

"=====================================================
"" AirLine settings
"=====================================================
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" old vim-powerline symbols
let g:airline_left_sep = '⮀'  
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

"let g:airline_theme='badwolf'
let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_powerline_fonts=1

" switch buffer
nnoremap <C-tab> :bn<CR>
nnoremap <C-s-tab> :bp<CR>

"=====================================================
"" TagBar settings
"=====================================================
"let g:tagbar_autofocus=0
let g:tagbar_width=42
autocmd BufReadPost *.py call tagbar#autoopen()
"autocmd BufEnter *.py :call tagbar#autoopen(0)
"autocmd BufWinLeave *.py :TagbarClose
map <leader>b :TagbarToggle<CR>

"=====================================================
"" NERDTree settings
"=====================================================
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']     " Ignore files in NERDTree
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

"=====================================================
"" SnipMate settings
"=====================================================
let g:snippets_dir='~/.vim/vim-snippets/snippets'

"=====================================================
"" Riv.vim settings
"=====================================================
let g:riv_disable_folding=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround.vim config
" Annotate strings with gettext 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>

"=========================================================
" => bufExplorer plugin
"=========================================================
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>

"=========================================================
" => Ack searching and cope displaying
"    requires ack.vim - it's much better than vimgrep/grep
"=========================================================
" Use the the_silver_searcher if possible (much faster than Ack)
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
endif

" When you press gv you Ack after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" Open Ack and put the cursor in the right position
map <leader>g :Ack

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with Ack, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>

"=====================================================
" => CTRL-P
"=====================================================
let g:ctrlp_working_path_mode = 0
"
" let g:ctrlp_map = '<c-f>'
" map <leader>j :CtrlP<cr>
" map <c-b> :CtrlPBuffer<cr>
"
let g:ctrlp_by_filename = 1
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
"let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'
 
"=====================================================
"" Python settings
"=====================================================

" python executables for different plugins
"let g:pymode_python='python'
"let g:syntastic_python_python_exec='python'
"
"" rope
"let g:pymode_rope=0
"let g:pymode_rope_completion=0
"let g:pymode_rope_complete_on_dot=0
"let g:pymode_rope_auto_project=0
"let g:pymode_rope_enable_autoimport=0
"let g:pymode_rope_autoimport_generate=0
"let g:pymode_rope_guess_project=0
"
"" documentation
"let g:pymode_doc=0
"let g:pymode_doc_key='K'
"
"" lints
"let g:pymode_lint=0
"let g:pymode_lint_on_write = 0
"let g:pymode_lint_on_fly = 0
"let g:pymode_lint_checkers = ['pyflakes', 'pep8']
"
"
"" virtualenv
"let g:pymode_virtualenv=1
"
"" breakpoints
"let g:pymode_breakpoint=1
"let g:pymode_breakpoint_key='<leader>b'
"
"" syntax highlight
"let g:pymode_syntax=1
"let g:pymode_syntax_slow_sync=1
"let g:pymode_syntax_all=1
"let g:pymode_syntax_print_as_function=g:pymode_syntax_all
"let g:pymode_syntax_highlight_async_await=g:pymode_syntax_all
"let g:pymode_syntax_highlight_equal_operator=g:pymode_syntax_all
"let g:pymode_syntax_highlight_stars_operator=g:pymode_syntax_all
"let g:pymode_syntax_highlight_self=g:pymode_syntax_all
"let g:pymode_syntax_indent_errors=g:pymode_syntax_all
"let g:pymode_syntax_string_formatting=g:pymode_syntax_all
"let g:pymode_syntax_space_errors=g:pymode_syntax_all
"let g:pymode_syntax_string_format=g:pymode_syntax_all
"let g:pymode_syntax_string_templates=g:pymode_syntax_all
"let g:pymode_syntax_doctests=g:pymode_syntax_all
"let g:pymode_syntax_builtin_objs=g:pymode_syntax_all
"let g:pymode_syntax_builtin_types=g:pymode_syntax_all
"let g:pymode_syntax_highlight_exceptions=g:pymode_syntax_all
"let g:pymode_syntax_docstrings=g:pymode_syntax_all
"
"" highlight 'long' lines (>= 80 symbols) in python files
"augroup vimrc_autocmds
"    autocmd!
"    autocmd FileType python,rst,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
"    autocmd FileType python,rst,c,cpp match Excess /\%81v.*/
"    autocmd FileType python,rst,c,cpp set nowrap
"    autocmd FileType python,rst,c,cpp set colorcolumn=80
"augroup END
"
"" code folding
"let g:pymode_folding=0
"
"" pep8 indents
"let g:pymode_indent=1
"
"" code running
"let g:pymode_run=1
"let g:pymode_run_bind='<F5>'

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1
let g:syntastic_check_on_wq=0
let g:syntastic_check_on_open = 1
let g:syntastic_auto_jump = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_aggregate_errors=1
let g:syntastic_loc_list_height=5
let g:syntastic_error_symbol='X'
let g:syntastic_style_error_symbol='X'
let g:syntastic_warning_symbol='!'
let g:syntastic_style_warning_symbol='!'
let g:syntastic_python_checkers=['flake8', 'pydocstyle', 'python']
let g:syntastic_javascript_checkers = ['jshint']

" pydiction
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
let g:pydiction_menu_height = 10


" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-u>'
let g:multi_cursor_skip_key='<C-k>'
let g:multi_cursor_quit_key='<Esc>'

" YouCompleteMe
"set completeopt-=preview

"let g:ycm_global_ycm_extra_conf='~/.vim/ycm_extra_conf.py'
"let g:ycm_confirm_extra_conf=0

"nmap <leader>g :YcmCompleter GoTo<CR>
"nmap <leader>d :YcmCompleter GoToDefinition<CR>
