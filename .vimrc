" Last Change: 12-Dec-2016.
if 0 | endif
if has('vim_starting')
set rtp+=~/.vim/bundle/vim-plug
  if !isdirectory(expand('~/.vim/bundle/vim-plug'))
    echo 'install vim-plug...'
    call system('mkdir -p ~/.vim/bundle/vim-plug')
    call system('curl -fLo ~/.vim/bundle/vim-plug/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  endif
endif

call plug#begin('~/.vim/bundle')
" Plugin list
" InsertEnter
Plug 'Shougo/neocomplete.vim',              {'on': []}
Plug 'cohama/lexima.vim',                   {'on': []}
Plug 'Shougo/neosnippet',                   {'on': []}
Plug 'Shougo/neosnippet-snippets',          {'on': []}
Plug 'Shougo/neoinclude.vim',               {'on': []}
Plug 'Shougo/neco-syntax',                  {'on': []}
Plug 'tyru/eskk.vim', {'on': [], 'do': 'curl -fLo ~/.vim/skk/SKK-JISYO.L.gz
      \ --create-dirs http://openlab.jp/skk/dic/SKK-JISYO.L.gz &&
      \ cd ~/.vim/skk &&
      \ gzip -d SKK-JISYO.L.gz
      \ '}

Plug 'dannyob/quickfixstatus'
Plug 'osyo-manga/vim-watchdogs'
Plug 'osyo-manga/shabadou.vim'
Plug 'KazuakiM/vim-qfsigns'
Plug 'Shougo/vimshell',                     {'on' : ['VimShell', 'VimShellPop']}
Plug 'basyura/J6uil.vim',                   {'on' : 'J6uil'}
Plug 'beckorz/previm',                      {'for': 'markdown'}
Plug 'dohq/markdown-preview.vim',           {'for': 'markdown'}
Plug 'joker1007/vim-markdown-quote-syntax', {'for': 'markdown'}
Plug 'gabrielelana/vim-markdown',           {'for': 'markdown'}
Plug 'fatih/vim-go',                        {'for': 'go'}
Plug 'lambdalisue/vim-unified-diff',        {'for': 'diff'}
Plug 'osyo-manga/vim-over',                 {'on' : 'OverCommandLine'}
Plug 'supermomonga/vimshell-kawaii.vim',    {'on' : ['VimShell', 'VimShellPop']}
Plug 'elzr/vim-json',                       {'for': 'json'}
Plug 'kchmck/vim-coffee-script',            {'for': 'coffee'}
Plug 'glidenote/memolist.vim',              {'on' : ['MemoNew', 'MemoList' ,'MemoGrep']}
Plug 'Shougo/vimproc.vim',                  {'do' : 'make'}
Plug 'thinca/vim-quickrun'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Lokaltog/vim-easymotion'
Plug 'junegunn/vim-easy-align'
Plug 'Yggdroot/indentLine'
Plug 'basyura/TweetVim'
Plug 'basyura/bitly.vim'
Plug 'basyura/twibill.vim'
Plug 'tyru/open-browser.vim'
Plug 'itchyny/vim-cursorword'
Plug 'itchyny/vim-parenmatch'
Plug 'jceb/vim-hier'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mattn/webapi-vim'
Plug 'tpope/vim-surround'
Plug 'vim-jp/vimdoc-ja'
Plug 'mattn/vim-terminal'
" Visual
Plug 'chriskempson/base16-vim'
Plug 'felixjung/vim-base16-lightline'
Plug 'itchyny/lightline.vim'
" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'lambdalisue/vim-gista',               {'on' : 'Gista'}
Plug 'lambdalisue/vim-gita',                {'on' : 'Gita'}
" CtrlP
Plug 'ctrlpvim/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'mattn/ctrlp-register'
Plug 'mattn/ctrlp-launcher'
Plug 'kaneshin/ctrlp-filetype'
Plug 'mattn/ctrlp-filer'
Plug 'tacahiroy/ctrlp-funky'
Plug 'suy/vim-ctrlp-commandline'
call plug#end()

filetype plugin indent on
"----------------------------------------
" Option Settings
"----------------------------------------
" Stop include plugin {{{
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
let g:loaded_netrw             = 0
let g:loaded_netrwPlugin       = 0
let g:loaded_netrwSettings     = 0
let g:loaded_netrwFileHandlers = 0
let g:loaded_matchparen        = 1

" }}}
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
set completeopt=menuone
set hidden
set ignorecase
set incsearch
set laststatus=2
set noswapfile
set matchtime=1
set pumheight=10
set scrolloff=1000
set shellslash
set showmatch
set showcmd
set smartcase
set title
set whichwrap=b,s,[,],<,>
set wildmenu
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
nnoremap J 15j
nnoremap K 15k
nnoremap L 10l
nnoremap H 10h
nnoremap Y y$

" gtags
" 検索結果Windowを閉じる
nnoremap <C-q> <C-w><C-w><C-w>q
" Grep 準備
nnoremap <C-g> :Gtags -g
" このファイルの関数一覧
nnoremap <C-l> :Gtags -f %<CR>
" カーソル以下の定義元を探す
nnoremap <C-j> :Gtags <C-r><C-w><CR>
" カーソル以下の使用箇所を探す
nnoremap <C-k> :Gtags -r <C-r><C-w><CR>
" 次の検索結果
nnoremap <C-n> :cn<CR>
" 前の検索結果
nnoremap <C-p> :cp<CR>

" Omni complations like eclipse
imap <C-Space> <C-x><C-o>

" InsertMode move cursor liught
inoremap <C-l> <C-g>U<Right>

" }}}

" Load InsertMode Plugin
augroup load_insert
  autocmd!
  autocmd InsertEnter * call plug#load(
\     'neocomplete.vim',
\     'neosnippet',
\     'neosnippet-snippets',
\     'neco-syntax',
\     'neoinclude.vim',
\     'eskk.vim',
\     'lexima.vim',
\ )
\ | :NeoCompleteEnable
\ | autocmd! load_insert
augroup END

if executable('pt')
  " Use pt over grep
  set grepprg=pt\ --nogroup\ --nocolor
endif

" sudo write
cnoremap w!! w !sudo tee > /dev/null %<CR> :e!<CR>

" replace ;:
nnoremap ; :
nnoremap : ;

" grep window on qf
"autocmd QuickFixCmdPost *grep* cwindow
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep cwindow
augroup ctrlq
  autocmd!
  autocmd FileType help,qf nnoremap <buffer> q <C-w>c
augroup END


set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲

"----------------------------------------
" Plugin Settings
"----------------------------------------
"NeoComplete {{{
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#max_list = 20
let g:neocomplete#enable_underbar_completion = 1
let g:neocomplete#enable_camel_case_completion  =  1
let g:neocomplete#enable_auto_close_preview = 1
let g:neocomplete#sources#dictionary#dictionaries = {
\   'default' : '',
\}

