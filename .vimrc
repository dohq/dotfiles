" init {{{
" Check vi or vim
if 0 | endif

augroup MyVimrcCmd
    autocmd!
augroup END

let s:MSWindows = has('win95') + has('win16') + has('win32') + has('win64')
if !exists('$DOTVIM')
  if s:MSWindows
    let $DOTVIM = expand($VIM.'\vimfiles')
  else
    let $DOTVIM = expand('~/.vim')
  endif
  if !isdirectory(expand($DOTVIM))
    call system('mkdir -p '.$DOTVIM.'/autoload/')
    call system('curl -fLo '.$DOTVIM.'/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
endif
" }}}

call plug#begin($DOTVIM.'/plugins')
"
" exTools
Plug 'Shougo/vimproc.vim',                  {'do' : 'make'}
Plug 'ervandew/supertab'
Plug 'glidenote/memolist.vim',              {'on' : ['MemoNew', 'MemoList' ,'MemoGrep']}
Plug 'haya14busa/incsearch-fuzzy.vim'
  Plug 'haya14busa/incsearch.vim'
Plug 'itchyny/vim-parenmatch'
Plug 'justinmk/vim-dirvish'
Plug 'simeji/winresizer'
Plug 'vim-jp/vimdoc-ja'
Plug 'tyru/eskk.vim', {'do': 'curl -fLo ~/.vim/skk/SKK-JISYO.L.gz
      \ --create-dirs http://openlab.jp/skk/dic/SKK-JISYO.L.gz &&
      \ mkdir $DOTVIM/skk &&
      \ cd $DOTVIM/skk &&
      \ gzip -d SKK-JISYO.L.gz
      \ '}
" Input Assist
Plug 'maralla/completor.vim'
  Plug 'maralla/completor-neosnippet'
Plug 'Shougo/neosnippet'
  Plug 'Shougo/neosnippet-snippets'
Plug 'cohama/lexima.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'bronson/vim-trailing-whitespace',     {'on': 'FixWhitespace'}
Plug 'mattn/sonictemplate-vim'
Plug 'easymotion/vim-easymotion'
Plug 'AndrewRadev/switch.vim'
Plug 'junegunn/vim-easy-align'
Plug 'osyo-manga/vim-over',                 {'on': 'OverCommandLine'}
Plug 'tpope/vim-surround'
Plug 'tyru/caw.vim'
Plug 'wakatime/vim-wakatime'
" Visual
Plug 'chriskempson/base16-vim'
Plug 'felixjung/vim-base16-lightline'
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
" QuickRun
" Plug 'skywind3000/asyncrun.vim'
Plug 'thinca/vim-quickrun'

" Twitter
Plug 'basyura/TweetVim'
  Plug 'basyura/twibill.vim'
Plug 'tyru/open-browser.vim'
Plug 'mattn/webapi-vim'
" Syntax Check
Plug 'w0rp/ale'
" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'lambdalisue/vim-gista',               {'on' : 'Gista'}
" CtrlP
Plug 'ctrlpvim/ctrlp.vim'
  Plug 'FelikZ/ctrlp-py-matcher'
  Plug 'mattn/ctrlp-launcher'
  Plug 'mattn/ctrlp-register'
  Plug 'suy/vim-ctrlp-commandline'
  Plug 'tacahiroy/ctrlp-funky'
  Plug 'zeero/vim-ctrlp-help'
" PHP
Plug 'thinca/vim-ref',                      {'for': 'php'}
Plug 'violetyk/cake.vim',                   {'for': 'php'}
" Python
Plug 'kana/vim-textobj-user'
  Plug 'bps/vim-textobj-python',            {'for': 'python'}
Plug 'Vimjas/vim-python-pep8-indent',       {'for': 'python'}
Plug 'cjrh/vim-conda',                      {'for': 'python'}
Plug 'davidhalter/jedi-vim',                {'for': 'python'}
Plug 'hynek/vim-python-pep8-indent',        {'for': 'python'}
Plug 'jmcantrell/vim-virtualenv',           {'for': 'python'}
Plug 'lambdalisue/vim-django-support',      {'for': 'python'}
Plug 'tell-k/vim-autopep8',                 {'for': 'python'}
Plug 'vim-python/python-syntax',            {'for': 'python'}
" Markdown
Plug 'rcmdnk/vim-markdown',                 {'for': 'markdown'}
  Plug 'rcmdnk/vim-markdown-quote-syntax',  {'for': 'markdown'}
Plug 'kazuph/previm',                       {'for': 'markdown', 'branch': 'feature/add-plantuml-plugin'}
" UML
Plug 'aklt/plantuml-syntax',                {'for' : 'plantuml'}
" json
Plug 'elzr/vim-json',                       {'for': 'json'}
" go
Plug 'fatih/vim-go',                        {'for': 'go', 'do': ':GoInstallBinaries'}

" Java
Plug 'artur-shaik/vim-javacomplete2',       {'for': 'java'}

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
" set plugin stop {{{
let g:loaded_matchparen        = 1
let g:loaded_gzip              = 1
let g:loaded_tar               = 1
let g:loaded_tarPlugin         = 1
let g:loaded_zip               = 1
let g:loaded_zipPlugin         = 1
let g:loaded_rrhelper          = 1
let g:loaded_2html_plugin      = 1
let g:loaded_vimball           = 1
let g:loaded_vimballPlugin     = 1
let g:loaded_getscript         = 1
let g:loaded_getscriptPlugin   = 1
let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_netrwSettings     = 1
let g:loaded_netrwFileHandlers = 1
" }}}
" Encoding {{{
set enc=UTF-8
scriptencoding utf-8
set fencs=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932,utf-16le,utf-16,default,latin1,utf-8
" }}}
" set opt {{{
syntax on
set imdisable
set clipboard=unnamed
set ambiwidth=double
set backspace=indent,eol,start
set display=lastline
set expandtab
set laststatus=2
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
set noswapfile
set scrolloff=1000
set tabstop=2 shiftwidth=2 softtabstop=2
set whichwrap=b,s,[,],<,>
set foldmethod=marker
set cmdheight=2
set ignorecase
set iminsert=0
set wildignore=*.o,*.obj,*.pyc,*.so,*.dll,*.exe
set wildmenu
" }}}
" Keybind {{{
let g:mapleader = ','
inoremap jj <ESC>
" nnoremap Y y$

" search * under cousor word
" vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>
" Omni complations like eclipse
" imap <C-Space> <C-x><C-o>

" InsertMode move cursor liught
inoremap <C-l> <C-g>U<Right>

" }}}
" sudo write
cnoremap w!! w !sudo tee > /dev/null %<CR> :e!<CR>

" replace ;:
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

"----------------------------------------
" Plugin Settings
"----------------------------------------
" NeoSnipet {{{
"Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

"}}}
" Quick-Run {{{
let g:quickrun_config = {
\   "_" : {
\       "runner" : "job",
\       "outputter/buffer/split" : ":botright",
\       "outputter/buffer/close_on_empty" : 1
\   },
\}
" }}}
" ale {{{
" let g:ale_linters = {
" \   'python': ['flake8'],
" \}
let g:ale_sign_error = '▶'
let g:ale_sign_warning = '▷'
let g:ale_sign_column_always = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_statusline_format = ['▲ %d', '△ %d', '✓ ok']
" " }}}
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
\   'validator': 'ALEGetStatusLine',
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
  let readonly = &readonly ? '⏏ ' : ''
  let modified = &modified ? ' +' : ''
  return readonly . name . modified
