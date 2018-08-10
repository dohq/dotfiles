" init {{{
" encoding
set encoding=utf8
scriptencoding utf-8
if !has('nvim')
  unlet! g:skip_defaults_vim
  source $VIMRUNTIME/defaults.vim
endif

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

call plug#begin($MYVIMDIR.'/plugins')
" exTools
Plug 'glidenote/memolist.vim',              {'on': ['MemoNew', 'MemoList' ,'MemoGrep']}
Plug 'itchyny/vim-parenmatch'
Plug 'justinmk/vim-dirvish'
Plug 'mhinz/vim-grepper',                   {'on': ['Grepper', '<plug>(GrepperOperator)']}
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-endwise'
Plug 'osyo-manga/vim-anzu'
Plug 'vim-jp/vimdoc-ja'
Plug 'bronson/vim-trailing-whitespace',     {'on': 'FixWhitespace'}
Plug 'wakatime/vim-wakatime'
Plug 'kana/vim-slacky'
Plug 'tpope/vim-dadbod'
Plug 'mbbill/undotree'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-user'
Plug 'easymotion/vim-easymotion'
Plug 'y0za/vim-reading-vimrc'
Plug 'jsfaint/gen_tags.vim'
Plug 'tpope/vim-repeat'
" Input Assist
Plug 'AndrewRadev/switch.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'SirVer/ultisnips'
Plug 'cohama/lexima.vim'
Plug 'honza/vim-snippets'
Plug 'junegunn/vim-easy-align'
" Plug 'maralla/completor.vim'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'ncm2/ncm2-ultisnips'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-vim'
Plug 'Shougo/neco-vim'
Plug 'ncm2/ncm2-go'
Plug 'ncm2/ncm2-markdown-subscope'
Plug 'ncm2/ncm2-rst-subscope'

Plug 'mattn/sonictemplate-vim'
Plug 'tyru/eskk.vim'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tyru/caw.vim'
Plug 'LeafCage/yankround.vim'
" Visual
Plug 'Yggdroot/indentLine'
Plug 'cocopon/iceberg.vim'
Plug 'itchyny/lightline.vim'
Plug 'rhysd/try-colorscheme.vim'
" QuickRun
Plug 'osyo-manga/shabadou.vim'
Plug 'thinca/vim-quickrun'
" Test
Plug 'janko-m/vim-test'
Plug 'tpope/vim-dispatch'
" Twitter
Plug 'basyura/TweetVim'
Plug 'basyura/twibill.vim'
Plug 'mattn/webapi-vim'
Plug 'tyru/open-browser.vim'
" Syntax Check
Plug 'w0rp/ale'
Plug 'maximbaz/lightline-ale'
" Git
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/vim-gitbranch'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
" CtrlP
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/ctrlp-filer'
Plug 'mattn/ctrlp-ghq'
Plug 'mattn/ctrlp-register'
Plug 'suy/vim-ctrlp-commandline'
Plug 'tacahiroy/ctrlp-funky'
Plug 'zeero/vim-ctrlp-help'
" Python
Plug 'davidhalter/jedi-vim',                {'for': 'python'}
Plug 'fisadev/vim-isort',                   {'for': 'python'}
Plug 'jmcantrell/vim-virtualenv',           {'for': 'python'}
Plug 'tlvince/vim-compiler-python',         {'for': 'python'}
Plug 'vim-python/python-syntax',            {'for': 'python'}
" Markdown
Plug 'previm/previm',                       {'for': 'markdown'}
Plug 'rcmdnk/vim-markdown',                 {'for': 'markdown'}
Plug 'rcmdnk/vim-markdown-quote-syntax',    {'for': 'markdown'}
" go
Plug 'fatih/vim-go',                        {'for': 'go', 'do': ':GoInstallBinaries'}
" yaml
Plug 'stephpy/vim-yaml',                    {'for': 'yml'}
" html
Plug 'othree/html5.vim',                    {'for': 'html'}
" php
Plug 'alvan/vim-php-manual',                {'for': ['php', 'ctp']}
" terraform
Plug 'hashivim/vim-terraform',              {'for': 'terraform'}

if has('win32')
  let lcn_command = 'powershell -NoProfile -ExecutionPolicy Unrestricted .\install.ps1'
else
  let lcn_command = 'bash install.sh'
endif
Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': lcn_command,
      \ }

call plug#end()


