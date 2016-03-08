" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

call plug#begin()

Plug 'rking/ag.vim'
let g:ag_prg="ag --vimgrep"
let g:ag_working_path_mode="r"

Plug 'ervandew/supertab'
Plug 'christoomey/vim-tmux-navigator'
Plug 'godlygeek/tabular'
" Tabular"{{{
if exists(":Tabularize")
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:\zs<CR>
    vmap <Leader>a: :Tabularize /:\zs<CR>
    nmap <Leader>a| :Tabularize / |<CR>
    vmap <Leader>a| :Tabularize / |<CR>
endif

"call the :Tabularize command each time you insert a | character
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction"}}}

Plug 'tpope/vim-surround'
Plug 'Shougo/deoplete.nvim'
" Deoplete
let g:deoplete#enable_at_startup = 1

" Group dependencies, vim-snippets depends on ultisnips
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<c-j>"

" On-demand loading
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
"}}}


Plug 'tomasr/molokai'
Plug 'ap/vim-css-color'
Plug 'hail2u/vim-css3-syntax'
Plug 'ctrlpvim/ctrlp.vim'
" CTRL-P"{{{
" let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<leader>f'
" map <leader>j :CtrlP<cr>
map <leader>b :CtrlPBuffer<cr>

let g:ctrlp_max_height = 20
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
" set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"}}}
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'bling/vim-bufferline'
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

Plug 'tpope/vim-commentary'
Plug 'mhinz/vim-startify'

Plug 'Yggdroot/indentLine' " highlight indent block
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_char = '│'
let g:rainbow_active = 1

Plug 'ryanoasis/vim-devicons'
call plug#end()



" set theme
colorscheme molokai

" Enable filetype plugins
filetype plugin on
filetype indent on


" fast saving
nmap <leader>w :w!<cr>

" :w sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

set fileencodings=ucs-bom,utf-8,cp936,big5,latin1

"always show current position
set ruler

" a buffer becomes hidden when it is abandoned
set hid

" ignore case when searching
set ignorecase

" when searching try to be smart about cases 
set smartcase

" don't redraw while executing macros (good performance config)
set lazyredraw 

" for regular expressions turn magic on
set magic

" show matching brackets when text indicator is over them
set showmatch 
" how many tenths of a second to blink when matching brackets
set mat=2

" show number
set number
set cursorline
set cursorcolumn

" set foldmethod
set foldmethod=marker

" files, backups and undo"{{{
" turn backup off, since most stuff is in svn, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Turn persistent undo on 
" means that you can undo even when you close a buffer/VIM
try
    set undodir=~/.config/nvim/undodirs
    set undofile
catch
endtry
"}}}

" text, tab and indent related"{{{
" use spaces instead of tabs
set expandtab

" be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

" linebreak on 79 characters
set lbr
set tw=79

set ai "auto indent
set si "smart indent
set wrap "wrap lines
"}}}

" moving around, tabs, windows and buffers"{{{
" Treat long lines as break lines (useful when moving around in them)
"map j gj
"map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
"map <space> /
"map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>


" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :bufdo bd<cr>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Switch CWD to custom directory 
"map <leader>tb :cd ~/Documents/taobaoSDK/TAE_SDK/htdocs<cr>

"}}}

" Editing mappings"{{{
" Remap VIM 0 to first non-blank character
map 0 ^
" copy paste
vnoremap <Leader>y "+y
nmap <Leader>p "+p
nmap <Leader>P "+P

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
"}}}

" Command mode related"{{{
" Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>

" $q is super useful when browsing on the command line
" it deletes everything until the last slash 
cno $q <C-\>eDeleteTillSlash()<cr>

" Bash like keys for the command line
cnoremap <C-A>    <Home>
cnoremap <C-E>    <End>
cnoremap <C-K>    <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>"}}}

" FileType {{{
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd BufRead *.ftl set ft=html
autocmd FileType html UltiSnipsAddFiletypes ftl
" }}}

" Misc"{{{
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>
"}}}

" Helper functions"{{{
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ag \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction
func! DeleteTillSlash()
    let g:cmd = getcmdline()

    if has("win16") || has("win32")
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
    else
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
    endif

    if g:cmd == g:cmd_edited
        if has("win16") || has("win32")
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
        else
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
        endif
    endif   

    return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
    return a:cmd . " " . expand("%:p:h") . "/"
  endfunc"}}}

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <C-A-h> :vertical resize +5<cr>
map <C-A-l> :vertical resize -5<cr>
map <C-A-j> :resize -5<cr>
map <C-A-k> :resize +5<cr>
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
" nnoremap <silent> <C-'> :TmuxNavigatePrevious<cr>

