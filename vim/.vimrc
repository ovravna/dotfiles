set nocompatible

" install vim plug if not exist
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'lifepillar/vim-solarized8'
Plug 'altercation/vim-colors-solarized'
Plug 'zeis/vim-kolor'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'itchyny/lightline.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'derekwyatt/vim-scala'
Plug 'morhetz/gruvbox'
Plug 'brooth/far.vim'
Plug 'tikhomirov/vim-glsl'
Plug 'dag/vim-fish'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'makerj/vim-pdf'
Plug 'sheerun/vim-polyglot' " syntax + indent
Plug 'AndrewRadev/switch.vim'
call plug#end()

" General

let mapleader = " "
syntax enable
set hls
set incsearch
set autowriteall
set ignorecase
set smartcase
set autoindent
set smartindent
set t_Co=256 "set 256 colors
set encoding=utf-8
set shiftwidth=4
set tabstop=4
set number relativenumber
set wildmenu
set path+=**
packadd termdebug "add terminal in vim
set background=dark
colorscheme gruvbox
" let g:gruvbox_contrast = 'hard'
" set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"
" Lightline
set laststatus=2 " enable lightline?
set noshowmode " dont show insert line
let g:lightline = { 'colorscheme': 'seoul256', }

" folding
" set foldmethod=indent   
" set foldnestmax=10
" set nofoldenable
" set foldlevel=2

" Fzf
let g:fzf_tags_command = 'ctags -R'
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
" Trigger completion
" inoremap <silent><expr> <c-ø> coc#refresh()

nnoremap <leader><cr> :run <CR>

let g:coc_global_extensions=[ 'coc-omnisharp' ]

" Coc tab to cycle
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use K to show documentation in preview window
nnoremap <silent> <leader>d :call <SID>show_documentation()<CR>

nnoremap <silent> <leader>s :call CocActionAsync('showSignatureHelp')<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> <leader>8 <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>9 <Plug>(coc-diagnostic-next)

" Coc Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

 " Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Using CocList
" Show all diagnostics
nnoremap <silent> <leader>e  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <leader>E  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <leader>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <leader>S  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <leader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <leader>R  :<C-u>CocListResume<CR>

" Cursor
let &t_SI = "\<esc>[5 q"
let &t_SR = "\<esc>[5 q"
let &t_EI = "\<esc>[2 q"

" FAR plugin
let g:far#enable_undo=1

" Switch plugin
let g:switch_custom_definitions =
    \ [
    \   ['.', '->'],
    \   {
      \     '\<[a-z0-9]\+_\k\+\>': {
      \       '_\(.\)': '\U\1'
      \     },
      \     '\<[a-z0-9]\+[A-Z]\k\+\>': {
      \       '\([A-Z]\)': '_\l\1'
      \     },
      \   }
    \ ]

" cpp
au FileType c,cpp inoremap ., ->

nnoremap <leader>w :w<CR>
nnoremap <leader>ws :w<CR> :source %<CR>
nnoremap <leader>p "*p
noremap <leader><Esc> :nohls<CR><Esc>
nnoremap <leader>z :w!<CR> <C-z> 
" nnoremap <C-x> :w<CR> <C-z>
noremap J 2<C-e>
noremap K 2<C-y>
inoremap ,, <Esc>


noremap <leader>m :make<Up><CR>
map <C-J> <Esc>:make<Up><CR>

" fzf
nnoremap <leader>f :Files<CR> 
nnoremap <leader>b :Buffers!<CR> 

" Scala
" Configuration for vim-scala
au BufRead,BufNewFile *.sbt set filetype=scala

" JSON comment highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+





