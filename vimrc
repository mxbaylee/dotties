" Leader
let mapleader = " "

" Use new regular expression engine
syntax on
set re=0

" colorscheme solarized
highlight ColorColumn ctermbg=5

set nowrap
set synmaxcol=200     " Limit syntax highlighting to lines under 200 chars
set clipboard=unnamed " Use system clipboard
set background=dark
set backspace=2       " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler             " show the cursor position all the time
set showcmd           " display incomplete commands
set incsearch         " do incremental searching
set laststatus=2      " Always display the status line
set autowrite         " Automatically :write before running commands
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set ignorecase
set smartcase
" set inccommand=nosplit

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" Use Ripgrep `brew install ripgrep`
" https://gist.github.com/darrylhebbes/4cc1b0995c265e8e08509b48954642c6
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
else
  let g:ctrlp_clear_cache_on_exit = 0
endif

" Resize windows when you resize vim
autocmd VimResized * :wincmd =

" Disable netrw
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Make it obvious where 95 characters is
set textwidth=95
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

" ESLint
let g:syntastic_javascript_checkers = ['eslint']

" Mouse support
set mouse=a

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Mouse Support
set mouse=a

" JS Support
let g:ale_fixers = { 'javascript': ['eslint'] }

" ## VIM MOVEMENTS ##
" Leader key
let mapleader = " "

" Quicker window movement
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>
nnoremap <leader># :b#<CR>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" ## VIM Plugin ##
if filereadable(expand("~/.vimrc.bundles"))
  call plug#begin('~/.vim/plugged')
  source ~/.vimrc.bundles
  call plug#end()
endif
