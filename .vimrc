if 0 | endif
if has('vim_starting')
  set rtp+=~/.vim/bundle/vim-plug
  if !isdirectory(expand('~/.vim/bundle/vim-plug'))
    echo 'install vim-plug...'
    call system('mkdir -p ~/.vim/bundle/vim-plug')
    call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/bundle/vim-plug/autoload')
  end
endif

call plug#begin('~/.vim/bundle')
  Plug 'junegunn/vim-plug',
     \ {'dir': '~/.vim/bundle/vim-plug/autoload'}
" Plugin list
Plug 'Lokaltog/vim-easymotion'
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/neosnippet' | Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/unite.vim' | Plug 'Shougo/unite-outline'
Plug 'Shougo/vimfiler'
Plug 'Shougo/vimproc.vim'
Plug 'Shougo/vimshell' | Plug 'supermomonga/vimshell-kawaii.vim'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'basyura/J6uil.vim'
Plug 'basyura/TweetVim'
Plug 'basyura/bitly.vim'
Plug 'basyura/twibill.vim'
Plug 'beckorz/previm'
Plug 'cohama/lexima.vim'
Plug 'itchyny/lightline.vim'
Plug 'joker1007/vim-markdown-quote-syntax'
Plug 'lambdalisue/vim-unified-diff'
Plug 'mattn/favstar-vim'
Plug 'mattn/webapi-vim'
Plug 'mattn/vim-terminal'
"Plug 'nathanaelkane/vim-indent-guides'
Plug 'osyo-manga/vim-over'
Plug 'rcmdnk/vim-markdown'
Plug 'rhysd/unite-codic.vim' | Plug 'koron/codic-vim'
Plug 'spolu/dwm.vim'
if has('linux') || has('darwin')
Plug 'yuratomo/w3m.vim'
endif
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tsukkee/unite-tag'
Plug 'tyru/open-browser.vim'
Plug 'vim-jp/vimdoc-ja'
Plug 'ujihisa/neco-look'
Plug 'tyru/eskk.vim'
Plug 'lambdalisue/vim-gista', { 'on':  ['Gista'] }
Plug 'Yggdroot/indentLine'
Plug 'b4b4r07/vim-shellutils'
Plug 'thinca/vim-quickrun'
Plug 'ynkdir/vim-funlib'
Plug 'osyo-manga/shabadou.vim'
Plug 'osyo-manga/vim-watchdogs'
Plug 'jceb/vim-hier'
Plug 'dannyob/quickfixstatus'
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'mattn/sonictemplate-vim'
Plug 'itchyny/vim-parenmatch'
Plug 'itchyny/vim-cursorword'
Plug 'KazuakiM/vim-qfsigns'
call plug#end()

filetype plugin indent on
"----------------------------------------
" Option Settings
"----------------------------------------
set t_Co=256
colorscheme solarized
set background=dark
let g:solarized_italic = 0

" Encoding
set enc=UTF-8
scriptencoding utf-8
set fencs=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932,utf-16le,utf-16,default,latin1,utf-8

" save as delete tailing Space
augroup spacend
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//e
augroup END

" disable matchparen
let g:loaded_matchparen = 1

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

" Keybind
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
let s:hostname = substitute(system('hostname'), '\n', '', '')
if s:hostname ==# 'X220-arch'
  nnoremap ; :
  nnoremap : ;
endif

" 80column
if (exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=9
endif

"----------------------------------------
" Plugin Settings
"----------------------------------------
"NeoComplete {{{
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 2

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
let g:neocomplete#keyword_patterns['go'] = '\h\w*\.\?'

if !exists('g:neocomplete#text_mode_filetypes')
    let g:neocomplete#text_mode_filetypes = {}
endif
let g:neocomplete#text_mode_filetypes = {
            \ 'rst': 1,
            \ 'markdown': 1,
            \ 'gitrebase': 1,
            \ 'gitcommit': 1,
            \ 'vcs-commit': 1,
            \ 'hybrid': 1,
            \ 'text': 1,
            \ 'help': 1,
            \ 'tex': 1,
            \ }
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"  return neocomplete#smart_close_popup() . "\<CR>"
"  " For no inserting <CR> key.
"  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
"endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Enable omni completion.
augroup neocon
autocmd!
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
let g:neocomplete#lock_iminsert = 1
"ポップアップメニューで表示される候補の数。初期値は100
let g:neocomplete#max_list = 20
" 補完候補が出ていたら確定、なければ改行
 inoremap <expr><CR> pumvisible() ? neocomplete#close_popup() : "<CR>"
" buffer開いたらneoconでcache
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

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
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
" Unite{{{
" The prefix key.
nnoremap    [unite]   <Nop>
nmap    <Space>u [unite]

" unite.vim keymap
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
nnoremap <silent> [unite]u :<C-u>Unite<Space>file<CR>
nnoremap <silent> [unite]g :<C-u>Unite<Space>grep<CR>
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]h :<C-u>Unite<Space>history/yank<CR>
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]c :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,vr :UniteResume<CR>

" Grep
if executable('pt')
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_max_candidates = 200
  let g:unite_source_grep_encoding = 'utf-8'
endif
"}}}
" lightline.vim{{{
let g:lightline = {
        \ 'colorscheme': 'solarized',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [
        \     ['mode', 'paste'],
        \     ['fugitive', 'gitgutter', 'filename'],
        \   ],
        \   'right': [
        \     ['lineinfo'],
        \     ['percent'],
        \     ['charcode', 'fileformat', 'fileencoding', 'filetype'],
        \   ]
        \ },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'fugitive': 'MyFugitive',
        \   'filename': 'MyFilename',
        \   'fileformat': 'MyFileformat',
        \   'filetype': 'MyFiletype',
        \   'fileencoding': 'MyFileencoding',
        \   'mode': 'MyMode',
        \   'charcode': 'MyCharCode',
        \   'gitgutter': 'MyGitGutter',
        \ },
        \ 'separator': {'left': '⮀', 'right': '⮂'},
        \ 'subseparator': {'left': '⮁', 'right': '⮃'}
        \ }

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

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      let _ = fugitive#head()
      return strlen(_) ? '⭠ '._ : ''
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

