" Last Change: 12-Dec-2016.
if 0 | endif
" init {{{
augroup MyVimrcCmd
    autocmd!
augroup END

let s:MSWindows = has('win95') + has('win16') + has('win32') + has('win64')

if !exists('$DOTVIM')
  if s:MSWindows
    let $DOTVIM = expand($VIM.'\vimfiles')
    if !isdirectory(expand($DOTVIM))
      call system('mkdir '.$DOTVIM.'\autoload')
      call system('curl -fLo '.$DOTVIM.'\autoload\plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
    endif
  else
    let $DOTVIM = expand('~/.vim')
    if !isdirectory(expand($DOTVIM))
      call system('mkdir -p '.$DOTVIM.'/autoload/')
      call system('curl -fLo '.$DOTVIM.'/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
    endif
  endif
endif
" }}}

"set rtp+=$HOME . '/vimfiles/autoload/'
call plug#begin($DOTVIM.'/plugins')
" Plugin list
" InsertEnter
" Plug 'maralla/completor.vim'
" Plug 'maralla/completor-neosnippet'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'prabirshrestha/asyncomplete-necosyntax.vim'
Plug 'prabirshrestha/asyncomplete-gocode.vim'
Plug 'prabirshrestha/asyncomplete-neosnippet.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'prabirshrestha/asyncomplete-necovim.vim'
Plug 'prabirshrestha/async.vim'
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neco-vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'kana/vim-smartinput'
Plug 'tyru/eskk.vim', {'do': 'curl -fLo ~/.vim/skk/SKK-JISYO.L.gz
      \ --create-dirs http://openlab.jp/skk/dic/SKK-JISYO.L.gz &&
      \ cd ~/.vim/skk &&
      \ gzip -d SKK-JISYO.L.gz
      \ '}

Plug 'Lokaltog/vim-easymotion'
Plug 'Shougo/vimproc.vim',                  {'do' : 'make'}
Plug 'Yggdroot/indentLine'
Plug 'basyura/J6uil.vim',                   {'on' : 'J6uil'}
"Plug 'basyura/TweetVim'
Plug 'twitvim/twitvim'
Plug 'basyura/bitly.vim'
Plug 'basyura/twibill.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'elzr/vim-json',                       {'for': 'json'}
Plug 'fatih/vim-go',                        {'for': 'go'}
Plug 'mattn/sonictemplate-vim'
Plug 'glidenote/memolist.vim',              {'on' : ['MemoNew', 'MemoList' ,'MemoGrep']}
Plug 'itchyny/vim-cursorword'
Plug 'itchyny/vim-parenmatch'
Plug 'junegunn/vim-easy-align'
Plug 'jsfaint/gen_tags.vim'
Plug 'kchmck/vim-coffee-script',            {'for': 'coffee'}
Plug 'kana/vim-textobj-user'
Plug 'lambdalisue/vim-unified-diff',        {'for': 'diff'}
Plug 'mattn/webapi-vim'
Plug 'mattn/vim-terminal'
Plug 'mhinz/vim-grepper'
Plug 'osyo-manga/vim-over',                 {'on' : 'OverCommandLine'}
Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-surround'
Plug 'tyru/caw.vim'
Plug 'tyru/open-browser.vim'
Plug 'vim-jp/vimdoc-ja'
Plug 'violetyk/cake.vim'

" Syntax Check
Plug 'w0rp/ale'
" PHP
Plug 'thinca/vim-ref'
Plug 'yyotti/neosnippet-additional'
" proc
Plug 'vim-scripts/proc.vim'
" Visual
Plug 'chriskempson/base16-vim'
Plug 'felixjung/vim-base16-lightline'
Plug 'itchyny/lightline.vim'
" Git
Plug 'airblade/vim-gitgutter'
Plug 'lambdalisue/vim-gista',               {'on' : 'Gista'}
Plug 'tpope/vim-fugitive'
" CtrlP
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'kaneshin/ctrlp-filetype'
Plug 'mattn/ctrlp-filer'
Plug 'mattn/ctrlp-launcher'
Plug 'mattn/ctrlp-register'
Plug 'suy/vim-ctrlp-commandline'
Plug 'tacahiroy/ctrlp-funky'
Plug 'zeero/vim-ctrlp-help'
" Python
Plug 'davidhalter/jedi-vim',                {'for': 'python', 'do': 'pip install
      \ flake8 pyflakes pep8 pylint jedi'
      \ }
Plug 'andviro/flake8-vim',                  {'for': 'python'}
Plug 'bps/vim-textobj-python',              {'for': 'python'}
Plug 'hynek/vim-python-pep8-indent',        {'for': 'python'}
Plug 'jmcantrell/vim-virtualenv',           {'for': 'python'}
" Markdown
Plug 'gabrielelana/vim-markdown',           {'for': 'markdown'}
Plug 'joker1007/vim-markdown-quote-syntax', {'for': 'markdown'}
Plug 'kazuph/previm',                       {'for': 'markdown', 'branch': 'feature/add-plantuml-plugin'}
" UML
Plug 'aklt/plantuml-syntax',                {'for' : 'uml'}

call plug#end()

filetype plugin indent on
"----------------------------------------
" Option Settings
"----------------------------------------
" color {{{
set t_Co=256
if filereadable(expand('~/.vimrc_background'))
    let base16colorspace=256
    source ~/.vimrc_background
endif
"}}}
" Encoding {{{
set enc=UTF-8
scriptencoding utf-8
set fencs=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932,utf-16le,utf-16,default,latin1,utf-8
" }}}
" set opt {{{
set ambiwidth=double
set autoindent
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set backspace=indent,eol,start
set display=lastline
set foldmethod=marker
set noautochdir
" set completeopt=menuone
set completeopt+=preview
set hidden
set ignorecase
set incsearch
set laststatus=2
set noswapfile
set matchtime=1
set pumheight=10
set scrolloff=1000
" set shellslash
set showmatch
set showcmd
set smartcase
set title
set whichwrap=b,s,[,],<,>
set wildmenu
set wildignore=*.o,*.obj,*.pyc,*.so,*.dll,*.exe
set iminsert=0
set imsearch=-1
set cmdheight=2
set nf=""
if &t_Co > 2 || has('gui_running')
  syntax on
  set hlsearch
endif
" }}}
" Keybind {{{
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz
vmap y "*Y
let g:mapleader = ','
inoremap jj <ESC>
" nnoremap J 15j
" nnoremap K 15k
" nnoremap L 10l
" nnoremap H 10h
nnoremap Y y$
" Omni complations like eclipse
imap <C-Space> <C-x><C-o>

" InsertMode move cursor liught
inoremap <C-l> <C-g>U<Right>

" }}}

if executable('pt')
  " Use pt over grep
  set grepprg=pt\ --nogroup\ --nocolor
endif

" sudo write
cnoremap w!! w !sudo tee > /dev/null %<CR> :e!<CR>

" replace ;:
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" 検索結果Windowを閉じる
nnoremap <C-q> <C-w><C-w><C-w>q

" grep window on qf
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep cwindow
augroup ctrlq
  autocmd!
  autocmd FileType help,qf nnoremap <buffer> q <C-w>c
augroup END

"----------------------------------------
" Plugin Settings
"----------------------------------------
"asyncomplete {{{
let g:asyncomplete_auto_popup = 0
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" imap <c-space> <Plug>(asyncomplete_force_refresh)
" autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
"
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
"sources {{{
call asyncomplete#register_source(asyncomplete#sources#neosnippet#get_source_options({
    \ 'name': 'neosnippet',
    \ 'whitelist': ['*'],
    \ 'completor': function('asyncomplete#sources#neosnippet#completor'),
    \ }))
