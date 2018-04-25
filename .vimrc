" File              : .vimrc
" Author            : dohq <dorastone@gmail.com>
" Date              : 21.01.2018
" Last Modified Date: 08.04.2018
" Last Modified By  : dohq <dorastone@gmail.com>
" init {{{
" encoding
set encoding=utf8
scriptencoding utf-8

" Use as many color as possibleo
if !has('gui_running')
      \ && exists('&termguicolors')
      \ && $COLORTERM =~# '^\%(truecolor\|24bit\)$'
  " https://medium.com/@dubistkomisch/how-to-actually-get-italics-and-true-colour-to-work-in-iterm-tmux-vim-9ebe55ebc2be
  if !has('nvim')
    let &t_8f = "\e[38;2;%lu;%lu;%lum"
    let &t_8b = "\e[48;2;%lu;%lu;%lum"
  endif
  set termguicolors       " use truecolor in term
endif

" set MYVIMDIR
let s:MSWindows = has('win32')
if s:MSWindows
  let $MYVIMDIR = expand($HOME.'/vimfiles')
else
  let $MYVIMDIR = expand('~/.vim')
endif

" Startup time.
if !v:vim_did_enter && has('reltime')
  let g:startuptime = reltime()
  augroup vimrc-startuptime
    autocmd! VimEnter * let g:startuptime = reltime(g:startuptime)
          \ | redraw
          \ | echomsg 'startuptime: ' . reltimestr(g:startuptime)
  augroup END
endif

" All autocmd reset
augroup vimrc
  autocmd!
augroup END
" }}}
" vimrc_local {{{
augroup vimrc-local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

