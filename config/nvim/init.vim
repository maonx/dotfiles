call plug#begin()

Plug 'godlygeek/tabular'
Plug 'tpope/vim-surround'
Plug 'Shougo/deoplete.nvim'

" Group dependencies, vim-snippets depends on ultisnips
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

call plug#end()

" Deoplete
let g:deoplete#enable_at_startup = 1