call asyncomplete#register_source(asyncomplete#sources#necovim#get_source_options({
    \ 'name': 'necovim',
    \ 'whitelist': ['vim'],
    \ 'completor': function('asyncomplete#sources#necovim#completor'),
    \ }))
call asyncomplete#register_source(asyncomplete#sources#necosyntax#get_source_options({
    \ 'name': 'necosyntax',
    \ 'whitelist': ['*'],
    \ 'completor': function('asyncomplete#sources#necosyntax#completor'),
    \ }))
call asyncomplete#register_source(asyncomplete#sources#gocode#get_source_options({
    \ 'name': 'gocode',
    \ 'whitelist': ['go'],
    \ 'completor': function('asyncomplete#sources#gocode#completor'),
    \ 'config': {
    \    'gocode_path': expand('~/go/bin/gocode')
    \  },
    \ }))
call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name': 'buffer',
    \ 'whitelist': ['*'],
    \ 'blacklist': ['go'],
    \ 'completor': function('asyncomplete#sources#buffer#completor'),
    \ }))
"}}}
"}}}
" completor {{{
"Select TAB
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
"
" let g:completor_disable_filename = 0
" let g:completor_disable_buffer = 0

" }}}
" Neo Snipet {{{
"Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

"}}}
" Quickrun {{{
let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config = {
\ '_' : {
\   'runner':                          'job',
\   'outputter':                       'error',
\   'outputter/error/success':         'buffer',
\   'outputter/error/error':           'quickfix',
\   'outputter/buffer/split':          ':botright 8sp',
\   'outputter/buffer/close_on_empty': 1,
\   },
\}
" Windows echo has cp932
if has('win32') || has('win64')
  let g:quickrun_config['php'] = {
\   'hook/output_encode/encoding':     'cp932',
\}
endif

