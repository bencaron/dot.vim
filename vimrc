" Load Pathogen
call pathogen#infect()
call pathogen#helptags()

set nocompatible

if has("gui_running")
    "set fullscreen
    " Transparency
    "set transparency=2
    " Line number settings
    "set relativenumber
    "autocmd InsertEnter * :set number
    "autocmd InsertLeave * :set relativenumber
    "set numberwidth=5

    colorscheme murphy

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


""""""""""""
" autoloads
""
" Automatically reload .vimrc when changing
autocmd! bufwritepost .vimrc source %

" Arduino mode
au BufNewFile,BufRead *.pde setf arduino

"VagrantFile mode
au BufNewFile,BufRead Vagrantfile setf ruby


" Extrait _en entier_! du script cd.vim de vim.sf.net
" Fait automatiquement un "cd" vers le répertoire du buffer
" courant
"au BufEnter *   execute ":lcd " . expand("%:p:h")
autocmd  BufEnter *   execute ":lcd " . expand("%:p:h")


""""""""""""
" Mappings
""""""""""""
"
" First, set , as leader key
let mapleader = ","

"map <F8> :Tlist<CR>
map <F8> :TagbarToggle<CR>
map <F9> :NERDTreeToggle<CR>

" Pour ajouter et enlever des commentaires. Suppose des commentaires
" avec des #.. :\ 
vmap ,ic :s/^/#/g<CR>:let @/ = ""<CR>
map  ,ic :s/^/#/g<CR>:let @/ = ""<CR>
vmap ,rc :s/^#//g<CR>:let @/ = ""<CR>
map  ,rc :s/^#//g<CR>:let @/ = ""<CR>

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