" delimiter_patterns
if !exists('g:neocomplete#delimiter_patterns')
  let g:neocomplete#delimiter_patterns= {}
endif

" Enable omni completion.
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.go = '[^. \t]\.\%(\h\w*\)\?'

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
let g:neocomplete#keyword_patterns['go'] = '\h\w*\.\?'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return neocomplete#close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" buffer開いたらneoconでcache
augroup neocon
  autocmd!
 inoremap <expr><CR> pumvisible() ? neocomplete#close_popup() : "<CR>"
  autocmd BufReadPost,BufEnter,BufWritePost :NeoCompleteBufferMakeCache <buffer>
augroup END
"}}}
" Neo Snipet {{{
"Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

"}}}
" Quickrun {{{
let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config = {
\ '_' : {
\   'runner':                          'vimproc',
\   'runner/vimproc/updatetime':       10,
\   'outputter':                       'error',
\   'outputter/error/success':         'buffer',
\   'outputter/error/error':           'quickfix',
\   'outputter/buffer/split':          ':botright 8sp',
\   'outputter/buffer/close_on_empty': 1,
\   },
\ 'sql' : {
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
\  },
\}

let g:quickrun_oracle_conn = 'bpobat/bpobat\@172.16.211.42/bpodb01.sbps'

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
" Watchdogs {{{
let g:watchdogs_check_CursorHold_enable = 1
let g:watchdogs_check_BufWritePost_enable = 1

if !exists('g:quickrun_config')
    let g:quickrun_config = {}
endif
"let g:quickrun_config['watchdogs_checker/_'] = {
"\   "hook/close_quickfix/enable_exit" : 1,
"\   }
call watchdogs#setup(g:quickrun_config)
" }}}
"TweetVim {{{
" The prefix key.
nnoremap    [TweetVim]   <Nop>
nmap    <Space>t [TweetVim]