function! MyGitGutter()
  if ! exists('*GitGutterGetHunkSummary')
        \ || ! get(g:, 'gitgutter_enabled', 0)
        \ || winwidth('.') <= 90
    return ''
  endif
  let symbols = [
        \ g:gitgutter_sign_added . ' ',
        \ g:gitgutter_sign_modified . ' ',
        \ g:gitgutter_sign_removed . ' '
        \ ]
  let hunks = GitGutterGetHunkSummary()
  let ret = []
  for i in [0, 1, 2]
    if hunks[i] > 0
      call add(ret, symbols[i] . hunks[i])
    endif
  endfor
  return join(ret, ' ')
endfunction

" https://github.com/Lokaltog/vim-powerline/blob/develop/autoload/Powerline/Functions.vim
function! MyCharCode()
  if winwidth('.') <= 70
    return ''
  endif

  " Get the output of :ascii
  redir => ascii
  silent! ascii
  redir END

  if match(ascii, 'NUL') != -1
    return 'NUL'
  endif

  " Zero pad hex values
  let nrformat = '0x%02x'

  let encoding = (&fenc ==? '' ? &enc : &fenc)

  if encoding ==# 'utf-8'
    " Zero pad with 4 zeroes in unicode files
    let nrformat = '0x%04x'
  endif

  " Get the character and the numeric value from the return value of :ascii
  " This matches the two first pieces of the return value, e.g.
  " "<F>  70" => char: 'F', nr: '70'
  let [str, char, nr; rest] = matchlist(ascii, '\v\<(.{-1,})\>\s*([0-9]+)')

  " Format the numeric value
  let nr = printf(nrformat, nr)

  return "'". char ."' ". nr
endfunction

" after WatchdogsRun reload lightline.vim
let g:Qfstatusline#UpdateCmd = function('lightline#update')
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
\ }
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
nnoremap <silent> [Git]a :<C-u>Gwrite<CR>
nnoremap <silent> [Git]m :<C-u>Gcommit<CR>
" }}}
" dwm.vim {{{
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
\   '_' : {
\       'hook/koshikoshi/enable' : 1,
\       'hook/koshikoshi/wait' : 20,
\       'runner/vimproc/updatetime' : 10,
\       'outputter/buffer/close_on_empty' : 1,
\       'outputter/buffer/split' : ':rightbelow 8sp',
\       'outputter/error/error' : 'quickfix',
\       'outputter/error/success' : 'buffer',
\       'outputter' : 'error',
\       'runner' : 'vimproc',
\   },
\}
" }}}
" pyfleaks {{{
let s:pyflakes = executable('pyflakes3') ? 'pyflakes3' :
      \          executable('python3') ? 'python3' :
      \          executable('pyflakes') ? 'pyflakes' :
      \          'python'
let s:cmdopt = executable('pyflakes3') ? '' :
      \          executable('python3') ? '-m pyflakes' :
      \          executable('pyflakes') ? '' :
      \          '-m pyflakes'
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

" watchdogs CheckTools
let g:quickrun_config = {
\   'watchdogs_checker/pyflakes3' : {
\       'command' : s:pyflakes,
\       'cmdopt' : s:cmdopt,
\       'exec'    : '%c %o %s:p',
\       'errorformat' : '%f:%l:%m',
\   },
\   'python/watchdogs_checker' : {
\       'type' : 'watchdogs_checker/pyflakes3',
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
\   'vim/watchdogs_checker': {
\       'type': executable('vint') ? 'watchdogs_checker/vint' : '',
\   },
\}

" watchdogs global settings
let g:quickrun_config['watchdogs_checker/_'] = {
\   'outputter/quickfix/open_cmd' : '',
\   'hook/qfstatusline_update/enable_exit' : 1,
\   'hook/qfstatusline_update/priority_exit' : 4,
\   'hook/qfsigns_update/enable_exit':   1,
\   'hook/qfsigns_update/priority_exit': 3,
\}

" don't remove
call watchdogs#setup(g:quickrun_config)
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
let g:go_fmt_command = 'goimports'
" }}}
" qfsign {{{
" If syntax error, cursor is moved at line setting sign.
let g:qfsigns#AutoJump = 1
" If syntax error, view split and cursor is moved at line setting sign.
let g:qfsigns#AutoJump = 2
" }}}

" over.vim
nnoremap <silent> <Space>m :OverCommandLine<CR>
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>

"vim-indent-guide
"let g:indent_guides_enable_on_vim_startup=1
"let g:indent_guides_guide_size=4

" vim-indent-line
let g:indentLine_color_term = 111
let g:indentLine_color_gui = '#708090'
let g:indentLine_char = '¦'
let g:indent_guides_start_level = 2

" vimfiler
let g:vimfiler_as_default_explorer=1

"VimShell
let g:vimshell_interactive_update_time = 5
let g:vimshell_prompt = $USERNAME.'% '
nnoremap <silent> vs :VimShell<CR>
nnoremap <silent> vp :VimShellPop<CR>

" .mdのファイルもfiletypeがmarkdownとなるようにする
au BufRead,BufNewFile *.md set filetype=markdown
" markdownの折りたたみなし
let g:vim_markdown_folding_disabled=1
" PrevimOpen
let g:previm_enable_realtime = 1
