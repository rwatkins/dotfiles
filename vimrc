" Vundle

set nocompatible
filetype off  " required for Vundle

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle (required)
Bundle 'gmarik/vundle'

" My bundles here
Bundle 'airblade/vim-gitgutter'
Bundle 'kchmck/vim-coffee-script'
"Bundle 'kevinw/pyflakes-vim'  - Use Syntastic instead
Bundle 'kien/ctrlp.vim'
Bundle 'klen/python-mode'
"Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/syntastic'


" Use , as Leader key
let mapleader = ","

" Required for ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim

filetype on
filetype plugin indent on


" Disable python folding
let g:pymode_folding = 0


" Autocomplete(?)
set ofu=syntaxcomplete#Complete


" Basics

syntax enable

set autoindent
set cindent
set expandtab
set ruler
set smartindent
set softtabstop=4
set shiftwidth=4

set listchars=tab:>-,trail:~,extends:>,precedes:<
set list

set laststatus=2

set t_Co=256

set guifont=Inconsolata-g:h12
set linespace=1


" Relative/absolute line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

call NumberToggle()


" Set custom colorscheme only in MacVim (the same colorscheme doesn't
" translate well when using vim via iTerm)

if has("gui_running")
    set guioptions=egmrt
    set background=dark
    colorscheme Tomorrow-Night-Eighties
endif


" For MacVim, always show tabs (by default, tabs only show up when you have
" more than one tab open)
set showtabline=2


" For git gutter, make colors work properly on start
au VimEnter * highlight clear SignColumn


" Disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>


" Save on unfocus
:au FocusLost * silent! wa


" For highlighting long lines

nnoremap <Leader>H :call<SID>LongLineHLToggle()<cr>
"au BufRead,BufNewFile *.py :call<SID>LongLineHLToggle()<cr>
hi OverLength ctermbg=none cterm=none
match OverLength /\%>80v/
fun! s:LongLineHLToggle()
 if !exists('w:longlinehl')
  let w:longlinehl = matchadd('ErrorMsg', '.\%>80v', 0)
  echo "Long lines highlighted"
 else
  call matchdelete(w:longlinehl)
  unl w:longlinehl
  echo "Long lines unhighlighted"
 endif
endfunction

"set colorcolumn=0
au BufRead,BufNewFile *.clj set colorcolumn=0


" Enable pathogen
"call pathogen#infect()
"call pathogen#helptags()


" for ctrlp
let g:ctrlp_map = '<Leader>t'  " Make it act like Command-T
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc


" statusline flags for syntastic

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*


let g:syntastic_html_checkers=[]


au BufRead,BufNewFile *.rs setfiletype rust


" Allow filewatchers to recognize when the file changes (needed for things
" like watchdog)

"set nobackup
"set noswapfile
"set nowritebackup
