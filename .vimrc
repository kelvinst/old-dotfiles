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
  Plugin 'tpope/vim-fugitive'
  Plugin 'itchyny/lightline.vim'
  Plugin 'tpope/vim-rails'
  Plugin 'vim-ruby/vim-ruby'
  Plugin 'tpope/vim-surround'
  Plugin 'myusuf3/numbers.vim'
  Plugin 'edkolev/tmuxline.vim'
  Plugin 'YankRing.vim'
  Plugin 'matchit.zip'
  Plugin 'kana/vim-textobj-user'
  Plugin 'nelstrom/vim-textobj-rubyblock'
  Plugin 'sjl/gundo.vim'
  Plugin 'junegunn/limelight.vim'
  Plugin 'Lokaltog/vim-easymotion'
  Plugin 'szw/vim-ctrlspace'

call vundle#end()            " required
filetype plugin indent on    " required

"*****************************************************************************
"" Easy motion config
"*****************************************************************************
map <Leader> <Plug>(easymotion-prefix)
nmap s <Plug>(easymotion-s)
nmap S <Plug>(easymotion-s2)

"*****************************************************************************
"" Some scroll options
"*****************************************************************************
set scrolloff=2
set sidescrolloff=5

"*****************************************************************************
"" tab for autocomplete
"*****************************************************************************
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()<cr>

"*****************************************************************************
"" Gundo config
"*****************************************************************************
nnoremap <F5> :GundoToggle<CR>
let g:gundo_close_on_revert = 1

"*****************************************************************************
"" CtrlP plugin
"*****************************************************************************
let g:ctrlp_map = ',t'

"*****************************************************************************
"" Some more colors
"*****************************************************************************
let g:hybrid_use_iTerm_colors = 1
colorscheme hybrid

if !has('gui_running')
  set t_Co=256
endif

"*****************************************************************************
"" Configuring indentation defaults
"*****************************************************************************
set expandtab
set shiftwidth=2
set softtabstop=2

"*****************************************************************************
"" Showing line numbers
"*****************************************************************************
set relativenumber
set number

"*****************************************************************************
"" Remove this horrible arrow keys :)
"" Thanks @jeank
"*****************************************************************************
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

"*****************************************************************************
"" Cycle windows even in insert mode
"*****************************************************************************
imap <c-w> <nop>
imap <c-w><c-w> <ESC><c-w><c-w>

"*****************************************************************************
"" JJ to quit insert mode!
"*****************************************************************************
imap jj <ESC>

"*****************************************************************************
"" Status bar
"*****************************************************************************
set linespace=0
set laststatus=2
let g:lightline = {
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'MyModified',
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

"*****************************************************************************
"" Syntax highlight!!!
"*****************************************************************************
syntax on

"*****************************************************************************
"" Usefull upcased abbreviations
"*****************************************************************************
cab W! w!
cab W w
cab Wa wa
cab Wq wq
cab wQ wq
cab WQ wq
cab Q! q!
cab Q q
cab E e
cab E! e

"*****************************************************************************
"" Remove trailing spaces on all files
"*****************************************************************************
autocmd BufWritePre * :%s/\s\+$//e

"*****************************************************************************
"" limelight!!!
"*****************************************************************************
let g:limelight_conceal_ctermfg = 'black'

"*****************************************************************************
"" matchit script
"*****************************************************************************
runtime macros/matchit.vim

"*****************************************************************************
"" backspace deletes indentation and end of line too please
"*****************************************************************************
set backspace=indent,eol,start
