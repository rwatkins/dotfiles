" Vundle

set nocompatible
filetype off  " required for Vundle
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
call vundle#begin()

" let Vundle manage Vundle (required)
Plugin 'gmarik/Vundle.vim'


" My bundles here
"
" Languages
Plugin 'kchmck/vim-coffee-script'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-ruby/vim-ruby'

" Tools
Plugin 'airblade/vim-gitgutter'
Plugin 'haya14busa/incsearch.vim'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim', { 'do': './install --all' }
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-endwise'

" Colors
Plugin 'chriskempson/base16-vim'

call vundle#end()
filetype on
filetype plugin indent on

command! Noh noh
nnoremap <C-h> :noh<cr>

" Use Space as Leader key
let mapleader = "\<Space>"

" Trim trailing whitespace on save
autocmd BufWritePre *.rb,*.js,*.coffee :%s/\s\+$//e
nnoremap <Leader>s :%s/\s\+$//e<CR>:noh<CR>

" FZF
set rtp+=/usr/local/opt/fzf
nnoremap <Leader>t :FZF<CR>

" FZF/ripgrep
let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf,rs}"
  \ -g "!{.git,node_modules,vendor}/*" '
command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

" Ripgrep
nnoremap <Leader>r :Rg<Space>

" Stop that stupid window from popping up
map q: :q

" Disable python folding
let g:pymode_folding = 0
let g:pymode_lint = 0
let g:pymode_rope = 0
let g:pymode_options_colorcolumn = 0

let g:syntastic_python_checkers=["flake8"]
let g:syntastic_haskell_checkers=[]
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
let g:syntastic_enable_racket_racket_checker = 0

au BufRead,BufNewFile *.rs set conceallevel=0

" Autocomplete(?)
set ofu=syntaxcomplete#Complete

syntax enable

set autoindent
set cindent
set expandtab
set ruler
set smartindent
set softtabstop=4
set tabstop=4
set shiftwidth=4
set number relativenumber

" indent  allow backspacing over autoindent
" eol     allow backspacing over line breaks (join lines)
" start   allow backspacing over the start of insert; CTRL-W and CTRL-U
"         stop once at the start of insert.
set backspace=indent,eol,start

" Set custom colorscheme only in MacVim (the same colorscheme doesn't
" translate well when using vim via iTerm)
if has("gui_running")
  set guioptions=egmrt
  set background=dark
  colorscheme base16-oceanicnext
endif


"au Filetype haskell set tabstop=2 softtabstop=2 shiftwidth=2
au BufRead,BufNewFile *.hs set tabstop=2 softtabstop=2 shiftwidth=2
au Filetype javascript set tabstop=2 softtabstop=2 shiftwidth=2
au Filetype ruby set tabstop=2 softtabstop=2 shiftwidth=2

set listchars=tab:›\ ,trail:~,extends:>,precedes:<
set list

set laststatus=2

set t_Co=256

set guifont=Inconsolata-g:h13
set linespace=0

" Highlight search results
set hlsearch

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

" Map jj to Escape in insert mode
inoremap jj <Esc>

" incsearch.vim
if has("gui_running")
  map / <Plug>(incsearch-forward)
  map ? <Plug>(incsearch-backward)
  map g/ <Plug>(incsearch-stay)
endif

" Save on unfocus
au FocusLost * silent! wa

" Auto reload file changes on focus
set autoread

" For highlighting long lines
nnoremap <Leader>H :call<SID>LongLineHLToggle()<cr>
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

nnoremap <Leader>e :tabe<Space>

let g:netrw_liststyle = 3
let g:netrw_bufsettings = "noma nomod nu nobl nowrap ro number"
