"*****************************************************************************
"" Vundle 
"*****************************************************************************
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

  Plugin 'gmarik/Vundle.vim'
  Bundle 'kchmck/vim-coffee-script'
  Bundle 'mustache/vim-mustache-handlebars'
  Bundle 'kien/ctrlp.vim'
  
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
