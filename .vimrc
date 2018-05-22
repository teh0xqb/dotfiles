execute pathogen#infect()
"syntax on
filetype plugin indent on

call pathogen#helptags()

set autoindent
set ruler

" Don't redraw while executing macros (good performance config)
set lazyredraw 
" For regular expressions turn magic on
set magic
" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab
set smarttab

" Linebreak on 500 characters
set lbr
set tw=500

set backspace=2
set wildmenu
set showcmd

" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch 

" Height of the command bar
set cmdheight=2

" Set to auto read when a file is changed from the outside
set autoread

" Always display the status line, even if only one window is displayed
set laststatus=2

" Set line numbers
set number

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" set guifont:menlo:h16

" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces
