" Vundle

set nocompatible
filetype off  " required for Vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle (required)
Plugin 'gmarik/Vundle.vim'

" My bundles here
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'groenewege/vim-less'
Plugin 'haya14busa/incsearch.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'klen/python-mode'
Plugin 'mileszs/ack.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-expand-region'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-ruby/vim-ruby'

call vundle#end()
filetype on
filetype plugin indent on

" Use , as Leader key
"let mapleader = ","

" Use Space as Leader key
let mapleader = "\<Space>"

" Discover text search object (http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/)
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Required for ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Stop that stupid window from popping up
map q: :q

" Disable python folding
let g:pymode_folding = 0
let g:pymode_lint = 0
let g:pymode_rope = 0
let g:pymode_options_colorcolumn = 0

let g:syntastic_python_checkers=["flake8"]
let g:syntastic_javascript_checkers=[]
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 4
let g:syntastic_python_flake8_args='--max-line-length=99'
let g:syntastic_html_checkers=[]
let g:syntastic_go_checkers=[]
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'

au BufRead,BufNewFile *.rs set conceallevel=0

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
set tabstop=4
set shiftwidth=4

" Set custom colorscheme only in MacVim (the same colorscheme doesn't
" translate well when using vim via iTerm)
if has("gui_running")
    set guioptions=egmrt
    set background=dark
    colorscheme Tomorrow-Night
endif

au Filetype ruby set tabstop=2 softtabstop=2 shiftwidth=2
au Filetype javascript set tabstop=2 softtabstop=2 shiftwidth=2

set listchars=tab:›\ ,trail:~,extends:>,precedes:<
set list

set laststatus=2

set t_Co=256

set guifont=Menlo:h12
set linespace=3

" Highlight search results
set hlsearch


" Relative/absolute line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set number
    set norelativenumber
  else
    set relativenumber
    set number
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

call NumberToggle()

" For MacVim, always show tabs (by default, tabs only show up when you have
" more than one tab open)
set showtabline=2


" For git gutter, make colors work properly on start
au VimEnter * highlight clear SignColumn
"let g:gitgutter_enabled = 0


" Disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>


" incsearch.vim
if has("gui_running")
    map / <Plug>(incsearch-forward)
    map ? <Plug>(incsearch-backward)
    map g/ <Plug>(incsearch-stay)
endif


" Save on unfocus
:au FocusLost * silent! wa


" Auto reload file changes on focus
set autoread


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


" Enable pathogen
"call pathogen#infect()
"call pathogen#helptags()


" for ctrlp
let g:ctrlp_map = '<Leader>t'  " Make it act like Command-T
set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip,*.pyc

" statusline flags for syntastic

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*


" Allow filewatchers to recognize when the file changes (needed for things
" like watchdog)

"set nobackup
"set noswapfile
"set nowritebackup

" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()