function! s:vimrc_local(loc)
  let s:files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
  for s:i in reverse(filter(s:files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction
" }}}

call plug#begin($MYVIMDIR.'/plugins')
" exTools
Plug 'tpope/vim-sensible'
Plug 'ervandew/supertab'
Plug 'glidenote/memolist.vim',              {'on': ['MemoNew', 'MemoList' ,'MemoGrep']}
Plug 'itchyny/vim-parenmatch'
Plug 'justinmk/vim-dirvish'
Plug 'vim-jp/vimdoc-ja'
Plug 'mhinz/vim-grepper',                   {'on': ['Grepper', '<plug>(GrepperOperator)']}
Plug 'tyru/eskk.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'osyo-manga/vim-anzu'
" Input Assist
if has('nvim')
  Plug 'Shougo/deoplete.nvim',              { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/neco-vim'
  Plug 'zchee/deoplete-jedi'
else
  Plug 'maralla/completor.vim'
endif
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'cohama/lexima.vim'
Plug 'bronson/vim-trailing-whitespace',     {'on': 'FixWhitespace'}
Plug 'mattn/sonictemplate-vim'
Plug 'easymotion/vim-easymotion'
Plug 'AndrewRadev/switch.vim'
Plug 'junegunn/vim-easy-align'
Plug 'osyo-manga/vim-over',                 {'on': 'OverCommandLine'}
Plug 'tpope/vim-surround'
Plug 'tyru/caw.vim'
Plug 'tpope/vim-speeddating'
Plug 'wakatime/vim-wakatime'
Plug 'lambdalisue/vim-unified-diff'
Plug 'kana/vim-operator-user'
Plug 'mbbill/undotree'
Plug 'tpope/vim-scriptease'
Plug 'Chiel92/vim-autoformat'
Plug 'simeji/winresizer'

" Visual
Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'
Plug 'felixjung/vim-base16-lightline'
Plug 'Yggdroot/indentLine'
Plug 'ryanoasis/vim-devicons'
Plug 'rhysd/try-colorscheme.vim'
Plug 'cocopon/iceberg.vim'
Plug 'morhetz/gruvbox'
" QuickRun
Plug 'thinca/vim-quickrun'
Plug 'osyo-manga/shabadou.vim'
" Test
Plug 'janko-m/vim-test'
Plug 'tpope/vim-dispatch'
Plug 'tlvince/vim-compiler-python'
" Twitter
Plug 'basyura/TweetVim'
Plug 'basyura/twibill.vim'
Plug 'tyru/open-browser.vim'
Plug 'mattn/webapi-vim'
" Syntax Check
Plug 'w0rp/ale'
" Git
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/vim-gitbranch'
Plug 'lambdalisue/vim-gista',               {'on': 'Gista'}
Plug 'lambdalisue/gina.vim'
" CtrlP
Plug 'ctrlpvim/ctrlp.vim'
Plug 'DavidEGx/ctrlp-smarttabs'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'mattn/ctrlp-launcher'
Plug 'mattn/ctrlp-register'
Plug 'suy/vim-ctrlp-commandline'
Plug 'tacahiroy/ctrlp-funky'
Plug 'zeero/vim-ctrlp-help'
Plug 'mattn/ctrlp-filer'
Plug 'mattn/ctrlp-ghq'
" Python
Plug 'kana/vim-textobj-user'
Plug 'bps/vim-textobj-python',              {'for': 'python'}
Plug 'cjrh/vim-conda',                      {'for': 'python'}
Plug 'hynek/vim-python-pep8-indent',        {'for': 'python'}
Plug 'jmcantrell/vim-virtualenv',           {'for': 'python'}
Plug 'lambdalisue/vim-django-support',      {'for': 'python'}
Plug 'vim-python/python-syntax',            {'for': 'python'}
Plug 'davidhalter/jedi-vim',                {'for': 'python'}
" Markdown
Plug 'rcmdnk/vim-markdown',                 {'for': 'markdown'}
Plug 'rcmdnk/vim-markdown-quote-syntax',    {'for': 'markdown'}
Plug 'kazuph/previm',                       {'for': 'markdown', 'branch': 'feature/add-plantuml-plugin'}
" UML
Plug 'aklt/plantuml-syntax',                {'for': 'plantuml'}
Plug 'scrooloose/vim-slumlord',             {'for': 'plantuml'}
" json
Plug 'elzr/vim-json',                       {'for': 'json'}
" go
Plug 'fatih/vim-go',                        {'for': 'go', 'do': ':GoInstallBinaries'}
" yaml
Plug 'chase/vim-ansible-yaml',              {'for': 'yml'}
Plug 'stephpy/vim-yaml',                    {'for': 'yml'}

" Plug 'thinca/vim-showtime',                 {'on': 'ShowtimeStart'}
Plug 'y0za/vim-reading-vimrc'
Plug 'alpertuna/vim-header'

call plug#end()

"----------------------------------------
" Option Settings
"----------------------------------------
" color {{{
set t_Co=256
colorscheme iceberg
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none
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
set fileencodings=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932,utf-16le,utf-16,default,latin1,utf-8
" }}}
" set opt {{{
set ambiwidth=double
set autoread
set autowrite
set belloff=all
set cmdheight=2
set colorcolumn=80
set completeopt-=preview
set cursorline
set display=lastline
set expandtab
set foldmethod=marker
set helplang=ja,en
set hidden
set hlsearch
set ignorecase
set imdisable
set incsearch
set list
set listchars=tab:▸.,trail:-,eol:\ ,extends:»,precedes:«,nbsp:%
set matchpairs+=<:>
set noautoindent
set nobackup
set noequalalways
set nosmartindent
set nostartofline
set noswapfile
set novisualbell
set nrformats-=octal
set scrolloff=7
set shiftround
set shiftwidth=2
set shortmess+=atIc
set showtabline=0
set smartcase
set softtabstop=2
set splitbelow splitright
set switchbuf=useopen
set synmaxcol=512
set tabstop=2
set tags=./tags;
set title
set ttyfast
set whichwrap=b,s,[,],<,>
set wildignore+=*.out,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore=*.o,*.obj,*.pyc,*.so,*.dll,*.exe,*.xlsx
set wildmenu
set wildmode=full
" use clipboard
if has('win32') && !has('nvim')
  set clipboard=unnamed,autoselect
else
  set clipboard=unnamedplus
endif
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
if has('persistent_undo')
  let s:undo_dir = $MYVIMDIR . '/.undo'
  if !isdirectory(s:undo_dir)
    call mkdir(s:undo_dir)
  endif
  set undodir=s:undo_dir
  set undofile
endif
if !has('nvim') && has('terminal')
  set termsize=15x0
endif
if exists('+breakindent')
  set breakindent
  set breakindentopt=sbr
  set showbreak=<
endif
if has('tabsidebar')
  function! TabSideBar() abort
    return printf('%2d. %%f%%m%%r', g:actual_curtabpage)
  endfunction
  set showtabsidebar=0
  set tabsidebarcolumns=16
  set tabsidebar=%!TabSideBar()
endif
" }}}
" Keybind {{{
let g:mapleader = ','

" escape
inoremap jj <ESC>

" replace ; to :
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" disable allow key
nnoremap <Up>    <Nop>
nnoremap <Down>  <Nop>
nnoremap <Left>  <Nop>
nnoremap <Right> <Nop>
inoremap <Up>    <Nop>
inoremap <Down>  <Nop>
inoremap <Left>  <Nop>
inoremap <Right> <Nop>

" buffer
nnoremap <C-p> :bprev<CR>
nnoremap <C-n> :bnext<CR>

" moving nextline
nnoremap <expr> j v:count == 0 ? 'gj' : 'j'
nnoremap <expr> k v:count == 0 ? 'gk' : 'k'

" C-n and C-p now complete commands in command mode like up and down arrow
cnoremap <c-n> <down>
cnoremap <c-p> <up>

" redraw and nohl
nnoremap <silent> <C-l> :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr>:redraw!<cr>

" I don't want help right now!
vnoremap <F1> <Esc>
nnoremap <F1> <Esc>
inoremap <F1> <Esc>

" insert days
iabbrev xdate <c-r>=strftime("%Y-%m-%d")<cr>

" sudo write
cnoremap w!! w !sudo tee > /dev/null %<CR> :e!<CR>

" Make sure pasting in visual mode doesn't replace paste buffer
vmap <silent> <expr> p <sid>Repl()

" open fold
nnoremap <silent> <space>f @=(foldlevel('.')?'za':"\<space>")<CR>

" yanky
nnoremap Y y$

" open urxvt
nnoremap got :call system('urxvt -cd '.getcwd().' &')<cr>
nnoremap goT :call system('urxvt -cd '.expand("%:p:h").' &')<cr>

" Centering search word
nnoremap n nzz
nnoremap N Nzz
" }}}

"----------------------------------------
" Plugin Settings
"----------------------------------------
" completor {{{
let g:completor_auto_trigger = 1
let g:completor_refresh_always = 0
let g:completor_set_options = 1
" }}}
" deoplete {{{
let g:deoplete#enable_at_startup = 1
" }}}
" ultisnips {{{
" Trigger configuration.
let g:UltiSnipsExpandTrigger = '<c-k>'
let g:UltiSnipsJumpForwardTrigger = '<c-k>'
let g:UltiSnipsJumpBackwardTrigger = '<c-h>'

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit='vertical'
"}}}
" Quick-Run {{{
let g:quickrun_config = {
      \   '_' : {
      \       'runner' : 'job',
      \       'outputter' : 'error',
      \       'hook/neco/enable' : 1,
      \       'hook/neco/wait' : 10,
      \       'outputter/error/success' : 'buffer',
      \       'outputter/error/error'   : 'quickfix',
      \       'outputter/buffer/split' : ':belowright 8sp',
      \       'outputter/buffer/close_on_empty' : 1,
      \       'outputter/buffer/into' : 1,
      \       'outputter/quickfix/into' : 1,
      \   },
      \}
if s:MSWindows
  let g:quickrun_config = {
        \ 'python' : {
        \     'hook/output_encode/enable' : 1,
        \     'hook/output_encode/encoding' : 'cp932',
        \ },
        \}
endif
let g:quickrun_no_default_key_mappings = 1
" Running with close quickfix and save file
nnoremap <silent><Leader>r :cclose<CR>:write<CR>:QuickRun -mode n<CR>
xnoremap <silent><Leader>r :<C-U>cclose<CR>:write<CR>gv:QuickRun -mode v<CR>
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : ""
autocmd vimrc FileType qf nnoremap <silent><buffer>q :cclose<CR>
command! -nargs=+ -complete=command Capture QuickRun -type vim -src <q-args>
" }}}
" ale {{{
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_sign_column_always = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_statusline_format = [' %d', ' %d', ' ok']

let g:ale_pattern_options = {
      \   '.*\.vim$': {'ale_enabled': 0},
      \}
nmap [ale] <Nop>
map <C-k> [ale]
" エラー行にジャンプ
nmap <silent> [ale]<C-P> <Plug>(ale_previous)
nmap <silent> [ale]<C-N> <Plug>(ale_next)

" " }}}
" lightline.vim{{{
let g:lightline = {
      \ 'colorscheme': 'iceberg',
      \ 'active': {
      \   'left': [['mode', 'paste'],
      \            ['gitbranch', 'filename']],
      \   'right': [['lineinfo', 'validator'],
      \             ['fileformat', 'fileencoding', 'filetype']]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'Branch',
      \   'validator': 'ALEGetStatusLine',
      \   'filename': 'FileName',
      \   'fileformat': 'Fileformat',
      \   'filetype': 'FileType',
      \   'fileencoding': 'FileEncoding',
      \ },
      \}

