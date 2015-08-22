"===========================�ҵ�Vim����============================"
" �������"{{{
" �� pathogen ����Ҳ���ڶ���Ŀ¼�У���ָ����·�� 
" runtime bundle/pathogen/autoload/pathogen.vim
" ���� pathogen
" execute pathogen#infect()
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$VIM/vimfiles/bundle/Vundle.vim
call vundle#begin()
call vundle#rc('$VIM/vimfiles/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"" Buffer explorer
Plugin 'fholgado/minibufexpl.vim'
Plugin 'https://github.com/gorodinskiy/vim-coloresque.git'
Plugin 'scrooloose/nerdcommenter'
Plugin 'https://github.com/Shougo/neocomplete.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Valloric/MatchTagAlways'
Plugin 'Lokaltog/vim-powerline'
Plugin 'edsono/vim-matchit'
Plugin 'tomasr/molokai'
Plugin 'pzich/phtmlSwitch-vim'
Plugin 'SirVer/ultisnips'
Plugin 'kien/ctrlp.vim'
"Bundle 'scrooloose/nerdtree'
"Plugin 'captbaritone/better-indent-support-for-php-with-html'

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
" ��������"{{{


set nocompatible
behave mswin
source $VIMRUNTIME/vimrc_example.vim

" �����ļ��������
filetype on
" ������⵽�Ĳ�ͬ���ͼ��ض�Ӧ�Ĳ��
filetype plugin on

" �Զ�ʶ�����
set fileencodings=ucs-bom,utf-8,cp936,big5

" �������ļ�
set nobackup

"���ó־ó����ļ����Ŀ¼
set undodir=$VIM/_undodir
set undofile
set history=1000

" ��������ɫ
colorscheme molokai

" ��ֹ�����˸
" set gcr=a:block-blinkon0
" ��ֹ��ʾ������
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" ��ֹ��ʾ�˵��͹�����
set guioptions-=m
set guioptions-=T


" ������ʾ״̬��
set laststatus=2
" ��ʾ��굱ǰλ��
set ruler
" �����к���ʾ
set number
" ������ʾ��ǰ��/��
set cursorline
set cursorcolumn
" ������ʾ�������
set hlsearch


" ���� gvim ��ʾ����
" ������Ϊ΢���źڡ�Consolas�Ļ������
" set guifont=YaHei\ Consolas\ Hybrid\ 11.5
set guifont=Microsoft\ YaHei\ Mono:h11.5

" �����﷨��������
syntax enable
" ������ָ���﷨������ɫ�����滻Ĭ�Ϸ���
syntax on

" ����Ӧ��ͬ���Ե���������
filetype indent on
" ���Ʊ����չΪ�ո�
set expandtab
" ���ñ༭ʱ�Ʊ��ռ�ÿո���
set tabstop=4
" ���ø�ʽ��ʱ�Ʊ��ռ�ÿո���
set shiftwidth=4
" �� vim �����������Ŀո���Ϊһ���Ʊ��
set softtabstop=4
"

" Win������ȫ����ʾ
if has("win32")
    au GUIEnter * simalt ~x
endif

"�����۵���ʽ
set foldmethod=marker
"}}}
"������ݼ�����"{{{
"�����ݼ���ǰ׺����<Leader>
let mapleader=","

noremap \ ,
" ���ÿ�ݼ���ѡ���ı��鸴����ϵͳ������
vnoremap <Leader>y "+y
" ���ÿ�ݼ���ϵͳ����������ճ���� vim
nmap <Leader>p "+p
nmap <Leader>P "+P
" ���α����Ӵ���
nnoremap <Leader>nw <C-W><C-W>
" ��ת���ҷ��Ĵ���
nnoremap <Leader>lw <C-W>l
" ��ת���󷽵Ĵ���
nnoremap <Leader>hw <C-W>h
" ��ת���Ϸ����Ӵ���
nnoremap <Leader>kw <C-W>k
" ��ת���·����Ӵ���
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
" MiniBufExplorer �������"{{{
" ��ʾ/���� MiniBufExplorer ����
map <Leader>bl :MBEToggle<cr>
map <F9> :MBEToggle<cr>
" buffer �л���ݼ�
"map <C-Tab> :MBEbn<cr>
"map <S-Tab> :MBEbp<cr>
map <c-n> :MBEbn<cr>
map <c-m> :MBEbp<cr>
"�����ָ�ڴ�С
nmap <M-j> :resize +3<CR>
nmap <M-k> :resize -3<CR>
nmap <M-l> :vertical resize -3<CR>
nmap <M-h> :vertical resize +3<CR>
"������ʾ�б�Ϊ���
"let g:miniBufExplVSplit = 20   " column width in chars
let g:miniBufExplUseSingleClick = 1
" MiniBufExpl Colors
hi MBENormal               guifg=#808080 
hi MBEChanged              guifg=#F1266F 
hi MBEVisibleNormal        guifg=#A6DB29 
hi MBEVisibleChanged       guifg=#F1266F 
hi MBEVisibleActiveNormal  guifg=#5DC2D6 
hi MBEVisibleActiveChanged guifg=#F1266F 
"}}}
"UltiSnips ����"{{{
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/snippets']
let g:UltiSnipsRemoveSelectModeMappings = 1
"}}}
"Neocomplete����"{{{
let g:neocomplete#enable_at_startup = 1
"�����б���
let g:neocomplete#max_list = 15
"�����б� keyword ����
let g:neocomplete#max_keyword_width = 40 

"�Զ���ȫ  
inoremap <leader>n <C-x><C-o>

"No scratch  ������scratch����
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
"{{{Python�������
"<F5>����Python3
au BufRead *.py map <buffer> <F5> :w<CR>:!c:\python34\python.exe % <CR>
""}}}

" �ļ�����ʶ������
au BufRead,BufNewFile *.less set ft=css syntax=css





" NERDTree ������� ����"{{{
"" �鿴�����ļ������ÿ�ݼ����ټǣ�file list
"nmap <Leader>fl :NERDTreeToggle<CR>
"nmap <F8> :NERDTreeToggle<CR>
"" ����NERDTree�Ӵ��ڿ��
"let NERDTreeWinSize=32
"" ����NERDTree�Ӵ���λ��
"let NERDTreeWinPos="right"
"" ��ʾ�����ļ�
""let NERDTreeShowHidden=1
"" NERDTree �Ӵ����в���ʾ���������Ϣ
"let NERDTreeMinimalUI=1
"" ɾ���ļ�ʱ�Զ�ɾ���ļ���Ӧ buffer
"let NERDTreeAutoDeleteBuffer=1
""}}}
