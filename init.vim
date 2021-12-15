" encode
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp932

" editor
set smartindent
set softtabstop=4
set shiftwidth=4
set ruler
set wildmenu
set number
syntax enable

" display
set list
set visualbell

" etc..
set noswapfile
set hidden
set clipboard+=unnamedplus
set ignorecase
set smartcase

" keymaps
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" plugin
call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'thosakwe/vim-flutter'
Plug 'dart-lang/dart-vim-plugin'
Plug 'tpope/vim-fugitive'

call plug#end()

" coc-flutter
function! TriggerFlutterHotReload() abort
    silent execute '!kill -SIGUSR1 $(pgrep -f "[f]lutter_tool.*run")'
endfunction
autocmd! BufWritePost *.dart call TriggerFlutterHotReload()

" airline
let s:sections = ['a', 'b', 'c', 'gutter', 'x', 'y', 'z', 'warning']
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' :'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = '☰ '
let g:airline_symbols.dirty='⚡'

" NerdTree
nmap <C-f> :NERDTreeToggle<CR>
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab

" airlline
let g:airline_extensions = ['branch', 'tabline', 'battery']
let g:airline_powerline_fonts = 1
let g:airline_theme = 'luna'
let g:airline_detect_spelllang = 1
let g:airline#extensions#readonly#enabled = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1