"----------------------------------------
" Option Settings
"----------------------------------------
" color {{{
set t_Co=256
colorscheme iceberg
if !has('win32')
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
  highlight LineNr ctermbg=none
  highlight Folded ctermbg=none
  highlight EndOfBuffer ctermbg=none
endif
let g:gruvbox_italic = 0
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
" set completeopt-=preview
set completeopt=noinsert,menuone,noselect
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
set wildignore=*.o,*.obj,*.pyc,*.so,*.dll,*.exe,*.xlsx
set wildignore+=*.out,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildmenu
set wildmode=full
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
if !has('nvim') && has('terminal')
  set termwinsize=15x0
endif
if exists('+breakindent')
  set breakindent
  set breakindentopt=sbr
  set showbreak=<
endif
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1
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

" Switch
nnoremap <silent> <leader>s :Switch<CR>

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

" sudo write
cnoremap w!! w !sudo tee > /dev/null %<CR> :e!<CR>

" yanky
nnoremap Y y$

" Centering search word
nnoremap n nzz
nnoremap N Nzz
" }}}


"----------------------------------------
" Plugin Settings
"----------------------------------------
" completor {{{
autocmd BufEnter * call ncm2#enable_for_buffer()
" let g:completor_auto_trigger = 1
" let g:completor_refresh_always = 1
" let g:completor_set_options = 1
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
" }}}
" LanguageClient {{{
let g:LanguageClient_serverCommands = {
      \ 'python': ['pyls'],
      \ }
" }}}
" ultisnips {{{
" Trigger configuration.
let g:UltiSnipsExpandTrigger = '<c-k>'
let g:UltiSnipsJumpForwardTrigger = '<c-k>'
let g:UltiSnipsJumpBackwardTrigger = '<c-h>'

let g:ultisnips_python_style = 'sphinx'

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
      \       'outputter/error/error' : 'quickfix',
      \       'outputter/buffer/split' : ':botright 8',
      \       'outputter/buffer/close_on_empty' : 1,
      \       'outputter/buffer/into' : 1,
      \       'outputter/quickfix/into' : 1,
      \   },
      \}

if has('win32')
  let g:quickrun_config['python'] = {
        \     'hook/output_encode/enable' : 1,
        \     'hook/output_encode/encoding' : 'cp932',
        \}
endif

let g:quickrun_no_default_key_mappings = 1
" Running with close quickfix and save file
nnoremap <silent><Leader>r :cclose<CR>:write<CR>:QuickRun<CR>
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : ""
autocmd vimrc FileType qf nnoremap <silent><buffer>q :cclose<CR>
command! -nargs=+ -complete=command Capture QuickRun -type vim -src <q-args>
" }}}
" ale {{{
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
let g:ale_sign_column_always = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" lightline-ale
let g:lightline#ale#indicator_warnings = 'W'
let g:lightline#ale#indicator_errors = 'E'
let g:lightline#ale#indicator_checking = '..'
let g:lightline#ale#indicator_ok = 'OK'

" keymap
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
      \   'right': [['lineinfo', 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok'],
      \             ['fileformat', 'fileencoding', 'filetype']]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'Branch',
      \ },
      \}

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }

function! FileName()
  let s:name = expand('%:t')
  let s:name = s:name !=# '' ? s:name : '[No Name]'
  if s:name =~? 'netrw'
    return 'netrw'
  endif
  let s:readonly = &readonly ? ' Ro' : ''
  let s:modified = &modified ? ' Nm' : ''
  return s:readonly . s:name . s:modified
endfunction

