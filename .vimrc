"*****************************************************************************
"" Vundle
"*****************************************************************************
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

  Plugin 'gmarik/Vundle.vim'
  Plugin 'kchmck/vim-coffee-script'
  Plugin 'mustache/vim-mustache-handlebars'
  Plugin 'kien/ctrlp.vim'

call vundle#end()            " required
filetype plugin indent on    " required

"*****************************************************************************
"" Configuring indentation defaults
"*****************************************************************************
set expandtab
set shiftwidth=2
set softtabstop=2

"*****************************************************************************
"" Showing line numbers
"*****************************************************************************
set number

"*****************************************************************************
"" Syntax highlight!!!
"*****************************************************************************
syntax on

"*****************************************************************************
"" Insert mode key-mappings
"*****************************************************************************
imap jj <Esc>

"*****************************************************************************
"" Usefull upcased abbreviations
"*****************************************************************************
cab W! w!
cab Q! q!
cab Wq wq
cab Wa wa
cab wQ wq
cab WQ wq
cab W w
cab Q q

"*****************************************************************************
"" Remove trailing spaces on all files
"*****************************************************************************
autocmd BufWritePre * :%s/\s\+$//e

"*****************************************************************************
"" Highlighting the over lenghted lines
"*****************************************************************************
"highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
"match OverLength /\%81v.\+/
