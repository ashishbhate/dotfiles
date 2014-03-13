let g:Powerline_symbols = 'fancy'
set rtp+=/home/ab/Code/powerline/powerline/bindings/vim/
"set statusline=%t\ %y\ format:\ %{&ff};\ [%c,%l]\ [LEN=%L]
set laststatus=2
set t_Co=256
set relativenumber
set wildmenu
set wildmode=list:longest,full
set wildignore=*.o,*~,*.pyc,*.pyo,*.so,*.sw*,__pycache__
set timeoutlen=300
set ttimeoutlen=75
set hlsearch
set cc=80
let mapleader=","
colorscheme Tomorrow-Night-Bright
let g:Powerline_colorscheme='solarized'

" indentation rules for FFmpeg: 4 spaces, no tabs
set expandtab
set shiftwidth=4
set softtabstop=4
set cindent
set cinoptions=(0
" Allow tabs in Makefiles.
autocmd FileType make,automake set noexpandtab shiftwidth=8 softtabstop=8
autocmd FileType xml set shiftwidth=2 softtabstop=2
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'nerdtree'
map <C-e> :NERDTreeToggle<CR>
"Bundle 'vim-flake8'
"autocmd FileType python map <buffer> <F3> :call Flake8()<CR>
"Bundle 'klen/python-mode'
"let g:pymode_folding=0
"let g:pymode_lint=0
Bundle 'taglist.vim'
map <C-l> :TlistToggle<CR>
"Bundle 'OmniCppComplete'
Bundle 'scrooloose/syntastic'
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [], 'passive_filetypes': [] }
Bundle 'ervandew/supertab'
Bundle 'scrooloose/nerdcommenter'

filetype on
filetype plugin on
filetype indent on
syntax on

set completefunc=syntaxcomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
set omnifunc=syntaxcomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType='<c-x><c-p>'
let g:clang_auto_select=2
set conceallevel=0
"set concealcursor=inv
let g:clang_snippets=1
let g:clang_conceal_snippets=1
" The single one that works with clang_complete
let g:clang_snippets_engine='clang_complete'
" Complete options (disable preview scratch window, longest removed to aways
" show menu)
set completeopt=menu,menuone
" Limit popup menu height
set pumheight=20

set tags+=./tags;
map! <C-a> <C-x><C-u><C-p>

set list listchars=tab:»·,trail:·
" Trailing whitespace are forbidden, so highlight them.
highlight ForbiddenWhitespace guibg=red ctermbg=red
match ForbiddenWhitespace /\s\+$/
" Do not highlight spaces at the end of line while typing on that line.
autocmd InsertEnter * match ForbiddenWhitespace /\s\+\%#\@<!$/
