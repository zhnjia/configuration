"set runtimepath+=~/.vim,~/.vim/after
"set packpath+=~/.vim
"source ~/.vimrc

" ==================== Plugin ===================
call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'Valloric/YouCompleteMe'
Plug 'dracula/vim'
" Plug 'vim-airline/vim-airline'
Plug 'jreybert/vimagit'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'liuchengxu/space-vim-dark'
call plug#end()

" ==================== Basic configuration ====================
set number
set expandtab
set showmatch
set scrolloff=3
set nosmarttab
set softtabstop=4
set shiftwidth=4
set tabstop=4
set nobackup
set hlsearch
set cursorline
set background=dark
set ignorecase
set hidden
syntax on
" color dracula
color space-vim-dark

nmap j gj
nmap k gk
imap <C-f> <Right>
imap <C-e> <ESC>$A

let mapleader=","

" ==================== fzf configuration ====================
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 2

" key map
nmap <leader>F :FZF<CR>
nmap <leader>f :FZF %:p:h<CR>
nmap <leader>A :Ag<SPACE>
nmap <leader>B :Buffers<CR>
nmap <leader>E :Ex<CR>
nmap <leader>S :Lines<CR>
nmap <leader>W :Windows<CR>
nmap <F3> :Ag <C-R>=expand("<cword>")<CR><CR>

" ===== Tagbar =====
nmap <leader>T :TagbarOpenAutoClose<CR>
let g:tagbar_vertical = 20
