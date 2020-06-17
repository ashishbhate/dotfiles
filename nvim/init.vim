"Essentials for nvim
let g:python_host_prog = '/home/ab/PyEnvs/Py2/bin/python'
let g:python3_host_prog = '/home/ab/PyEnvs/Py3/bin/python'

"""""""""" Basic editor set up. Copied from vim
let mapleader=","
nnoremap ; :
set nu
set cc=80
set conceallevel=0
set list listchars=tab:»·,trail:·
set completeopt=menu,menuone
set pumheight=20
set wildignore=*.o,*~,*.pyc,*.pyo,*.so,*.sw*,__pycache__
set hlsearch
set ignorecase
set smartcase
set modeline
set foldlevel=1
set switchbuf=usetab,newtab

" Basic editor set up. Copied from vim currently ignored
"set laststatus=2
"set relativenumber
"set wildmenu
"set wildmode=list:longest,full
"set timeoutlen=300
"set ttimeoutlen=75


""""""""""" Set folders for things
set tags+=./tags;/home/ab/.local/share/nvim/tags;
if isdirectory('/home/ab/.local/share/nvim/swap') == 0
  :silent !mkdir -p /home/ab/.local/share/nvim/swap >/dev/null 2>&1
endif
set directory=/home/ab/.local/share/nvim/swap//


""""""""""" Plugins
call plug#begin('/home/ab/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts=1
let g:airline_theme='fruit_punch'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#buffer_min_count = 2

Plug 'scrooloose/nerdtree'
map <C-e> :NERDTreeToggle<CR>

Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'majutsushi/tagbar'
map <C-i> :TagbarToggle<CR>

Plug 'scrooloose/nerdcommenter'

Plug 'will133/vim-dirdiff'

Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "context"

" I should start using this to save vim Sessions
"Plugin 'tpope/vim-obsession'

Plug 'junegunn/fzf.vim'
set rtp+=~/root/src/fzf
nnoremap <silent> <c-\> :Files<CR>
let g:fzf_buffers_jump = 1

Plug 'junkblocker/git-time-lapse'
map <leader>gt :GitTimeLapse <cr>
"map <Leader>gt <Plug>(git-time-lapse)


Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-fugitive'

" Go
Plug 'fatih/vim-go'
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <leader>t  <Plug>(go-test)
au FileType go nmap <leader>b  <Plug>(go-build)
au FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
au FileType go nmap <Leader>l <Plug>(go-metalinter)
au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
au Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
au Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
au Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4
au FileType go set cc=81,97
"let g:go_highlight_build_constraints=1
let g:go_highlight_extra_types=1
let g:go_highlight_fields=1
let g:go_highlight_functions=1
let g:go_highlight_methods=1
let g:go_highlight_operators=1
let g:go_highlight_structs=1
let g:go_highlight_types=1
"let g:go_metalinter_autosave = 1
"let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']
let g:go_fmt_command="goimports"
let g:go_fmt_options={'gofmt': '-s'}

"let g:go_auto_sameids=1
let g:go_auto_type_info=1

""""" XXX Activate later
"
" Python - XXX double check and install when programming in Python
"Plugin 'davidhalter/jedi-vim'
"let g:jedi#popup_on_dot=0
"let g:jedi#completions_command="<C-d>"
"let g:jedi#use_tabs_not_buffers=1
"let g:jedi#use_splits_not_buffers="right"

"Plugin 'nvie/vim-flake8'
"let g:flake8_show_in_gutter=1
"let g:flake8_show_in_file=1
"let g:flake8_show_quickfix=1
"autocmd BufWritePost *.py call Flake8()

" C - XXX double check and install when programming in C
"Plugin 'Rip-Rip/clang_complete'
"let g:clang_use_library = 1
"let g:clang_library_path = "/usr/lib/llvm-3.8/lib"
" let g:clang_library_path = \"/usr/lib/x86_64-linux-gnu/"
" Make sure libclang.so exists. If not, create a symlink.
"let g:clang_auto_select=2
"let g:clang_complete_macros=1
"let g:clang_snippets=1
"let g:clang_conceal_snippets=1
"let g:clang_snippets_engine='clang_complete'
" indentation rules for FFmpeg: 4 spaces, no tabs
"au FileType c set expandtab
"au FileType c set shiftwidth=4
"au FileType c set softtabstop=4
"au FileType c set cindent
"au FileType c set cinoptions=(0
"map! <C-a> <C-x><C-u><C-p>
"map <C-n> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
"map <C-j> :vsp<CR> <C-]>
"map <C-k> :tab split<CR> <C-]>

"Plugin 'scrooloose/syntastic'
"let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ["c"], 'passive_filetypes': [] }
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0
"let g:syntastic_c_compiler = "gcc"
"let g:syntastic_c_compiler_options = "-Wall -std=gnu89"
"let g:syntastic_c_include_dirs = ["/lib/modules/4.10.0-19-generic/build/include/"]
"let g:syntastic_c_remove_include_errors = 1

call plug#end()

"""""""""" File type stuff

" PHP
au FileType php set noexpandtab
au FileType php set shiftwidth=8
au FileType php set softtabstop=8
au FileType php set tabstop=8

" Make
" Allow tabs in Makefiles.
au FileType make,automake set noexpandtab shiftwidth=8 softtabstop=8

" XML
au FileType xml set shiftwidth=2 softtabstop=2


""""""""""" More Editor config
" This needs to be at the end or the colours get wonky.
set t_Co=256
set background=dark
"seems to make colors brigher
let g:rehash256=1
colorscheme molokai
" This slows down vim but not nvim
set cursorline
set cursorcolumn

" Trailing whitespace are forbidden, so highlight them.
highlight ForbiddenWhitespace guibg=red ctermbg=red
match ForbiddenWhitespace /\s\+$/
" Do not highlight spaces at the end of line while typing on that line.
autocmd InsertEnter * match ForbiddenWhitespace /\s\+\%#\@<!$/

highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight Search ctermbg=darkred
highlight Search ctermfg=black
highlight LineNr ctermfg=red
highlight LineNr ctermbg=none
highlight SignColumn ctermbg=none
highlight ColorColumn ctermbg=234

set expandtab
set shiftwidth=4
set softtabstop=4
set cindent
set switchbuf+=usetab,newtab


"""""""""" GUI Settings
set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
highlight Search guibg=darkred
highlight Search guifg=black
highlight LineNr guifg=red


"""""""""" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
"nnoremap M :grep! '\b<C-R><C-W>\b'<CR>:cw<CR>
nnoremap fg :grep! '\b<cword>\b'<CR>:cw<CR><CR>
nnoremap fd :grep! '\b<cword>\b' %:p:h/<CR>:cw<CR><CR>
