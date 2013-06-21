" --- general -----------------------------------------------------------
"
set nocompatible   " be iMproved
scriptencoding utf-8
set modeline
set showmatch      " show matching parens
set nocursorline
set nocursorcolumn
set ruler
set laststatus=2   " always show status
set backspace=2
set noerrorbells
set history=5000
set wildmenu       " display suggestions above command line
set wildignore+=*/.git/*,*/.bzr/*,*~,*/build/*
set hidden
set scrolloff=2
set sidescrolloff=2
if has("mouse")
    set mouse=v    " enable mouse for visual mode only
    set mousehide
endif
set tags=tags
set ttyfast
let mapleader = ","

set encoding=utf-8

" --- formating ---------------------------------------------------------
"
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab     " Spaces statt Tabs
set smarttab
set linebreak     " Zeilen am Ende (visuelle) umbrechen
set number        " Zeilennummern anschalten
set listchars=tab:»\ ,trail:·,eol:¬
set tw=80

" --- folding ---------------------------------------------------------------
"
set nofoldenable
set foldmethod=syntax
set fillchars=fold:\

" --- searching -------------------------------------------------------------
"
set smartcase      " ignore case if pattern is all lowercase
set smartcase      " ignoriere ggf. ignorecase
set hlsearch       " highlight results
set wrapscan       " Suche oben fortsetzen
set sm
set incsearch      " Inkrementelle Suche von Teilergebnissen
set noedcompatible
set nogdefault     " g ist nicht Standard bei :s/foo/bar

" --- Vundle
"
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" github
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Shougo/neocomplcache.git'
Bundle 'Shougo/neosnippet.git'
Bundle 'altercation/vim-colors-solarized'
Bundle 'jnwhiteh/vim-golang'
Bundle 'kien/ctrlp.vim'
Bundle 'myusuf3/numbers.vim'
Bundle 'nvie/vim-flake8'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-sensible'
Bundle 'tsaleh/vim-supertab'
Bundle 'vim-scripts/TaskList.vim'
Bundle 'vimoutliner/vimoutliner'
Bundle 'samsonw/vim-task'
Bundle 'vim-pandoc/vim-pandoc'
Bundle 'Blackrush/vim-gocode'
Bundle 'sirtaj/vim-openscad'

if has("python")
    Bundle 'Lokaltog/vim-powerline'
endif

" vim.org
Bundle 'Align'
Bundle 'gnupg'

filetype plugin indent on     " required!

" --- NeoComplCache 
"
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_auto_completion_start_length = 3
let g:neocomplcache_manual_completion_start_length = 3
let g:neocomplcache_min_syntax_length = 3

if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

inoremap <expr><CR> neocomplcache#smart_close_popup() . "\<CR>"
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

nmap <Leader>nce :NeoComplCacheEnable<CR>
nmap <Leader>ncd :NeoComplCacheDisable<CR>

" --- powerline 
"
"let g:Powerline_symbols = 'unicode'
"let g:Powerline_symbols = 'fancy'

" --- ctrlp.vim
"
let g:ctrlp_extensions = ['buffertag']
let g:ctrlp_custom_ignore = { 'dir': 'node_modules\|\.git$\|\.hg$\|\.svn$\|^CVS$' }

" --- omni completion
"
set omnifunc=syntaxcomplete#Complete
set completeopt=menu

" --- gnupg
let g:GPGUsePipes = 1
let g:GPGPreferArmor = 1
let g:GPGPreferSign = 1
let g:GPGDefaultRecipients = [ "cert@kit.edu", "andreas.lorenz@kit.edu", "heiko.reese@kit.edu", "simon.weis@kit.edu", "tobias.dussa@kit.edu", "ulrich.stadie@kit.edu", "ursula.epting@kit.edu" ]

" --- gundo
"
let g:gundo_width = 60
let g:gundo_right = 1

" --- nerdtree
"
let NERDTreeChDirMode=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeIgnore=['\~$', '\.pyc$', '^.sass-cache$']
let NERDTreeMapJumpNextSibling=''
let NERDTreeMapJumpPrevSibling=''
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1

" --- highlighting, colors, fonts -------------------------------------------
"
syntax on
set t_Co=256
set background=dark
colorscheme solarized

if has("gui_running")
    set lines=60
    set columns=120
    set guifont=Inconsolata\ Medium\ 12
    set guioptions-=m
    set guioptions-=T  " hide toolbar
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    set guioptions-=b
endif

" --- persistent undo -------------------------------------------------------
"
if version >= 703
    set undodir=~/.undodir_vim
    set undofile
    set undoreload=10000 "maximum number lines to save for undo on a buffer reload
end
set undolevels=1000 "maximum number of changes that can be undone

" --- Auto-Commands ---------------------------------------------------------
"
au BufRead,BufNewFile *.scad set filetype=openscad
au BufNewFile,BufRead *.tex set tw=80 nosmartindent
au BufNewFile,BufRead *.bib set sw=2 ts=2 softtabstop=2
au BufNewFile,BufRead *.py set nosmartindent
au BufNewFile,BufRead wscript setf python

autocmd FileType make setlocal noexpandtab

autocmd FileType python set softtabstop=4
autocmd FileType python set shiftwidth=4
autocmd FileType python set omnifunc=pythoncomplete#Complete

" --- misc ------------------------------------------------------------------
"
set backspace=indent,eol,start

" sync with x-clipboard
set clipboard=unnamedplus

" Suffixes that get lower priority when doing tab completion for filenames.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

set spelllang=en_gb

" --- EMail ---
augroup tmp
    autocmd BufReadPre,FileReadPre *.tmp setlocal formatoptions=aw2tq
    autocmd BufReadPre,FileReadPre *.tmp let &t_SI = "\<Esc>]12;red\x7"
    autocmd BufReadPre,FileReadPre *.tmp let &t_EI = "\<Esc>]12;green\x7"
    autocmd BufReadPre,FileReadPre *.tmp map <C-m> <esc>:wq<cr>
    "autocmd BufReadPre,FileReadPre *.tmp setlocal invspell
    autocmd BufReadPre,FileReadPre *.tmp map <C-D> setlocal spelllang=de_DE
    autocmd BufReadPre,FileReadPre *.tmp setlocal filetype=text
    "autocmd BufReadPre,FileReadPre *.tmp i
    autocmd BufReadPre,FileReadPre *.tmp setlocal cursorline!
    autocmd BufReadPre,FileReadPre *.tmp setlocal termencoding=latin1
    autocmd BufReadPre,FileReadPre *.tmp set tw=74
    autocmd BufReadPre,FileReadPre *.tmp set cc=+1
    "autocmd BufReadPre,FileReadPre *.tmp
augroup END
set comments+=:#
set comments+=:+\ 
set comments+=:*\ 
set comments+=:o\ 
set comments+=:-\ 

" --- key mappings ----------------------------------------------------------

" reflow a para with Q:
nnoremap Q gqap
" reflow visually highlighted lines with Q:
vnoremap Q gq

" Gundo on F5
nnoremap <F5> :GundoToggle<CR>
