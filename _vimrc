set smartcase
set ignorecase
set t_Co=256
set t_ut=
set hls
set nu

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf.vim'
Plug 'tomasr/molokai'
Plug 'haya14busa/incsearch.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'scrooloose/nerdtree'
call plug#end()

"fzf settings
source ~/.vim/vimFzfFuncs
nmap <C-p> :Files ./<CR>
nmap <leader>s :Tags<CR>

"airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
nmap <leader>- :bp<CR>
nmap <leader>= :bn<CR>
let g:airline_theme = 'codedark'
colorscheme codedark

"NERDTree settings
nmap <F8> :NERDTreeToggle<CR>

"incsearch settings
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