" SQL to csv
let g:quickrun_config['sql'] = {
\ 'exec': '%c %o \@%s',
\ 'command': 'sqlplus',
\ 'cmdopt': '-S %{get(g:, "quickrun_oracle_conn", "/nolog")}',
\ 'hook/output_encode/encoding': 'sjis',
\ 'hook/eval/enable': 1,
\ 'hook/eval/template':
\   'set echo off' . "\r" .
\   'set linesize 1000' . "\r" .
\   'set trimspool on' . "\r" .
\   'set feedback off' . "\r" .
\   'set colsep ","' . "\r" .
\   'set heading on' . "\r" .
\   'set underline off' . "\r" .
\   '%s',
\}
"}}}
"TweetVim {{{
let g:tweetvim_tweet_per_page = 60
let g:tweetvim_cache_size     = 10
let g:tweetvim_display_source = 1
"}}}
" Gtags {{{
" The prefix key.
nnoremap    [Gtags]   <Nop>
nmap    <Space>t [Gtags]

" Grep 準備
nnoremap <silent> [Gtags]g :<C-u>Gtags -g
" このファイルの関数一覧
nnoremap <silent> [Gtags]l :<C-u>Gtags -f %<CR>
" カーソル以下の定義元を探す
nnoremap <silent> [Gtags]j :<C-u>Gtags <C-r><C-w><CR>
" カーソル以下の使用箇所を探す
nnoremap <silent> [Gtags]k :<C-u>Gtags -r <C-r><C-w><CR>

" 次の検索結果
nnoremap <C-n> :cn<CR>
" 前の検索結果
nnoremap <C-p> :cp<CR>
" }}}
" lightline.vim{{{
let g:lightline = {
\ 'colorscheme': 'base16_ashes',
\ 'mode_map': {'c': 'NORMAL'},
\ 'active': {
\   'left': [
\     ['mode', 'paste'],
\     ['git', 'filename'],
\   ],
\   'right': [
\     ['lineinfo', 'validator'],
\     ['fileformat', 'fileencoding', 'filetype'],
\   ]
\ },
\ 'inactive': {
\   'right': [[], ['percent']],
\ },
\ 'component_function': {
\   'git': 'MyGit',
\   'mode': 'MyMode',
\   'validator': 'LightLineValidator',
\   'filename': 'MyFilename',
\   'fileformat': 'MyFileformat',
\   'filetype': 'MyFiletype',
\   'fileencoding': 'MyFileencoding',
\ },
\}

function! MyFilename()
  let name = expand('%:t')
  let name = name !=# '' ? name : '[No Name]'
  if name =~? 'netrw'
    return 'netrw'
  endif
  let readonly = &readonly ? '⭤ ' : ''
  let modified = &modified ? ' +' : ''
  return readonly . name . modified
endfunction

function! MyGit()
  if winwidth(0) <= 70
    return ''
  endif
  let branch = exists('*fugitive#head') ? fugitive#head() : ''
  return branch !=# '' ? '⭠ '.branch : ''
endfunction

function! MyFileformat()
  return winwidth('.') > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth('.') > 60 ? lightline#mode() : ''
endfunction

