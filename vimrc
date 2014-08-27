set t_Co=256
set backspace=indent,eol,start
let g:airline_powerline_fonts=1
set laststatus=2
set relativenumber
set wildmenu
set wildmode=list:longest,full
set wildignore=*.o,*~,*.pyc,*.pyo,*.so,*.sw*,__pycache__
set timeoutlen=300
set ttimeoutlen=75
set hlsearch
set cc=80
let mapleader=","
nnoremap ; :
"colorscheme Tomorrow-Night-Bright
"colorscheme jellybeans
set background=dark
colorscheme molokai
let g:rehash256 = 1
let g:airline_theme='simple'

" Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'bling/vim-airline'

Bundle 'scrooloose/nerdtree'
map <C-e> :NERDTreeToggle<CR>

Bundle 'taglist.vim'
map <C-l> :TlistToggle<CR>

Bundle 'scrooloose/syntastic'
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [], 'passive_filetypes': [] }

Bundle 'scrooloose/nerdcommenter'

Bundle 'tpope/vim-fugitive'

"Bundle 'xolox/vim-misc'

"Bundle 'xolox/vim-notes'
"let g:notes_directories = ['~/AB/Documents/lists/notes/']
"let g:notes_tab_indents = 0
"let g:notes_smart_quotes = 0

Bundle 'Raimondi/delimitMate'

Bundle 'git-time-lapse'
map <leader>gt :call TimeLapse() <cr>

Bundle 'airblade/vim-gitgutter'

Bundle 'vim-scripts/vimwiki'
let g:vimwiki_folding = 'expr'
nmap <leader>tt <Plug>VimwikiToggleListItem

Bundle 'davidhalter/jedi-vim'
Bundle 'nvie/vim-flake8'

Bundle 'ervandew/supertab'

Bundle 'Rip-Rip/clang_complete'
let g:clang_use_library = 1
let g:clang_library_path = "/usr/lib/x86_64-linux-gnu/"
" Make sure libclang.so exists. If not, create a symlink.

Bundle 'fisadev/fisa-vim-colorscheme'

filetype on
filetype plugin on
filetype indent on
syntax on

set tags+=./tags;

" indentation rules for FFmpeg: 4 spaces, no tabs
set expandtab
set shiftwidth=4
set softtabstop=4
set cindent
set cinoptions=(0
" Allow tabs in Makefiles.
autocmd FileType make,automake set noexpandtab shiftwidth=8 softtabstop=8
autocmd FileType xml set shiftwidth=2 softtabstop=2
set list listchars=tab:»·,trail:·
" Trailing whitespace are forbidden, so highlight them.
highlight ForbiddenWhitespace guibg=red ctermbg=red
match ForbiddenWhitespace /\s\+$/
" Do not highlight spaces at the end of line while typing on that line.
autocmd InsertEnter * match ForbiddenWhitespace /\s\+\%#\@<!$/
set modeline

set foldlevel=1
highlight Normal ctermbg=none
highlight NonText ctermbg=none
hi Search ctermbg=darkred
hi Search ctermfg=black
highlight LineNr ctermfg=red
highlight LineNr ctermbg=none
highlight SignColumn ctermbg=none
hi ColorColumn ctermbg=234

hi Search guibg=darkred
hi Search guifg=black
highlight LineNr guifg=red
"set wrap
"set textwidth=80
"set colorcolumn=+1
"set fo+=t
" explicit wrapping for xml files
"autocmd filetype xml set fo+=t


" Completions

"" supertab
let g:SuperTabDefaultCompletionType = "context"

" Jedi python complete
let g:jedi#popup_on_dot=0
let g:jedi#completions_command = "<C-d>"

"" Clang complete
let g:clang_auto_select=2
let g:clang_complete_macros=1
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
map! <C-a> <C-x><C-u><C-p>
