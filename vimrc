set t_Co=256
set backspace=indent,eol,start
let g:airline_powerline_fonts=1
set laststatus=2
"set relativenumber
set nu
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
set background=dark
colorscheme jellybeans
let g:rehash256 = 1

if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=~/.vim/swap//


" Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Plugin 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
Plugin 'vim-airline/vim-airline-themes'

Bundle 'scrooloose/nerdtree'
map <C-e> :NERDTreeToggle<CR>

Bundle 'majutsushi/tagbar'
"Bundle 'taglist.vim'
map <C-i> :TagbarToggle<CR>

Bundle 'scrooloose/syntastic'
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ["c"], 'passive_filetypes': [] }
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_c_compiler = "gcc"
let g:syntastic_c_compiler_options = "-Wall -std=gnu89"
let g:syntastic_c_include_dirs = ["/lib/modules/4.4.0-34-generic/build/include/"]
let g:syntastic_c_remove_include_errors = 1


Bundle 'scrooloose/nerdcommenter'

Bundle 'tpope/vim-fugitive'

Bundle 'will133/vim-dirdiff'
"Bundle 'xolox/vim-misc'

"Bundle 'xolox/vim-notes'
"let g:notes_directories = ['~/AB/Documents/lists/notes/']
"let g:notes_tab_indents = 0
"let g:notes_smart_quotes = 0

" Fix slow yaml
Bundle 'stephpy/vim-yaml'

Bundle 'Raimondi/delimitMate'

Bundle 'git-time-lapse'
map <leader>gt :call TimeLapse() <cr>

Bundle 'airblade/vim-gitgutter'

"Bundle 'vim-scripts/vimwiki'
"let g:vimwiki_folding = 'expr'
"nmap <leader>tt <Plug>VimwikiToggleListItem

Bundle 'davidhalter/jedi-vim'

Bundle 'nvie/vim-flake8'
let g:flake8_show_in_gutter=1
let g:flake8_show_in_file=1
let g:flake8_show_quickfix=1
autocmd BufWritePost *.py call Flake8()


Bundle 'ervandew/supertab'

Bundle 'Rip-Rip/clang_complete'
let g:clang_use_library = 1
let g:clang_library_path = "/usr/lib/llvm-3.8/lib"
"let g:clang_library_path = "/usr/lib/x86_64-linux-gnu/"
" Make sure libclang.so exists. If not, create a symlink.

Bundle 'fisadev/fisa-vim-colorscheme'

Bundle 'tpope/vim-obsession'

Plugin 'fatih/vim-go'
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)


filetype on
filetype plugin on
filetype indent on
syntax on

set tags+=./tags;/home/ab/.vim/tags;

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

let g:airline_theme='simple'


" Completions

"" supertab
let g:SuperTabDefaultCompletionType = "context"

" Jedi python complete
let g:jedi#popup_on_dot=0
let g:jedi#completions_command="<C-d>"
"let g:jedi#use_tabs_not_buffers=1
let g:jedi#use_splits_not_buffers="right"

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
map <C-n> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
"map <C-j> :vsp<CR> <C-]>
"map <C-k> :tab split<CR> <C-]>
au BufReadCmd *.egg call zip#Browse(expand("<amatch>"))
au BufReadCmd *.whl call zip#Browse(expand("<amatch>"))