function! LightLineValidator()
  return winwidth('.') > 70 ? ALEGetStatusLine() : ''
endfunction

" }}}
" EasyAlign{{{
vnoremap <silent> <Enter> :EasyAlign<cr>
let g:easy_align_bypass_fold = 1
let g:easy_align_delimiters = {
\ '>': { 'pattern': '>>\|=>\|>' },
\ '/': {
\     'pattern':         '//\+\|/\*\|\*/',
\     'delimiter_align': 'l',
\     'ignore_groups':   ['!Comment'] },
\ ']': {
\     'pattern':       '[[\]]',
\     'left_margin':   0,
\     'right_margin':  0,
\     'stick_to_left': 0
\   },
\ ')': {
\     'pattern':       '[()]',
\     'left_margin':   0,
\     'right_margin':  0,
\     'stick_to_left': 0
\   },
\ 'd': {
\     'pattern':      ' \(\S\+\s*[;=]\)\@=',
\     'left_margin':  0,
\     'right_margin': 0
\   }
\}
" }}}
" vim-easymotion{{{
let g:EasyMotion_do_mapping = 0
nmap s <Plug>(easymotion-s2)
xmap s <Plug>(easymotion-s2)
" surround.vimと被らないように
omap z <Plug>(easymotion-s2)
map f <Plug>(easymotion-fl)
map t <Plug>(easymotion-tl)
map F <Plug>(easymotion-Fl)
map T <Plug>(easymotion-Tl)
let g:EasyMotion_keys = ';HKLYUIOPNM,QWERTASDGZXCVBJF'
let g:EasyMotion_use_upper = 1
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
" }}}
" ESKK {{{
let g:eskk#directory = expand($DOTVIM.'/.cache/eskk')
let g:eskk#large_dictionary = {
\ 'path': $DOTVIM.'/skk/SKK-JISYO.L',
\ 'sorted': 1,
\}
" Don't keep state.
let g:eskk#keep_state = 0
let g:eskk#show_annotation = 0
let g:eskk_revert_henkan_style = 'okuri'
let g:eskk#egg_like_newline = 1
let g:eskk#egg_like_newline_completion = 1

"allow InsertMode toggle ESKK
augroup vimrc
  autocmd!
  autocmd vimrc VimEnter * imap <C-j> <Plug>(eskk:toggle)
  autocmd vimrc VimEnter * cmap <C-j> <Plug>(eskk:toggle)
augroup END
"}}}
" Git {{{
nnoremap    [Git]   <Nop>
nmap    <Space>g [Git]
nnoremap <silent> [Git]gt :<C-u>GitGutterToggle<CR>
nnoremap <silent> [Git]ht :<C-u>GitGutterLineHighlightsToggle<CR>
nnoremap <silent> [Git]sh :<C-u>GitGutterStageHunk<CR>
nnoremap <silent> [Git]rh :<C-u>GitGutterRevertHunk<CR>
nnoremap <silent> [Git]n :<C-u>GitGutterNextHunk<CR>
nnoremap <silent> [Git]p :<C-u>GitGutterPrevHunk<CR>
" vim-fugitive
nnoremap <silent> [Git]a :<C-u>Gwrite<CR>
nnoremap <silent> [Git]m :<C-u>Gcommit<CR>
nnoremap <silent> [Git]s :<C-u>Gstatus<CR>
nnoremap <silent> [Git]d :<C-u>Gdiff<CR>
nnoremap <silent> [Git]b :<C-u>Gita branch<CR>
" }}}
" vim-go {{{
" highlight error
augroup hierr
  autocmd!
  autocmd FileType go :highlight goErr cterm=bold ctermfg=214
  autocmd FileType go :match goErr /\<err\>/
augroup END

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = 'goimports'
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
" }}}
" vim-indent-line {{{
let g:indentLine_setColors = 0
let g:indentLine_faster = 1
let g:indentLine_color_term = 111
let g:indentLine_color_gui = '#708090'
let g:indentLine_char = '¦'
" }}}
" over.vim {{{
nnoremap <silent> <Space>o :OverCommandLine<CR>
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>
" }}}
"Terminal {{{
" The prefix key.
nnoremap    [Terminal]   <Nop>
nmap    <Space>c [Terminal]
nnoremap <silent> [Terminal]c :<C-u>Terminal<CR>
"}}}
"pandoc {{{
let g:pandoc#modules#disabled=['folding']
"}}}
" Memolist{{{
" The prefix key.
nnoremap    [memo]   <Nop>
nmap    <Space>m [memo]