function! FileName()
  let s:name = expand('%:t')
  let s:name = s:name !=# '' ? s:name : '[No Name]'
  if s:name =~? 'netrw'
    return 'netrw'
  endif
  let s:readonly = &readonly ? ' ' : ''
  let s:modified = &modified ? ' ' : ''
  return s:readonly . s:name . s:modified
endfunction

function! Branch()
  try
    if &filetype !~? 'vimfiler\|gundo' && exists('*gitbranch#name') && strlen(gitbranch#name())
      return '' . gitbranch#name()
    endif
  catch
  endtry
  return ''
endfunction

function! FileType()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! Fileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! FileEncoding()
  return winwidth('.') > 70 ? (strlen(&fileencoding) ? &fileencoding : &encoding) : ''
endfunction

function! ALEGetStatusLine() abort
  return ale#statusline#Status()
endfunction

" command prompt use iceberg instead base16
if has('win32') && !has('gui_running')
  let g:lightline = {'colorscheme': 'base16_ashes'}
  colorscheme base16-ashes
endif

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
let g:EasyMotion_keys = ';HKLYUIOPNM,QWERTASDGZXCVBJF'
let g:EasyMotion_use_upper = 1
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
" }}}
" ESKK {{{
let g:eskk#enable_completion = 0
let g:eskk#directory = expand($MYVIMDIR.'/.cache/eskk')
let g:eskk#large_dictionary = {
      \ 'path': $MYVIMDIR.'/skk/SKK-JISYO.L',
      \ 'sorted': 1,
      \}
