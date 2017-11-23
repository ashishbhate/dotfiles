" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Misc
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

Plugin 'scrooloose/nerdtree'
map <C-e> :NERDTreeToggle<CR>

Plugin 'majutsushi/tagbar'
map <C-i> :TagbarToggle<CR>

Plugin 'scrooloose/nerdcommenter'

Plugin 'will133/vim-dirdiff'

" Fix slow yaml
Plugin 'stephpy/vim-yaml'

Plugin 'Raimondi/delimitMate'

Plugin 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "context"

Plugin 'tpope/vim-obsession'

"Plugin 'vim-airline/vim-airline'
"let g:airline#extensions#tabline#enabled = 1
"Plugin 'vim-airline/vim-airline-themes'
"let g:airline_powerline_fonts=1

"Plugin 'taglist.vim'

"Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-notes'
"let g:notes_directories = ['~/AB/Documents/lists/notes/']
"let g:notes_tab_indents = 0
"let g:notes_smart_quotes = 0
"
"Plugin 'vim-scripts/vimwiki'
"let g:vimwiki_folding = 'expr'
"nmap <leader>tt <Plug>VimwikiToggleListItem

"Plugin 'fisadev/fisa-vim-colorscheme'


" Git
Plugin 'git-time-lapse'
map <leader>gt :call TimeLapse() <cr>

Plugin 'airblade/vim-gitgutter'

Plugin 'tpope/vim-fugitive'


" Python
Plugin 'davidhalter/jedi-vim'
let g:jedi#popup_on_dot=0
let g:jedi#completions_command="<C-d>"
"let g:jedi#use_tabs_not_buffers=1
let g:jedi#use_splits_not_buffers="right"

Plugin 'nvie/vim-flake8'
let g:flake8_show_in_gutter=1
let g:flake8_show_in_file=1
let g:flake8_show_quickfix=1
autocmd BufWritePost *.py call Flake8()


" Go
Plugin 'fatih/vim-go'
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4
let g:go_highlight_build_constraints=1
let g:go_highlight_extra_types=1
let g:go_highlight_fields=1
let g:go_highlight_functions=1
let g:go_highlight_methods=1
let g:go_highlight_operators=1
let g:go_highlight_structs=1
let g:go_highlight_types=1
let g:go_auto_sameids=1
let g:go_auto_type_info=1


" C
Plugin 'Rip-Rip/clang_complete'
let g:clang_use_library = 1
let g:clang_library_path = "/usr/lib/llvm-3.8/lib"
" let g:clang_library_path = \"/usr/lib/x86_64-linux-gnu/"
" Make sure libclang.so exists. If not, create a symlink.
let g:clang_auto_select=2
let g:clang_complete_macros=1
let g:clang_snippets=1
let g:clang_conceal_snippets=1
let g:clang_snippets_engine='clang_complete'
" indentation rules for FFmpeg: 4 spaces, no tabs
au FileType c set expandtab
au FileType c set shiftwidth=4
au FileType c set softtabstop=4
au FileType c set cindent
au FileType c set cinoptions=(0
map! <C-a> <C-x><C-u><C-p>
map <C-n> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
"map <C-j> :vsp<CR> <C-]>
"map <C-k> :tab split<CR> <C-]>

Plugin 'scrooloose/syntastic'
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
let g:syntastic_c_include_dirs = ["/lib/modules/4.10.0-19-generic/build/include/"]
let g:syntastic_c_remove_include_errors = 1

"
" Make
" Allow tabs in Makefiles.
au FileType make,automake set noexpandtab shiftwidth=8 softtabstop=8


" XML
au FileType xml set shiftwidth=2 softtabstop=2


call vundle#end()
filetype on
filetype plugin on
filetype indent on
syntax on

set t_Co=256
set backspace=indent,eol,start
set laststatus=2
"set relativenumber
set nu
set cc=80
set conceallevel=0
set background=dark
"colorscheme Tomorrow-Night-Bright
"colorscheme jellybeans
colorscheme molokai
let g:rehash256 = 1
set list listchars=tab:»·,trail:·
" Trailing whitespace are forbidden, so highlight them.
highlight ForbiddenWhitespace guibg=red ctermbg=red
match ForbiddenWhitespace /\s\+$/
" Do not highlight spaces at the end of line while typing on that line.
autocmd InsertEnter * match ForbiddenWhitespace /\s\+\%#\@<!$/
set completeopt=menu,menuone
set pumheight=20
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight Search ctermbg=darkred
highlight Search ctermfg=black
highlight LineNr ctermfg=red
highlight LineNr ctermbg=none
highlight SignColumn ctermbg=none
highlight ColorColumn ctermbg=234

" GUI Settings
set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
highlight Search guibg=darkred
highlight Search guifg=black
highlight LineNr guifg=red

set wildmenu
set wildmode=list:longest,full
set wildignore=*.o,*~,*.pyc,*.pyo,*.so,*.sw*,__pycache__
set timeoutlen=300
set ttimeoutlen=75
set hlsearch

let mapleader=","
nnoremap ; :

set modeline
set foldlevel=1
au BufReadCmd *.egg call zip#Browse(expand("<amatch>"))
au BufReadCmd *.whl call zip#Browse(expand("<amatch>"))

set tags+=./tags;/home/ab/.vim/tags;
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=~/.vim/swap//

