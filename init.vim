" NeoVim Configuration
set mouse=a
set number
set relativenumber
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set autoindent
set list
set listchars=tab:▸\ ,trail:·
set clipboard=unnamedplus
set encoding=UTF-8
set tabstop=4
set foldmethod=syntax
" Optimize 
set synmaxcol=200
set lazyredraw
set showcmd
:let mapleader = ","

syntax on
" Auto reload content changed outside
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * :checktime
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
    \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == ''
      \ | checktime 
    \ | endif
autocmd FileChangedShellPost *
    \ echohl WarningMsg 
    \ | echo "File changed on disk. Buffer reloaded."
    \ | echohl None


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Resize pane
nmap <M-Right> :vertical resize +1<CR>    
nmap <M-Left> :vertical resize -1<CR>
nmap <M-Down> :resize +1<CR>
nmap <M-Up> :resize -1<CR>

" Search a hightlighted text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
nmap /\ :noh<CR>

" Plugins
call plug#begin('~/AppData/Local/nvim/plugged')

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" JSONC
Plug 'kevinoid/vim-jsonc'

" Airline
Plug 'vim-airline/vim-airline' 
Plug 'vim-airline/vim-airline-themes'

" One Dark
Plug 'joshdick/onedark.vim'

" Vim floaterm
Plug 'voldikss/vim-floaterm'

" NERDTree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

" Misc
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

" Vim commentary
Plug 'tpope/vim-commentary'

"Plug for visually displaying indent levels in code
Plug 'Yggdroot/indentLine'

" Vim Spector for debug
Plug 'puremourning/vimspector'

call plug#end()

" Load the One Dark color scheme.
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


" Quick edit and reload vim config
nnoremap  <leader>ve :edit ~/AppData/Local/nvim/init.vim<cr>

" Save file the traditional way
imap <C-s> <esc> :w <cr>
nmap <C-s> :w <cr>

let g:vimspector_logfile = expand('~/vimspector.log')
" Mapping phím F1 để compiler và chạy file *.c bằng gcc
nnoremap <leader>c :w <CR> :!gcc % -o %< <CR>:FloatermNew<CR>
"---------------------------------------------------------
" Liên kết file mapping cho Plugin coc.nvim
source ~/AppData/Local/nvim/settings/coc.vim
source ~/AppData/Local/nvim/settings/NERDTree.vim
source ~/AppData/Local/nvim/settings/fzf.vim
source ~/AppData/Local/nvim/settings/floaterm.vim
source ~/AppData/Local/nvim/settings/devicon.vim
"source ~/AppData/Local/nvim/settings/rainbow.vim
source ~/AppData/Local/nvim/settings/indent.vim
source ~/AppData/Local/nvim/settings/airline.vim
 source ~/AppData/Local/nvim/settings/vimspector.vim