" Don't keep state.
let g:eskk#keep_state = 0
let g:eskk#show_annotation = 0
let g:eskk#revert_henkan_style = 'okuri'
let g:eskk#egg_like_newline = 1
let g:eskk#egg_like_newline_completion = 1

"allow InsertMode toggle ESKK
augroup eskk
  autocmd!
  autocmd eskk VimEnter * imap <C-j> <Plug>(eskk:toggle)
  autocmd eskk VimEnter * cmap <C-j> <Plug>(eskk:toggle)
augroup END
"}}}
" Git {{{
let g:gitgutter_enabled = 1
let g:gitgutter_sign_added = ''
let g:gitgutter_sign_modified = ''
let g:gitgutter_sign_removed = ''
nnoremap          [Git]   <Nop>
nmap     <Space>g [Git]
nnoremap <silent> [Git]g :<C-u>GitGutterToggle<CR>
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
let g:go_fmt_command = 'goimports'
" }}}
" vim-indent-line {{{
let g:indentLine_setColors = 1
let g:indentLine_setConceal = 1
let g:indentLine_faster = 1
let g:indentLine_color_term = 111
let g:indentLine_color_gui = '#708090'
let g:indentLine_char = '¦'
let g:indentLine_fileTypeExclude = ['tweetvim', 'help']
" }}}
" over.vim {{{
nnoremap <silent> <leader>o :OverCommandLine<CR>
" }}}
" Twit {{{
" open-browser.vim
let g:netrw_nogx = 1
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
autocmd vimrc FileType twitvim call s:twitvim_my_settings()
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
nnoremap <silent> [TweetVim]f :<C-u>TweetVimSearch<Space>
" }}}
" Memolist{{{
" The prefix key.
nnoremap    [memo]   <Nop>
nmap    <Space>m [memo]