endfunction

function! MyGit()
  if winwidth(0) <= 70
    return ''
  endif
  let branch = exists('*fugitive#head') ? fugitive#head() : ''
  return branch !=# '' ? '√'.branch : ''
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

function! ALEGetStatusLine() abort
    return ale#statusline#Status()
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
nmap s <Plug>(easymotion-overwin-f2)
" nmap s <Plug>(easymotion-s2)
" xmap s <Plug>(easymotion-s2)
" surround.vimと被らないように
" omap z <Plug>(easymotion-s2)
" map f <Plug>(easymotion-fl)
" map t <Plug>(easymotion-tl)
" map F <Plug>(easymotion-Fl)
" map T <Plug>(easymotion-Tl)
let g:EasyMotion_keys = ';HKLYUIOPNM,QWERTASDGZXCVBJF'
let g:EasyMotion_use_upper = 1
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
" }}}
" incsearch {{{
let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)

map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
" }}}
" ESKK {{{
let g:eskk#enable_completion = 0
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
let g:gitgutter_enabled = 0
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
nnoremap <silent> [Git]m :<C-u>Gcommit -v<CR>
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
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
" }}}
" vim-indent-line {{{
" let g:indentLine_setColors = 0
let g:indentLine_faster = 1
let g:indentLine_color_term = 111
let g:indentLine_color_gui = '#708090'
let g:indentLine_char = '︙'
let g:indentLine_char = '⋮'
" }}}
" over.vim {{{
nnoremap <silent> <Space>o :OverCommandLine<CR>
" }}}
" Twit {{{
" open-browser.vim
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
autocmd FileType twitvim call s:twitvim_my_settings()
function! s:twitvim_my_settings()
  set nowrap
