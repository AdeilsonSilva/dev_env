"11/07/2015 - Vundle Installation
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.

" Plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" Fuzzy file finder for Vim
Plugin 'ctrlpvim/ctrlp.vim'

" Fast, as-you-type, fuzzy-search code completion engine
Plugin 'Valloric/YouCompleteMe'

" A Vim plugin which shows a git diff in the 'gutter'
Plugin 'airblade/vim-gitgutter'

" A vim plug-in which provides support for expanding abbreviations similar to emmet
Plugin 'mattn/emmet-vim'

" a plugin for visually displaying indent levels in Vim
Plugin 'Yggdroot/indentLine'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"-------------------------------------------------------------------------------
"12/10/2014
syntax on
"filetype on
set number
set expandtab					" insert space characters whenever the tab key is pressed
set autoindent                  " copy indent from current line
set autoread                    " read open files again when changed outside Vim
set autowrite                   " write a modified buffer on each :next , ...
set backspace=indent,eol,start  " backspacing over everything in insert mode
set backup                      " keep a backup file
set browsedir=current           " which directory to use for the file browser
set history=50                  " keep 50 lines of command line history
set popt=left:8pc,right:3pc     " print options
set ruler                       " show the cursor position all the time
set shiftwidth=4                " number of spaces to use for each step of indent
set showcmd                     " display incomplete commands
set smartindent                 " smart autoindenting when starting a new line
set tabstop=4                   " number of spaces that a <Tab> counts for

colorscheme molokai
"colorscheme elflord

let g:molokai_original = 1
let g:rehash256 = 1
:set t_Co=256
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone,preview

"Adicionado em 01/12/14; Alternancia do shell pro vim
noremap <C-d> :sh<cr>

"Adicionado em 23/04/15; PHP autocomplete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

"Adicionado em 15/09/15: Cola do clipboard sem identação
set pastetoggle=<F10>

" 11/07/2016
" imap <Tab> <C-P>
set backupdir=~/.vim/tmpFiles

" Tab navigation like Firefox.
"nnoremap <C-S-tab> :tabprevious<CR>
"nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
"inoremap <C-S-tab> <Esc>:tabprevious<CR>i
"inoremap <C-tab>   <Esc>:tabnext<CR>i
"inoremap <C-t>     <Esc>:tabnew<CR>
inoremap <C-t>   <Esc>:tabnew<CR>
"remap change tabs
nnoremap <C-j>   :tabprevious<CR>
nnoremap <C-k>   :tabnext<CR>
inoremap <C-j> 	 <Esc>:tabprevious<CR>i
inoremap <C-k>   <Esc>:tabnext<CR>i

" CtrlP Vim Plugin
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" Autocomplete stuff
au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
au FileType css setl ofu=csscomplete#CompleteCSS
au FileType c setl ofu=ccomplete#CompleteCpp


"Emmet setup
""type <C-e>, to activate it
let g:user_emmet_install_global = 0
autocmd FileType html,phtml,php,inc,css EmmetInstall
"Redefining Emmet trigger key
let g:user_emmet_leader_key='<C-E>'

" 2017-05-12 22:05
" YouCompleteMe Stuff
let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1

" 2017-05-23 10:54
" Colorscheme with terminal background transparency
hi Normal ctermbg=none
highlight NonText ctermbg=none


" 2017-05-23 17:23
" Search and replace remap
:nnoremap <Leader>s :%s/<C-r><C-w>//gc<Left><Left><Left>
" Remaps F7 to fix indentation on whole file and return to cursor position
map <F7> mzgg=G`z

" 2017-06-25 00:24
:nnoremap <Leader>w :w<ENTER>

" 2017-08-31 13:23
" Sets "soft" linebreak do wrap text
set wrap linebreak nolist
set breakindent
set breakindentopt=shift:4

" 2017-09-17 23:18
" Remaps F9 key to toggle ignorecase when searching
set ignorecase
nmap <F9> :set ignorecase! ignorecase?


" 20171217 14:29
" Improve CtrlP search time
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
