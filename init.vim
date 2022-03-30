set encoding=utf-8
set number relativenumber
syntax enable
set noswapfile
set scrolloff=7
set backspace=indent,eol,start

" set mouse=a
"set paste

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix
set incsearch
set hlsearch
set clipboard=unnamedplus

" TextEdit might fail if hidden is not set.
set hidden
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c


call plug#begin('~/.config/nvim/plugged')
 
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'joshdick/onedark.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Code and files fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Window chooser
Plug 't9md/vim-choosewin'

" python keyword highlight
" Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins'}
Plug 'vim-python/python-syntax'

" Terminal
Plug 'voldikss/vim-floaterm'

"Black auto format python code
Plug 'python/black'

"TagBar
Plug 'preservim/tagbar'

"NerdTree Git
Plug 'Xuyuanp/nerdtree-git-plugin'

" Initialize plugin system
call plug#end()

colorscheme onedark


" Overwrite some color highlight 
if (has("autocmd"))
	augroup colorextend
		autocmd ColorScheme 
			\ * call onedark#extend_highlight("Comment",{"fg": {"gui": "#728083"}})
		autocmd ColorScheme 
			\ * call onedark#extend_highlight("LineNr", {"fg": {"gui": "#728083"}})
	augroup END
endif

" Disable automatic comment in newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" clear empty spaces at the end of lines on save of python files
autocmd BufWritePre *.py :%s/\s\+$//e
" clear empty spaces at the end of lines on save of python files
autocmd BufWritePre *.py execute ':Black'
  

" Other setting
for setting_file in split(glob(stdpath('config').'/settings/*.vim'))
	execute 'source' setting_file
endfor

let g:python_highlight_all = 1

" Run python Code
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
