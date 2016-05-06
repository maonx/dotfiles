" Use Vim settings, rather then Vi settings (much better!).  
" This must be  first, because it changes other options as a side effect.

set nocompatible

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

call plug#begin()
Plug 'gorodinskiy/vim-coloresque'
Plug 'Shougo/neocomplete.vim'
"Neocomplete"{{{
let g:neocomplete#enable_at_startup = 1
"popup width
let g:neocomplete#max_list = 15
"keyword width
" let g:neocomplete#max_keyword_width = 40 

"auto complete  
inoremap <leader>n <C-x><C-o>

"No scratch  
set completeopt-=preview

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    "return neocomplete#close_popup() . "\<CR>"
    " For no inserting <CR> key.
    return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" :
" \ neocomplete#start_manual_complete()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

" custom dictionaries
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'php' : $HOME.'/.common.php'
    \ }
"let g:neocomplete#sources#omni#input_patterns.php =
"\ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
"let g:neocomplete#sources#omni#input_patterns.c =
"\ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?'
"let g:neocomplete#sources#omni#input_patterns.cpp =
"\ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl =
            \ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

" For smart TAB completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
"        \ <SID>check_back_space() ? "\<TAB>" :
"        \ neocomplete#start_manual_complete()
"  function! s:check_back_space() 
"    let col = col('.') - 1
"    return !col || getline('.')[col - 1]  =~ '\s'
"  endfunction

"}}}
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"UltiSnips "{{{
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/dotfiles/config/nvim/UltiSnips']
let g:UltiSnipsRemoveSelectModeMappings = 1
"}}}
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Nerd Tree"{{{
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '^NTUSER\.DAT']
let g:NERDTreeWinSize=30
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>
let g:NERDTreeDirArrows = 1
" if !WINDOWS()
"     let g:NERDTreeDirArrowExpandable = '▸'
"     let g:NERDTreeDirArrowCollapsible = '▾'
" endif
"}}}
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" vim-airline config (force color)"{{{
let g:airline_theme="luna"
let g:airline_powerline_fonts = 1
" turn on tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" switch buffers
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>
" turn off whitespace
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
"}}}

Plug 'ctrlpvim/ctrlp.vim'
" CTRL-P"{{{
" let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<leader>f'
map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_max_height = 20
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"}}}
"
call plug#end()


" Sets how many lines of history VIM has to remember
set history=500
set number                      "Line numbers are good
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set autoread                    "Reload files changed outside vim
set laststatus=2                "Always show the status line

colorscheme molokai "theme


" Enable filetype plugins
filetype plugin on
filetype indent on

" Enable syntax highlighting
syntax enable 

" Indent and tabs
set ai "Auto indent
set si "Smart indent

" Use spaces instead of tabs
set expandtab
" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2


" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

set undodir=~/.vim/undodir
set undofile


" Turn on the WiLd menu
set wildmenu

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

set fileencodings=ucs-bom,utf-8,cp936,big5,latin1
" Use Unix as the standard file type
set ffs=unix,dos,mac


" set foldmethod
set foldmethod=marker
set ruler
set colorcolumn=80
map - ^
" copy paste
vnoremap <Leader>y "+y
nmap <Leader>p "+p
nmap <Leader>P "+P
noremap <silent> <leader>R :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

set textwidth=78

" Fast saving
nmap <leader>w :w!<cr>

if has('gui_running') 
  set guifont=Hermit:h14
  set guioptions=""
endif