" unite.vim keymap
nnoremap <silent> [memo]n :<C-u>MemoNew<CR>
"nnoremap <silent> [memo]l :<C-u>MemoList<CR>
nnoremap <silent> [memo]l :<C-u>exe "CtrlP" g:memolist_path<cr><f5>
nnoremap <silent> [memo]g :<C-u>MemoGrep<CR>
let g:memolist_memo_suffix = 'md'
let g:memolist_path = '~/Dev/memo'
let g:memolist_unite = 1
let g:memolist_unite_option = '-start-insert'
"}}}
"CtrlP {{{
nnoremap    [CtrlP]   <Nop>
nmap    <Space>u [CtrlP]
nnoremap <silent> [CtrlP]u :<C-u>CtrlP<CR>
nnoremap <silent> [CtrlP]f :<C-u>CtrlPBuffer<CR>
nnoremap <silent> [CtrlP]m :<C-u>CtrlPMRU<CR>
nnoremap <silent> [CtrlP]r :<C-u>CtrlPRegister<CR>
nnoremap <silent> [CtrlP]s :<C-u>CtrlPLine<CR>
nnoremap <silent> [CtrlP]t :<C-u>CtrlPTag<CR>
nnoremap <silent> [CtrlP]d :<C-u>CtrlPDir<CR>
nnoremap <silent> [CtrlP]p :<C-u>CtrlPFiletype<CR>
nnoremap <silent> [CtrlP]l :<C-u>CtrlPLauncher<CR>
nnoremap <silent> [CtrlP]h :<C-u>CtrlPHelp<CR>
nnoremap <silent> [CtrlP]c :<C-u>call ctrlp#init(ctrlp#commandline#id())<CR>

if executable('files')
  let g:ctrlp_use_caching = 0
  let g:ctrlp_user_command = 'files -a %s'
endif
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_lazy_update = 1
let g:ctrlp_map = '<Nop>'
" Guess vcs root dir
let g:ctrlp_working_path_mode = 'ra'
" Open new file in current window
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_match_window = 'order:ttb,min:20,max:20,results:100'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
"}}}
" Jedi {{{
augroup jediomni
  autocmd!
  au FileType python setlocal omnifunc=jedi#completions
augroup END

let g:jedi#use_tabs_not_buffers = 1
let g:jedi#popup_select_first = 0
let g:jedi#popup_on_dot = 0
let g:jedi#goto_command = '<leader>d'
let g:jedi#goto_assignments_command = '<leader>g'
let g:jedi#goto_definitions_command = ''
let g:jedi#documentation_command = 'K'
let g:jedi#usages_command = '<leader>n'
let g:jedi#rename_command = '<leader>R'
" }}}
" caw.vim {{{
nmap <Leader>c      <Plug>(caw:hatpos:toggle)
vmap <Leader>c      <Plug>(caw:hatpos:toggle)
" }}}
" Previm {{{
let g:previm_enable_realtime = 1
" .mdのファイルもfiletypeがmarkdownとなるようにする
augroup PrevimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
" OpenBrowser
let g:openbrowser_browser_commands = [
\   {'name': 'C:\app\CentBrowser\Application\chrome.exe',
\    'args': ['start', '{browser}', '{uri}']}
\]
" }}}
" validator {{{
let g:validator_ignore = ['c']
let g:validator_javascript_checkers = ['eslint']
let g:validator_vim_checkers = ['vint']
let g:validator_python_checkers = ['flake8']
let g:validator_auto_open_quickfix = 0
let g:validator_debug = 0
" }}}
" vim-ref
let g:ref_phpmanual_path = $DOTVIM.'/doc/php-chunked-xhtml'
"exclude whitespace
let g:extra_whitespace_ignored_filetypes = ['J6uil', 'vim-plug', 'tweetvim', 'help']
let g:openbrowser_browser_commands = [
\   {'name': 'C:\app\CentBrowser\Application\chrome.exe',
\    'args': ['start', '{browser}', '{uri}']}
\]
set shellslash