" unite.vim keymap
nnoremap <silent> [memo]n :<C-u>MemoNew<CR>
nnoremap <silent> [memo]l :<C-u>exe "CtrlP" g:memolist_path<cr><f5>
nnoremap <silent> [memo]g :<C-u>MemoGrep<CR>
let g:memolist_memo_suffix = 'md'
let g:memolist_path = '~/Dev/memo'
let g:memolist_unite = 1
let g:memolist_unite_option = '-start-insert'
"}}}
"CtrlP {{{
nnoremap          [CtrlP]   <Nop>
nmap     <Space>u [CtrlP]
nnoremap <silent> [CtrlP]u :<C-u>CtrlP<CR>
nnoremap <silent> [CtrlP]g :<C-u>CtrlPGhq<CR>
nnoremap <silent> [CtrlP]b :<C-u>CtrlPBuffer<CR>
nnoremap <silent> [CtrlP]f :<C-u>CtrlPFunky<CR>
nnoremap <silent> [CtrlP]m :<C-u>CtrlPMRU<CR>
nnoremap <silent> [CtrlP]r :<C-u>CtrlPRegister<CR>
nnoremap <silent> [CtrlP]t :<C-u>CtrlPTag<CR>
nnoremap <silent> [CtrlP]l :<C-u>CtrlPLauncher<CR>
nnoremap <silent> [CtrlP]h :<C-u>CtrlPHelp<CR>
nnoremap <silent> [CtrlP]s :<C-u>CtrlPSmartTabs<CR>
nnoremap <silent> [CtrlP]d :<C-u>UndotreeToggle<CR>
nnoremap <silent> [CtrlP]c :<C-u>call ctrlp#init(ctrlp#commandline#id())<CR>
nnoremap <silent> [CtrlP]e :<C-u>e $MYVIMRC<CR>
nnoremap <silent> [CtrlP]w :<C-u>source $MYVIMRC<CR>

let g:ctrlp_use_caching = 0
let g:ctrlp_user_command = 'files -a %s'

let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_lazy_update = 0
let g:ctrlp_map = '<Nop>'
" Guess vcs root dir
let g:ctrlp_working_path_mode = 'ra'
" Open new file in current window
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_match_window = 'order:ttb,max:10'
let g:ctrlp_smarttabs_modify_tabline = 0
let g:ctrlp_smarttabs_exclude_quickfix = 1
" }}}
" Python {{{
autocmd vimrc FileType python setlocal omnifunc=jedi#completions
let g:python_highlight_all = 1
let g:jedi#completions_enabled = 1
let g:jedi#goto_command = '<leader>g'
let g:jedi#documentation_command = '<leader>k'
let g:jedi#usages_command = '<leader>n'
let g:jedi#completions_command = ''
let g:jedi#rename_command = '<leader>R'
let g:jedi#show_call_signatures = '2'
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
" vim-conda
let g:conda_startup_msg_suppress = 1
nnoremap <silent> <leader>s :Switch<CR>
" }}}
" caw.vim {{{
nmap <leader>c      <Plug>(caw:hatpos:toggle)
vmap <leader>c      <Plug>(caw:hatpos:toggle)
" }}}
" Previm {{{
let g:previm_enable_realtime = 1
let g:netrw_nogx = 1
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
if s:MSWindows
  autocmd BufNewFile,BufRead *.md set shellslash
