" Last Change: 15-Jul-2016.
if 0 | endif
if has('vim_starting')
  set rtp+=~/.vim/bundle/vim-plug
  if !isdirectory(expand('~/.vim/bundle/vim-plug'))
    echo 'install vim-plug...'
    call system('mkdir -p ~/.vim/bundle/vim-plug')
    call system('curl -fLo ~/.vim/bundle/vim-plug/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  end
endif
" Kaoriya-settings {{{
if has('kaoriya')
" plugins下のディレクトリをruntimepathへ追加する。
  for s:path in split(glob($VIM.'/plugins/*'), '\n')
    if s:path !~# '\~$' && isdirectory(s:path)
      let &runtimepath = &runtimepath.','.s:path
    end
  endfor
  unlet s:path

" WinではPATHに$VIMが含まれていないときにexeを見つけ出せないので修正
  if has('win64') && $PATH !~? '\(^\|;\)' . escape($VIM, '\\') . '\(;\|$\)'
    let $PATH = $VIM . ';' . $PATH
  endif

" vimproc: 同梱のvimprocを無効化する
  if kaoriya#switch#enabled('disable-vimproc')
    let &rtp = join(filter(split(&rtp, ','), 'v:val !~# "[/\\\\]plugins[/\\\\]vimproc$"'), ',')
  endif

" go-extra: 同梱のgo-extraを無効化する
  if kaoriya#switch#enabled('disable-go-extra')
    let &rtp = join(filter(split(&rtp, ','), 'v:val !~# "[/\\\\]plugins[/\\\\]go-extra$"'), ',')
  endif
endif
" }}}

call plug#begin('~/.vim/bundle')
" vim-plug selfmgr
Plug 'junegunn/vim-plug',
      \ {'dir': '~/.vim/bundle/vim-plug/autoload'}
" Plugin list
" InsertEnter
Plug 'Shougo/neocomplete.vim', {'on': []}
Plug 'Shougo/neosnippet', {'on': [] }
Plug 'Shougo/neosnippet-snippets', {'on': [] }
Plug 'Shougo/neoinclude.vim', {'on': []}
Plug 'Shougo/neco-syntax', {'on': []}
Plug 'cohama/lexima.vim', {'on': []}
Plug 'tyru/eskk.vim', {'on': []}
Plug 'osyo-manga/vim-watchdogs', {'on': []}
Plug 'osyo-manga/shabadou.vim', {'on': []}

Plug 'airblade/vim-gitgutter', {'on': 'GitGutterEnable'}
Plug 'Shougo/vimshell', {'on': ['VimShell', 'VimShellPop']}
Plug 'basyura/J6uil.vim', {'on': 'J6uil'}
Plug 'beckorz/previm', {'for': 'markdown'}
Plug 'fatih/vim-go', {'for': 'go', 'tag': 'v1.6'}
Plug 'joker1007/vim-markdown-quote-syntax', {'for': 'markdown'}
Plug 'lambdalisue/vim-gista', {'on': 'Gista' }
Plug 'lambdalisue/vim-gita', {'on': 'Gita'}
Plug 'lambdalisue/vim-unified-diff', {'for': 'diff'}
Plug 'osyo-manga/vim-over', {'on': 'OverCommandLine'}
Plug 'supermomonga/vimshell-kawaii.vim', {'on': ['VimShell', 'VimShellPop']}
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'kchmck/vim-coffee-script', {'for': 'coffee'}
Plug 'glidenote/memolist.vim', {'on': ['MemoNew', 'MemoList' ,'MemoGrep']}
Plug 'thinca/vim-quickrun'
Plug 'miyakogi/vim-quickrun-job'
Plug 'altercation/vim-colors-solarized'
Plug 'Lokaltog/vim-easymotion'
Plug 'Shougo/vimproc.vim'
Plug 'junegunn/vim-easy-align'
Plug 'Yggdroot/indentLine'
Plug 'basyura/TweetVim'
Plug 'basyura/bitly.vim'
Plug 'basyura/twibill.vim'
Plug 'tyru/open-browser.vim'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-cursorword'
Plug 'itchyny/vim-parenmatch'
Plug 'jceb/vim-hier'
Plug 'koron/codic-vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mattn/webapi-vim'
Plug 'spolu/dwm.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-jp/vimdoc-ja'
Plug 'ynkdir/vim-funlib'
Plug 'sheerun/vim-polyglot'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'mattn/ctrlp-register'
Plug 'mattn/ctrlp-codic'
Plug 'kaneshin/ctrlp-filetype'
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
let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_netrwSettings     = 1
let g:loaded_netrwFileHandlers = 1
let g:loaded_matchparen        = 1

" }}}
" color {{{
set t_Co=256
colorscheme solarized
set background=dark
let g:solarized_italic = 0
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
" ノーマルモード時だけ ; と : を入れ替える
let s:hostname = substitute(vimproc#system('hostname'), '\n', '', '')
if s:hostname ==# 'X220-arch'
  nnoremap ; :
  nnoremap : ;
endif

" Omni complations like eclipse
imap <C-Space> <C-x><C-o>

" <S-K> search help
set keywordprg=:help
" }}}

" save as delete tailing Space
augroup spacend
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//e
augroup END

" Load InsertMode Plugin
augroup load_insert
  autocmd!
  autocmd InsertEnter * call plug#load(
\     'neocomplete.vim',
\     'neosnippet',
\     'neosnippet-snippets',
\     'neco-syntax',
\     'neoinclude.vim',
\     'lexima.vim',
\     'vim-watchdogs',
\     'shabadou.vim',
\     'eskk.vim'
\)
\ | :NeoCompleteEnable
\ | call watchdogs#setup(g:quickrun_config)
\ | autocmd! load_insert
augroup END

" 80column
if (exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=9
endif

if executable('pt')
  " Use pt over grep
  set grepprg=pt\ --nogroup\ --nocolor
endif

" sudo write
cnoremap w!! w !sudo tee > /dev/null %<CR> :e!<CR>

"----------------------------------------
" Plugin Settings
"----------------------------------------
"NeoComplete {{{
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Set max list
let g:neocomplete#max_list = 20
" Enable underbar complation
let g:neocomplete#enable_underbar_completion = 1
let g:neocomplete#enable_camel_case_completion  =  1
" Auto close previw window
let g:neocomplete#enable_auto_close_preview = 1
" Auto Select first candidate
"let g:neocomplete#enable_auto_select = 1

" Define dictionary.
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

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

"}}}
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
\ 'colorscheme': 'solarized',
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
      "let _ = fugitive#head()
      let _ = gita#statusline#format('%rn/%rb')
      return strlen(_) ? '⭠ '._ : ''
      "return strlen(_) ? _ : ''
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
let g:gitgutter_enabled = 0
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
" dwm {{{
nnoremap <c-j> <c-w>w
nnoremap <c-k> <c-w>W
nmap <m-r> <Plug>DWMRotateCounterclockwise
nmap <m-t> <Plug>DWMRotateClockwise
nmap <c-n> <Plug>DWMNew
nmap <c-c> <Plug>DWMClose
nmap <c-l> <Plug>DWMGrowMaster
nmap <c-h> <Plug>DWMShrinkMaster
"let g:dwm_master_pane_width=85
" }}}
" watchdogs {{{

" watchdogs writecehck
let g:watchdogs_check_BufWritePost_enable = 1
" watchdogs timercheck
let g:watchdogs_check_CursorHold_enable = 1

" init
if !exists('g:quickrun_config')
    let g:quickrun_config = {}
endif

" watchdogs globalSettings
let g:quickrun_config = {
\   'watchdogs_checker/_' : {
\       'hook/close_quickfix/enable_exit' : 1,
\       'hook/back_window/priority_exit': 1,
\   },
\}

" watchdogs CheckTools
let g:quickrun_config = {
\   'python/watchdogs_checker' : {
\       'type' : 'watchdogs_checker/flake8',
\   },
\   'watchdogs_checker/golint' : {
\       'command':     'golint',
\       'exec':        '%c %o %s:p',
\       'errorformat' : '%f:%l:%c: %m,%-G%.%#',
\   },
\   'go/watchdogs_checker' : {
\       'type' : 'watchdogs_checker/golint'
\   },
\   'watchdogs_checker/vint' : {
\       'command'   : 'vint',
\       'exec'      : '%c %o %s:p',
\   },
\   'vim/watchdogs_checker' : {
\       'type': executable('vint') ? 'watchdogs_checker/vint' : '',
\   },
\  'coffee/watchdogs_checker' : {
\       'type' : 'watchdogs_checker/coffeelint'
\   },
\   'watchdogs_checker/coffeelint' : {
\       'command'   : 'coffeelint',
\       'exec'      : '%c %o %s:p',
\   },
\}
" }}}
" QuickRun {{{
" <C-c> で実行を強制終了させる
" quickrun.vim が実行していない場合には <C-c> を呼び出す
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
augroup quitqf
  autocmd!
  au FileType qf nnoremap <silent><buffer>q :quit<CR>
augroup END

let g:quickrun_config = get(g:, 'quickrun_config', {})

let g:quickrun_config = {
\ '_' : {
\     'hook/u_nya_/enable': 1,
\     'runner': 'job',
\     'runner/job/updatetime': 10,
\     'outputter/error/success': 'buffer',
\     'outputter/error/error': 'quickfix',
\     'outputter/buffer/split': ':rightbelow 8sp',
\     'outputter/buffer/close_on_empty': 1,
\ },
\}
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
let g:indentLine_color_term = 111
let g:indentLine_color_gui = '#708090'
let g:indentLine_char = '¦'
let g:indent_guides_start_level = 2
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
"vim-agrep {{{
let g:agrep#config = {
\   'command' : 'pt',
\   'option'  : '--nogroup --nocolor',
\   'open_cmd' : 'split'
\}
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

if !executable('files')
  call system('go get github.com/mattn/files')
  let g:ctrlp_user_command = 'files -a %s'
endif
let g:ctrlp_match_func = {'match': 'pymatcher#PyMatch'}
let g:ctrlp_map = '<Nop>'
" Guess vcs root dir
let g:ctrlp_working_path_mode = 'ra'
" Open new file in current window
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
"}}}

" vimfiler
let g:vimfiler_as_default_explorer=1

" .mdのファイルもfiletypeがmarkdownとなるようにする
au BufRead,BufNewFile *.md set filetype=markdown
" PrevimOpen
let g:previm_enable_realtime = 1
