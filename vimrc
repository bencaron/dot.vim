" Load Pathogen
call pathogen#infect()
call pathogen#helptags()

"" Vundle setup
set nocompatible
" vundle wants this OFF
"filetype on
filetype off

" vundle setup
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" list my bundles
""""""""""
" chef
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "vadv/vim-chef"
autocmd FileType ruby,eruby set filetype=ruby.eruby.chef

" turn plugins on
filetype plugin indent on     " required!

"" /vundle


syntax enable

set background=dark
if &diff
  set t_Co=256
  colorscheme peaksea
else
"  colorscheme solarized
  "colorscheme advantage
  colorscheme murphy
endif

""""""""""""""""""""""""""""""""""""""""""""""""
" GUI mode
if has("gui")
    "set fullscreen
    " Transparency
    "set transparency=2
    " Line number settings
    "set relativenumber
    "autocmd InsertEnter * :set number
    "autocmd InsertLeave * :set relativenumber
    "set numberwidth=5

    colorscheme murphy
    "colorscheme advantage
    "colorscheme solarized

    "http://vim.wikia.com/wiki/Hide_toolbar_or_menus_to_see_more_text
    set guioptions-=T  "remove toolbar
    "http://vim.wikia.com/wiki/Configuring_the_cursor
    " Disable all blinking:
    set guicursor+=a:blinkon0
    " Remove previous setting:
    ":set guicursor-=a:blinkon0
    " Restore default setting:
    ":set guicursor&
    highlight Cursor guifg=white guibg=red
    "" FIXME: icursor?
    highlight iCursor guifg=white guibg=steelblue
endif


""""""""""""""""""""""""""""""""""""""""""""""""
" General/generic settings
""""""""""""""""""""""""""""""""""""""""""""""""


" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Parametres commun dans tous les cas
set visualbell
set incsearch
set hlsearch
set showmatch
set nowrap
set ruler

"set cindent
set smartindent
set autoindent
filetype indent on
filetype plugin on

"http://items.sjbach.com/319/configuring-vim-right
set hidden

" `a is more usefull than 'a, swap them
nnoremap ' `
nnoremap ` '

set wildmenu
set wildmode=list:longest

" case sensitive only if there is CAPS in search terms
set ignorecase
set smartcase

"/vim-right

"http://vim.wikia.com/wiki/Hide_toolbar_or_menus_to_see_more_text
":set guioptions-=m  "remove menu bar
":set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove Left-hand scroll bar

" surtout pour le python...
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smarttab
set expandtab

set pastetoggle=<F2>

"highlight TODO FIXME 
" http://stackoverflow.com/questions/4097259/in-vim-how-do-i-highlight-todo-and-fixme
syn match   myTodo   contained   "\<\(TODO\|FIXME|BUG\):"
hi def link myTodo Todo

""""""""""""""""""""""""""""""""""""""""""""""""
" plugin-specific configs
""""""""""""""""""""""""""""""""""""""""""""""""

" Powerline - bundle/powerline

set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

let g:Powerline_symbols = 'unicode'
" skwp or default or..?
"let g:Powerline_colorscheme = 'skwp'
let g:Powerline_colorscheme = 'default'

" Gundo
""""""""
let g:gundo_width = 60
let g:gundo_preview_height = 40
"let g:gundo_right = 1




""""""""""""""""""""""""""""""""""""""""""""""""
" autoloads
""""""""""""""""""""""""""""""""""""""""""""""""


" Automatically reload .vimrc when changing
autocmd! bufwritepost .vimrc source %

" Arduino mode
au BufNewFile,BufRead *.pde setf arduino

"VagrantFile mode
au BufNewFile,BufRead Vagrantfile setf ruby

"md is Markdown, not modula2 :P
au BufNewFile,BufRead *.md set filetype=markdown

" Extrait _en entier_! du script cd.vim de vim.sf.net
" Fait automatiquement un "cd" vers le répertoire du buffer
" courant
"au BufEnter *   execute ":lcd " . expand("%:p:h")
autocmd  BufEnter *   execute ":lcd " . expand("%:p:h")


""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""
"
" First, set , as leader key
let mapleader = ","

 
" Force back to normal mode from insert mode
" From http://learnvimscriptthehardway.stevelosh.com/chapters/10.html
inoremap jk <esc>

" Turn on Switch on -
nnoremap - :Switch<cr>

"Map Gundo
nnoremap <F2> :GundoToggle<CR>

"" BROKEN
"map <F8> :Tlist<CR>
map <F5> :TagbarToggle<CR>
map <F6> :NERDTreeToggle<CR>

" Pour ajouter et enlever des commentaires. Suppose des commentaires
" avec des #.. :\ 
vmap ,ic :s/^/#/g<CR>:let @/ = ""<CR>
map  ,ic :s/^/#/g<CR>:let @/ = ""<CR>
vmap ,rc :s/^#//g<CR>:let @/ = ""<CR>
map  ,rc :s/^#//g<CR>:let @/ = ""<CR>

" remove trailing whitespace"
nnoremap <Leader>rtw :%s/\s\+$//e<CR>

" splits tips from
" http://robots.thoughtbot.com/post/48275867281/vim-splits-move-faster-and-more-naturally
" shortcut from C-Wj to C-j
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" split below/right
set splitbelow
set splitright

nmap <C-S> :vsplit<CR>
"/ splits

"" Set sane tab mode
if has("macunix")
	" Mac only ; see after for Alt-base shortcut
	map <D-1> :tabn 1<CR>
	map <D-2> :tabn 2<CR>
	map <D-3> :tabn 3<CR>
	map <D-4> :tabn 4<CR>
	map <D-5> :tabn 5<CR>
	map <D-6> :tabn 6<CR>
	map <D-7> :tabn 7<CR>
	map <D-8> :tabn 8<CR>
	map <D-9> :tabn 9<CR>
	map <D-0> :tabnew<CR>
else
	" Linux
	map <A-1> :tabn 1<CR>
	map <A-2> :tabn 2<CR>
	map <A-3> :tabn 3<CR>
	map <A-4> :tabn 4<CR>
	map <A-5> :tabn 5<CR>
	map <A-6> :tabn 6<CR>
	map <A-7> :tabn 7<CR>
	map <A-8> :tabn 8<CR>
	map <A-9> :tabn 9<CR>
	map <A-0> :tabnew<CR>
endif

" suggested by @failshell
if &term =~ "xterm.*" || &term =~ "screen*"
  let &t_ti = &t_ti . "\e[?2004h"
  let &t_te = "\e[?2004l" . &t_te
  function! XTermPasteBegin(ret)
    set pastetoggle=<Esc>[201~
    set paste
    return a:ret
  endfunction
  map <expr> <Esc>[200~ XTermPasteBegin("i")
  imap <expr> <Esc>[200~ XTermPasteBegin("")
  cmap <Esc>[200~ <nop>
  cmap <Esc>[201~ <nop>
endif
