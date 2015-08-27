"===========================我的VimForMac配置============================"
" 插件管理"{{{
" 将 pathogen 自身也置于独立目录中，需指定其路径 
" runtime bundle/pathogen/autoload/pathogen.vim
" 运行 pathogen
" execute pathogen#infect()
filetype off                  " required

" set the runtime path to include Vundle and initialize
" set rtp+=$VIM/vimfiles/bundle/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
call vundle#rc('~/.vim/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"" Buffer explorer
Plugin 'fholgado/minibufexpl.vim'
" css color display
Plugin 'https://github.com/gorodinskiy/vim-coloresque.git'
" file search 
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'https://github.com/Shougo/neocomplete.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Valloric/MatchTagAlways'
Plugin 'Lokaltog/vim-powerline'
Plugin 'edsono/vim-matchit'
" vim theme color
Plugin 'tomasr/molokai'
" vim snippets 
Plugin 'SirVer/ultisnips'
Plugin 'pzich/phtmlSwitch-vim'
" vim 内置中文输入法插件
Plugin 'maonx/vimim'

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
"
""}}}
" 基本配置"{{{


set nocompatible

" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on

" 自动识别编码
set fileencodings=utf-8,cp936

" 不备份文件
set nobackup

"设置持久撤销文件存放目录
set undodir=~/.vim/.undodir
set undofile
set history=1000

" 配置主题色
colorscheme molokai

" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
set cursorcolumn
" 高亮显示搜索结果
set hlsearch

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

"设置折叠方式
set foldmethod=marker
"}}}
"基本快捷键设置"{{{
"定义快捷键的前缀，即<Leader>
let mapleader=","

noremap \ ,
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p
nmap <Leader>P "+P
" 依次遍历子窗口
nnoremap <Leader>nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至左方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V>		"+gP
map <S-Insert>		"+gP

cmap <C-V>		<C-R>+
cmap <S-Insert>		<C-R>+

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.
" Use CTRL-G u to have CTRL-Z only undo the paste.

exe 'inoremap <script> <C-V> <C-G>u' . paste#paste_cmd['i']
exe 'vnoremap <script> <C-V> ' . paste#paste_cmd['v']

imap <S-Insert>		<C-V>
vmap <S-Insert>		<C-V>


" Use CTRL-S for saving, also in Insert mode
noremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR>
"}}}
" MiniBufExplorer 插件配置"{{{
" 显示/隐藏 MiniBufExplorer 窗口
map <Leader>bl :MBEToggle<cr>
map <F9> :MBEToggle<cr>
" buffer 切换快捷键
"map <C-Tab> :MBEbn<cr>
"map <S-Tab> :MBEbp<cr>
map <C-n> :MBEbn<cr>
map <C-m> :MBEbp<cr>
"调整分割窗口大小
"nmap <C-j> :resize +3<CR>
"nmap <C-k> :resize -3<CR>
"nmap <C-l> :vertical resize -3<CR>
"nmap <C-h> :vertical resize +3<CR>
"设置显示列表为左侧
"let g:miniBufExplVSplit = 20   " column width in chars
let g:miniBufExplUseSingleClick = 1
left g:did_minibufexplorer_syntax_inits = 1
" MiniBufExpl Colors
hi MBENormal               guifg=#808080 
hi MBEChanged              guifg=#F1266F 
hi MBEVisibleNormal        guifg=#A6DB29 
hi MBEVisibleChanged       guifg=#F1266F 
hi MBEVisibleActiveNormal  guifg=#5DC2D6 
hi MBEVisibleActiveChanged guifg=#F1266F 
"}}}
"UltiSnips 设置"{{{
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/Documents/snippets']
let g:UltiSnipsRemoveSelectModeMappings = 1
"}}}
"Neocomplete配置"{{{
let g:neocomplete#enable_at_startup = 1
"弹出列表长度
let g:neocomplete#max_list = 15
"弹出列表 keyword 长度
let g:neocomplete#max_keyword_width = 40 

"自动补全  
inoremap <leader>n <C-x><C-o>

"No scratch  不弹出scratch窗口
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
"{{{Python相关配置
"<F5>运行Python3
au BufRead *.py map <buffer> <F5> :w<CR>:!c:\python34\python.exe % <CR>
""}}}

" 文件类型识别设置
au BufRead,BufNewFile *.less set ft=css syntax=css
au BufRead,BufNewFile *.scss set ft=css syntax=css
au BufRead,BufNewFile css.snippets set ft=css syntax=css



"  弃用插件列表 "{{{
" NERDTree 插件配置  
" 查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
nmap <F8> :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="right"
" 显示隐藏文件
"let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
"}}}
