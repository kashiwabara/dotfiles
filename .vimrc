"-------------------------------------------------------------
" NeoBundle
"-------------------------------------------------------------
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" 様々な言語を保存時にシンタックスチェック
NeoBundle 'scrooloose/syntastic'
" neocomで非同期処理するときに必要
NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \     'windows' : 'tools\\update-dll-mingw',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make -f make_mac.mak',
            \     'linux' : 'make',
            \     'unix' : 'gmake',
            \    },
            \ }
" Vimで補完を簡単に
NeoBundle 'Shougo/neocomplete.vim'
" スニペット補完する
"NeoBundle 'Shougo/neosnippet.vim'
" snippetファイルがまとまっているもの
"NeoBundle 'honza/vim-snippets'
NeoBundle 'Shougo/unite.vim'
"NeoBundle 'y-uuki/syntastic-local-lib-path.vim'
NeoBundle 'thinca/vim-localrc'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'c9s/perlomni.vim'
NeoBundle 'mattn/perldoc-vim'
NeoBundle 'soramugi/auto-ctags.vim'
NeoBundle 'airblade/vim-rooter'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'yko/mojo.vim'
NeoBundle "thinca/vim-qfreplace"
NeoBundle 'sudo.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'DirDiff.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'junegunn/vim-easy-align'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"-------------------------------------------------------------
" 共通設定
"-------------------------------------------------------------
set number
set clipboard=unnamed
set tw=0
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=0
set formatoptions=q
set nowrap
set undofile
set undodir=~/.vim/undo
set undodir=~/.vim/swap
set backspace=indent,eol,start " インサートモード時にバックスペースを使う
"noremap <CR> o<ESC>
nnoremap <C-]> g<C-]>
let mapleader=" "
nmap <Leader>r <plug>(quickrun)
autocmd BufNewFile,BufRead *.ep set filetype=html
syntax enable
set hlsearch
set background=dark
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l  
nnoremap <c-x> <c-w>x  

if has('path_extra')
    set tags+=tags;~/
endif

set t_Co=256
set background=dark

let g:lightline = {
      \ 'colorscheme': 'solarized'
      \ }
colorscheme solarized
let g:solarized_termtrans=1
set laststatus=2 
set scrolloff=5


"-------------------------------------------------------------
" git gutter
"-------------------------------------------------------------
let g:gitgutter_enabled = 0
nnoremap <silent> ,gg :<C-u>GitGutterToggle<CR>
nnoremap <silent> ,gh :<C-u>GitGutterLineHighlightsToggle<CR>
"-------------------------------------------------------------
" ctags
"-------------------------------------------------------------
let g:auto_ctags = 1
"-------------------------------------------------------------
" Unite
"-------------------------------------------------------------
" unite prefix key
nnoremap [unite] <Nop>
nmap <Leader>f [unite]
" mappings
nnoremap [unite]b :<C-u>Unite<Space>buffer<CR>
nnoremap [unite]f :<C-u>Unite<Space>file<CR>
nnoremap [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap [unite]a :<C-u>Unite buffer file file_mru bookmark<CR>
nnoremap [unite]r :<C-u>Unite<Space>register<CR>
nnoremap [unite]R :<C-u>UniteResume<CR>
nnoremap [unite]k :<C-u>Unite<Space>bookmark<CR>
nnoremap [unite]ka :<C-u>UniteBookmarkAdd<CR>

" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-L> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-L> unite#do_action('vsplit')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')

let g:unite_source_grep_max_candidates = 200

if executable('ag')
    " Use ag in unite grep source.
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_recursive_opt = 'HRn'
    let g:unite_source_grep_default_opts =
    \ '--line-numbers --nocolor --nogroup --hidden --ignore ' .
    \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
endif

nnoremap <silent> <Leader>o :<C-u>Unite -vertical -no-quit -winwidth=40 outline<CR>

"-------------------------------------------------------------
" syntastic
"-------------------------------------------------------------
let g:syntastic_perl_checkers = ['perl']
let g:syntastic_enable_perl_checker = 1
"-------------------------------------------------------------
" neocomplete
"-------------------------------------------------------------
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

"-------------------------------------------------------------
" omni
"-------------------------------------------------------------
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"-------------------------------------------------------------
" Quickfix
"-------------------------------------------------------------
" quickfix: 編集許可と折り返し表示無効
function! OpenModifiableQF()
        cw
        set modifiable
        set nowrap
endfunction

autocmd QuickfixCmdPost vimgrep call OpenModifiableQF()

"-------------------------------------------------------------
" Gundo
"-------------------------------------------------------------
nnoremap <F5> :GundoToggle<CR>

"-------------------------------------------------------------
" easy align
"-------------------------------------------------------------
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