endif
" }}}
" FixWhitespace {{{
let g:extra_whitespace_ignored_filetypes = ['markdown', 'J6uil', 'vim-plug', 'tweetvim', 'help']
" }}}
" SuperTab {{{
let g:SuperTabContextDefaultCompletionType = '<c-n>'
let g:SuperTabDefaultCompletionType = '<c-n>'
" }}}
" vim-ref {{{
let g:ref_phpmanual_path = $MYVIMDIR.'/doc/php-chunked-xhtml'
" }}}
" lexima {{{
inoremap <C-l> <C-r>=lexima#insmode#leave(1, '<LT>C-G>U<LT>RIGHT>')<CR>
" }}}
" Grepper {{{
let g:grepper               = {}
let g:grepper.tools         = ['rg', 'git', 'pt', 'ag']
let g:grepper.jump          = 0
let g:grepper.simple_prompt = 1
let g:grepper.quickfix      = 1
" }}}
" vim-header {{{
let g:header_field_author = 'dohq'
let g:header_field_author_email = 'dorastone@gmail.com'
let g:header_auto_add_header = 0
" }}}
" vim-asterisk {{{
let g:asterisk#keeppos = 1
" }}}
" anzu.vim and asterisk.vim {{{
nmap * <Plug>(asterisk-z*)<Plug>(anzu-mode)
map #  <Plug>(asterisk-z#)
map g* <Plug>(asterisk-gz*)
map g# <Plug>(asterisk-gz#)
" }}}
" user command {{{
" auto-cursorline {{{
augroup vimrc-auto-cursorline
  autocmd!
  autocmd CursorMoved,CursorMovedI * call s:auto_cursorline('CursorMoved')
  autocmd CursorHold,CursorHoldI * call s:auto_cursorline('CursorHold')
  autocmd WinEnter * call s:auto_cursorline('WinEnter')
  autocmd WinLeave * call s:auto_cursorline('WinLeave')

  let s:cursorline_lock = 0
  function! s:auto_cursorline(event)
    if a:event ==# 'WinEnter'
      setlocal cursorline
      let s:cursorline_lock = 2
    elseif a:event ==# 'WinLeave'
      setlocal nocursorline
    elseif a:event ==# 'CursorMoved'
      if s:cursorline_lock
        if 1 < s:cursorline_lock
          let s:cursorline_lock = 1
        else
          setlocal nocursorline
          let s:cursorline_lock = 0
        endif
      endif
    elseif a:event ==# 'CursorHold'
      setlocal cursorline
      let s:cursorline_lock = 1
    endif
  endfunction
augroup END
" }}}
" past to ix.io {{{
command! -range=% SP  execute <line1> . "," . <line2> .
      \ "w !curl -F 'f:1=<-' ix.io | tr -d '\\n'"
" http://snippetrepo.com/snippets/filter-quickfix-list-in-vim
" }}}
" disable uncomment newline {{{
augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=ro
  autocmd InsertEnter * :setlocal noimdisable
  autocmd InsertLeave * :setlocal imdisable
augroup END
" }}}
" Toggle semicolon, comma or neither at {{{
" end of line without moving cursor
nnoremap <leader>; :call ToggleSemiColonComma()<cr>

function! ToggleSemiColonComma() abort
  let l:last = getline(line('.'))[-1:]
  if l:last =~# ','
    execute 'normal! mz$x`z'
  elseif l:last =~# ';'
    execute 'normal! mz$r,`z'
  elseif l:last !~# '(,|;)'
    execute 'normal! mzA;`z'
  endif
endfunction
" highlight off in insert mode {{{
augroup search_highlight
  autocmd!
  autocmd InsertEnter * :setlocal nohlsearch
  autocmd InsertLeave * :setlocal hlsearch
augroup END
" }}}
" }}}
" reading_vimrc {{{
autocmd vimrc FileType vim vmap <Space> <Plug>(reading_vimrc-update_clipboard)
"}}}
" RedtoreRegister {{{
" https://github.com/sheerun/vimrc/blob/master/plugin/vimrc.vim#L295
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
" }}}
" }}}
let g:test#strategy = 'dispatch'
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1
" ctrlp glyphs
let g:webdevicons_enable_ctrlp = 1
