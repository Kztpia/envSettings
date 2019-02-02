set smartcase
set ignorecase
set t_Co=256
set t_ut=
set hls
set nu
set listchars=tab:>-,trail:~,extends:>,precedes:<
set list

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf.vim'
Plug 'tomasr/molokai'
Plug 'haya14busa/incsearch.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'joshdick/onedark.vim'
Plug 'tpope/vim-surround'
Plug 'edkolev/tmuxline.vim'
call plug#end()

colorscheme codedark

"tmuxline settings
"when powerline font not installed, use
"powerline separators will cause serious problem
let g:tmuxline_powerline_separators = 0

let g:tmuxline_preset = {
    \'a'       : '#S',
    \'b'       : '#{?client_prefix,#[reverse]<Prefix>#[noreverse],        }',
    \'win'     : '#I #W',
    \'cwin'    : '#I #W',
    \'x'       : '#{?client_prefix,#[reverse]<Prefix>#[noreverse],        }',
    \'y'       : '%Y-%m-%d | %H:%M',
    \'z'       : '#h',
    \'options' : {'status-justify' : 'left'}}

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
" for tmuxline + vim-airline integration
let g:airline#extensions#tmuxline#enabled = 1
" start tmuxline even without vim running
let airline#extensions#tmuxline#snapshot_file = "~/.tmux-status.conf"

"NERDTree settings
nmap <F8> :NERDTreeToggle<CR>

"you complete me
let g:ycm_key_list_stop_completion = ['<TAB>']
let g:ycm_add_preview_to_completeopt = 0
set completeopt-=preview
let g:ycm_confirm_extra_conf = 0
function AutoGoTo()
    if stridx(getline(line(".")),"#include")==0
        exe "normal :YcmCompleter GoToInclude\<CR>"
    else
        exe "normal :tj ".expand("<cword>")."\<CR>"
    endif
endfunction
nmap <C-]> :call AutoGoTo()<CR>

"incsearch settings
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