endfunction

let g:tweetvim_display_source = 1
let g:tweetvim_open_buffer_cmd = 'split'
let g:tweetvim_display_separator = 1
let g:tweetvim_empty_separator = 1

"KeyMapping
nnoremap    [TweetVim]   <Nop>
nmap    <Space>w [TweetVim]
nnoremap <silent> [TweetVim]s :<C-u>TweetVimSay<CR>
nnoremap <silent> [TweetVim]h :<C-u>TweetVimHomeTimeline<CR>
nnoremap <silent> [TweetVim]m :<C-u>TweetVimMentions<CR>
nnoremap <silent> [TweetVim]u :<C-u>TweetVimUserTimeline dohq<CR>
nnoremap <silent> [TweetVim]f :<C-u>TweetVimSearch
" }}}
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
nnoremap <silent> [CtrlP]b :<C-u>CtrlPBuffer<CR>
nnoremap <silent> [CtrlP]f :<C-u>CtrlPFunky<CR>
nnoremap <silent> [CtrlP]m :<C-u>CtrlPMRU<CR>
nnoremap <silent> [CtrlP]r :<C-u>CtrlPRegister<CR>
nnoremap <silent> [CtrlP]t :<C-u>CtrlPTag<CR>
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
" let g:ctrlp_root_markers = ['Gemfile', 'pom.xml', 'build.xml', 'composer.json']
" let g:ctrlp_max_height = 20
" Guess vcs root dir
let g:ctrlp_working_path_mode = 'ra'
" Open new file in current window
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_match_window = 'order:ttb,min:20,max:20,results:100'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(vscode|git|hg|svn|.cache|__pycache__)$',
  \ 'file': '\v\.(exe|so|dll|xlsx|xls|docx|doc)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
"}}}
" Python {{{
" shortcut for goto definition
autocmd FileType python setlocal omnifunc=jedi#completions
let python_highlight_all=1
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#show_call_signatures = "2"
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#popup_select_first = 0
let g:jedi#popup_on_dot = 1
let g:jedi#goto_command = '<leader>d'
let g:jedi#goto_assignments_command = '<leader>g'
let g:jedi#goto_definitions_command = ''
let g:jedi#documentation_command = 'K'
let g:jedi#usages_command = '<leader>n'
let g:jedi#rename_command = '<leader>R'
nnoremap <silent> <Space>s :Switch<CR>
autocmd FileType python nnoremap <LocalLeader>i :!isort %<CR><CR>
autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>
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
" FixWhitespace {{{
let g:extra_whitespace_ignored_filetypes = ['J6uil', 'vim-plug', 'tweetvim', 'help']
" }}}
" SuperTab {{{
let g:SuperTabContextDefaultCompletionType = "<c-n>"
let g:SuperTabDefaultCompletionType = "<c-n>"
" }}}
" vim-ref {{{
let g:ref_phpmanual_path = $DOTVIM.'/doc/php-chunked-xhtml'
" }}}
" lexima {{{
inoremap <C-l> <C-r>=lexima#insmode#leave(1, '<LT>C-G>U<LT>RIGHT>')<CR>
" }}}

let g:conda_startup_msg_suppress = 1
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_folding_disabled = 1
autocmd BufNewFile,BufRead *.md set shellslash