nnoremap <silent> [TweetVim]l :<C-u>Unite<Space>tweetvim<CR>
nnoremap <silent> [TweetVim]s :<C-u>TweetVimSay<CR>

let g:tweetvim_tweet_per_page = 60
let g:tweetvim_cache_size     = 10
let g:tweetvim_display_source = 1
"}}}
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
\     ['lineinfo'],
\     ['percent'],
\     ['fileformat', 'fileencoding', 'filetype'],
\   ]
\ },
\ 'component_function': {
\   'modified': 'MyModified',
\   'readonly': 'MyReadonly',
\   'git': 'MyGit',
\   'filename': 'MyFilename',
\   'fileformat': 'MyFileformat',
\   'filetype': 'MyFiletype',
\   'fileencoding': 'MyFileencoding',
\   'mode': 'MyMode',
\ },
\}

function! MyModified()
  return &ft =~# 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &ro ? '⭤' : ''
endfunction

function! MyFilename()
  return ('' !=? MyReadonly() ? MyReadonly() . ' ' : '') .
\ (&ft ==# 'vimfiler' ? vimfiler#get_status_string() :
\  &ft ==# 'unite' ? unite#get_status_string() :
\  &ft ==# 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') :
\ '' !=# expand('%:t') ? expand('%:t') : '[No Name]') .
\ ('' !=# MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyGit()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      let _ = fugitive#head()
      let _ = gita#statusline#format('%rn/%rb')
      return strlen(_) ? '⭠ '._ : ''
      return strlen(_) ? _ : ''
    endif
  catch
  endtry
  return ''
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
let g:eskk#directory = expand('$HOME/.cache/eskk')
let g:eskk#large_dictionary = {
\ 'path': '~/.vim/skk/SKK-JISYO.L',
\ 'sorted': 1,
\}
" Don't keep state.
let g:eskk#keep_state = 0
let g:eskk#show_annotation = 1
let g:eskk_revert_henkan_style = 'okuri'
let g:eskk#egg_like_newline = 1
let g:eskk#egg_like_newline_completion = 1
let g:eskk#tab_select_completion = 1
let g:eskk#start_completion_length = 3
"}}}
" Git {{{
nnoremap    [Git]   <Nop>
nmap    <Space>g [Git]
nnoremap <silent> [Git]g :<C-u>GitGutterToggle<CR>
nnoremap <silent> [Git]h :<C-u>GitGutterLineHighlightsToggle<CR>
" vim-fugitive
nnoremap <silent> [Git]a :<C-u>Gita add %<CR>
nnoremap <silent> [Git]m :<C-u>Gita commit<CR>
nnoremap <silent> [Git]s :<C-u>Gita status<CR>
nnoremap <silent> [Git]d :<C-u>Gita diff<CR>
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
let g:indentLine_char = '▸'
let g:indent_guides_start_level = 1
" }}}
" over.vim {{{
nnoremap <silent> <Space>o :OverCommandLine<CR>
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>
" }}}
"VimShell {{{
" The prefix key.
nnoremap    [VimShell]   <Nop>
nmap    <Space>s [VimShell]

nnoremap <silent> [VimShell]s :<C-u>VimShell<CR>
nnoremap <silent> [VimShell]p :<C-u>VimShellPop<CR>

let g:vimshell_interactive_update_time = 5
let g:vimshell_prompt = $USERNAME.'% '
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
nnoremap <silent> [CtrlP]c :<C-u>call ctrlp#init(ctrlp#commandline#id())<CR>

if executable('files')
  let g:ctrlp_use_caching = 0
  let g:ctrlp_user_command = 'files -a %s'
endif
if !has('python')
    echo 'In order to use pymatcher plugin, you need +python compiled vim'
else
    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif
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
" Lexima {{{
inoremap <C-l> <C-r>=lexima#insmode#leave(1, '<LT>C-G>U<LT>RIGHT>')<CR>
" }}}

"exclude whitespace
let g:extra_whitespace_ignored_filetypes = ['J6uil', 'vim-plug', 'tweetvim', 'help']

" .mdのファイルもfiletypeがmarkdownとなるようにする
au BufRead,BufNewFile *.md set filetype=markdown
" PrevimOpen
"let g:previm_enable_realtime = 1
let g:mkdp_auto_start = 0
let g:mkdp_auto_open = 0
let g:mkdp_path_to_chrome = 'C:\Program Files\Cyberfox\Cyberfox.exe'
