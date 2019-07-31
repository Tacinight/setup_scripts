" General Settings
filetype plugin indent on
syntax on
set nocompatible
set relativenumber
set wildmenu
set wildmode=full
set backspace=indent,eol,start
"set cursorcolumn
"set cursorline
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%' 
nnoremap <BS> X
let mapleader=","

highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black


" Vim-plug Settings
call plug#begin('~/.vim/plugged')
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/vim-preview'
Plug 'skywind3000/gutentags_plus'
Plug 'rhysd/vim-clang-format'
Plug 'mhinz/vim-signify'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/LeaderF'
Plug 'ycm-core/YouCompleteMe'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'sillybun/vim-repl'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
call plug#end()


" Airline Settings
let g:airline_powerline_fonts = 1


" Nerdtree Settings
map <leader>t :NERDTreeToggle<CR>


" REPL Settings
nnoremap <leader>r :REPLToggle<Cr>


" Rainbow Setting
let g:rainbow_active = 1


" Gutentags Settings
let g:gutentags_define_advanced_commands = 1
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile = '.tags'

let g:gutentags_modules = []
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif

let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
let g:gutentags_auto_add_gtags_cscope = 0

if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'


" LeaderF Settings
let g:Lf_ShortcutF = '<c-p>'
noremap <c-e> :LeaderfMru<cr>
noremap <leader>p :LeaderfFunction!<cr>
noremap <leader>b :LeaderfBuffer<cr>
noremap <leader>m :LeaderfTag<cr>
noremap <leader>gr :Leaderf rg -e 
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}


" YouCompleteMe Settings
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:gutentags_plus_switch = 1
set completeopt=menu,menuone
noremap <c-z> <NOP>

let g:ycm_semantic_triggers =  {
           \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
           \ 'cs,lua,javascript': ['re!\w{2}'],
           \ }


" Vim-preview Settings
noremap <F3> :PreviewTag<CR>
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>


" Vim-clang-format Settings
autocmd FileType cpp nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType cpp vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
" autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
" nmap <Leader>C :ClangFormatAutoToggle<CR>


" Merlin Settings
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