function! Branch()
  try
    if &filetype !~? 'vimfiler\|gundo' && exists('*gitbranch#name') && strlen(gitbranch#name())
      return gitbranch#name()
    endif
  catch
  endtry
  return ''
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
let g:EasyMotion_keys = ';HKLYUIOPNM,QWERTASDGZXCVBJF'
let g:EasyMotion_use_upper = 1
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
" }}}
" ESKK {{{
let g:eskk#enable_completion = 0
let g:eskk#directory = expand($MYVIMDIR.'/eskk')
let g:eskk#large_dictionary = {
      \ 'path': $MYVIMDIR.'/eskk/SKK-JISYO.L',
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
let g:gitgutter_sign_added = '++'
let g:gitgutter_sign_modified = '~~'
let g:gitgutter_sign_removed = '--'
nnoremap          [Git]   <Nop>
nmap     <Space>v [Git]
nnoremap <silent> [Git]g :<C-u>GitGutterToggle<CR>
nnoremap <silent> [Git]n :<C-u>GitGutterNextHunk<CR>
nnoremap <silent> [Git]p :<C-u>GitGutterPrevHunk<CR>
" git command
nnoremap <silent> [Git]a :<C-u>Gwrite<CR>
nnoremap <silent> [Git]m :<C-u>Gcommit -v<CR>
nnoremap <silent> [Git]s :<C-u>Gstatus<CR>
nnoremap <silent> [Git]d :<C-u>Gdiff<CR>
nnoremap <silent> [Git]l :<C-u>GV<CR>
" }}}
" vim-go {{{
" highlight error
augroup hierr
  autocmd!
  autocmd FileType go :highlight goErr cterm=bold ctermfg=214
  autocmd FileType go :match goErr /\<err\>/
augroup END

let g:go_auto_type_info = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_term_enabled = 1

" let g:go_metalinter_autosave = 1
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
" Twit {{{
" open-browser.vim
let g:netrw_nogx = 1
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
nnoremap <silent> [memo]l :<C-u>MemoList<CR>
nnoremap <silent> [memo]g :<C-u>MemoGrep<CR>

let g:memolist_ex_cmd = 'CtrlP'
let g:memolist_memo_suffix = 'md'
let g:memolist_path = '~/Dev/memo'
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
nnoremap <silent> [CtrlP]y :<C-u>CtrlPYankRound<CR>
nnoremap <silent> [CtrlP]d :<C-u>UndotreeToggle<CR>
nnoremap <silent> [CtrlP]c :<C-u>call ctrlp#init(ctrlp#commandline#id())<CR>
nnoremap <silent> [CtrlP]e :<C-u>e $MYVIMRC<CR>

" let g:ctrlp_use_caching = 0
" let g:ctrlp_user_command = 'files -i "^(\.git|\.hg|\.svn|_darcs|\.bzr|\.venv|\.mypy_cache|__pycache__|node_modules|vendor)$" -A -a %s'
if executable('ag')
  let g:ctrlp_use_caching=0
  let g:ctrlp_user_command='ag %s -i --nocolor --nogroup -g ""'
endif

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
let g:python_highlight_all = 1
let g:jedi#completions_enabled = 0
let g:jedi#goto_command = '<leader>g'
let g:jedi#documentation_command = '<s-k>'
let g:jedi#usages_command = '<leader>n'
let g:jedi#completions_command = ''
let g:jedi#rename_command = '<leader>R'
let g:jedi#show_call_signatures = 2
let g:formatter_yapf_style = 'google'
" }}}
" caw.vim {{{
nmap <leader>c      <Plug>(caw:hatpos:toggle)
vmap <leader>c      <Plug>(caw:hatpos:toggle)
" }}}
" Previm {{{
let g:previm_enable_realtime = 1
let g:previm_disable_vimproc = 1
let g:netrw_nogx = 1
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
" }}}
" FixWhitespace {{{
let g:extra_whitespace_ignored_filetypes = ['markdown', 'J6uil', 'vim-plug', 'tweetvim', 'help']
" }}}
" lexima {{{
inoremap <C-l> <C-r>=lexima#insmode#leave(1, '<LT>C-G>U<LT>RIGHT>')<CR>
" }}}
" Grepper {{{
let g:grepper               = {}
let g:grepper.tools         = ['rg', 'ag', 'pt', 'git']
let g:grepper.jump          = 0
let g:grepper.simple_prompt = 1
let g:grepper.quickfix      = 1
" }}}
" yankround {{{
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
let g:yankround_max_history = 50
" }}}
" vim-anzu {{{
nmap n <Plug>(anzu-mode-n)
nmap N <Plug>(anzu-mode-N)
nmap * <Plug>(anzu-star)
nmap # <Plug>(anzu-sharp)
" }}}
" emmet {{{
let g:user_emmet_mode='a'
" }}}
" vim-test {{{
let g:test#strategy = 'dispatch'
let g:test#preserve_screen = 1
" }}}
" user command {{{
" Auto plugin install {{{
autocmd VimEnter *
      \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \|   PlugInstall --sync | q
      \| endif
" }}}
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
" reading_vimrc {{{
autocmd vimrc FileType vim vmap <Space> <Plug>(reading_vimrc-update_clipboard)
"}}}
" }}}
