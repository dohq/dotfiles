" init {{{
" encoding
set encoding=utf8
scriptencoding utf-8
if !has('nvim')
  unlet! g:skip_defaults_vim
  source $VIMRUNTIME/defaults.vim
endif

" set MYVIMDIR
let s:MSWindows = has('win32')
if s:MSWindows
  let $MYVIMDIR = expand('$HOME/vimfiles')
else
  let $MYVIMDIR = expand('$HOME/.vim')
endif

" Enable Tmux in TrueColor
      "\ && $COLORTERM =~# '^\%(truecolor\|24bit\)$'
if !has('gui_running')
      \ && exists('&termguicolors')
  " https://medium.com/@dubistkomisch/how-to-actually-get-italics-and-true-colour-to-work-in-iterm-tmux-vim-9ebe55ebc2be
  if !has('nvim')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif
  set termguicolors       " use truecolor in term
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
Plug 'bronson/vim-trailing-whitespace',     {'on': 'FixWhitespace'}
Plug 'glidenote/memolist.vim',              {'on': ['MemoNew', 'MemoList' ,'MemoGrep']}
Plug 'justinmk/vim-dirvish'
Plug 'mhinz/vim-grepper',                   {'on': ['Grepper', '<plug>(GrepperOperator)']}
Plug 'sgur/vim-editorconfig'
Plug 'tpope/vim-dadbod'
Plug 'wakatime/vim-wakatime'
Plug 'y0za/vim-reading-vimrc'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'kana/vim-textobj-user'
Plug 'mattn/vim-textobj-url'
if !has('nvim')
  Plug 'mattn/vim-pixela'
endif
Plug 'andymass/vim-matchup'
" Input Assist
Plug 'AndrewRadev/switch.vim'
Plug 'sbdchd/neoformat'
Plug 'SirVer/ultisnips'
Plug 'cohama/lexima.vim'
Plug 'honza/vim-snippets'
Plug 'mattn/sonictemplate-vim'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-speeddating'
Plug 'tyru/caw.vim'
Plug 'tyru/eskk.vim'
Plug 'kana/vim-operator-user'
Plug 'haya14busa/vim-operator-flashy'
Plug 'liuchengxu/vista.vim'
" autocomplete
Plug 'lifepillar/vim-mucomplete'
Plug 'natebosch/vim-lsc'
" Visual
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/seoul256.vim'
Plug 'rhysd/try-colorscheme.vim'
Plug 'shinchu/lightline-seoul256.vim'
Plug 'morhetz/gruvbox'
Plug 'gkapfham/vim-vitamin-onec'
" QuickRun
Plug 'thinca/vim-quickrun'
Plug 'osyo-manga/shabadou.vim'
" Twitter
Plug 'basyura/TweetVim'
Plug 'basyura/twibill.vim'
Plug 'mattn/webapi-vim'
Plug 'tyru/open-browser.vim'
" Git
Plug 'itchyny/vim-gitbranch'
Plug 'lambdalisue/vim-gista'
Plug 'mhinz/vim-signify'
Plug 'lambdalisue/gina.vim'
Plug 'rhysd/git-messenger.vim'
" CtrlP
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/ctrlp-ghq'
Plug 'mattn/ctrlp-register'
Plug 'raghur/fruzzy',                       {'do': { -> fruzzy#install() }}
Plug 'suy/vim-ctrlp-commandline'
Plug 'tacahiroy/ctrlp-funky'
Plug 'zeero/vim-ctrlp-help'
" Test
Plug 'janko/vim-test'
Plug 'tpope/vim-dispatch'
Plug 'skywind3000/asyncrun.vim'
" Python
Plug 'Vimjas/vim-python-pep8-indent',       {'for': 'python'}
" Markdown
Plug 'previm/previm',                       {'for': 'markdown'}
Plug 'rcmdnk/vim-markdown',                 {'for': 'markdown'}
Plug 'rcmdnk/vim-markdown-quote-syntax',    {'for': 'markdown'}
" go
Plug 'arp242/gopher.vim',                   {'for': 'go'}
Plug 'buoto/gotests-vim',                   {'for': 'go'}
" UML
Plug 'scrooloose/vim-slumlord',             {'for': 'plantuml'}
Plug 'aklt/plantuml-syntax',                {'for': 'plantuml'}
" TOML
Plug 'cespare/vim-toml',                    {'for': 'toml'}
" Hashicorp
Plug 'hashivim/vim-terraform',              {'for': 'terraform'}
" yaml
Plug 'stephpy/vim-yaml',                    {'for': 'yaml'}
" Dockerfile
Plug 'ekalinin/Dockerfile.vim',             {'for': 'dockerfile'}


call plug#end()


"----------------------------------------
" Option Settings
"----------------------------------------
" color {{{
set t_Co=256
syntax on
colorscheme vitaminonec
set background=dark
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
" set ambiwidth=double
set autoread
set autowrite
set belloff=all
set cmdheight=2
set completeopt+=noinsert,menuone,noselect,popup
set completeopt-=preview
set diffopt=internal,filler,algorithm:histogram,indent-heuristic
set display=lastline
set expandtab
set fileformat=unix
set fileformat=unix
set foldmethod=marker
set hidden
set hlsearch
set ignorecase
set imdisable
set incsearch
set laststatus=2
set lazyredraw
set list
set listchars=tab:▸.,trail:-,eol:\ ,extends:»,precedes:«,nbsp:%
set noautoindent
set nobackup
set nojs
set noequalalways
set noshowmode
set nosmartindent
set nostartofline
set noswapfile
set novisualbell
set nrformats-=octal
set pumheight=10
set scrolloff=7
set shiftround
set shiftwidth=2
set shortmess+=atIc
set shortmess-=SF
set showtabline=0
set signcolumn=yes
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
set wildmenu
set wildmode=full
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
if !has('nvim') && has('terminal')
  set termwinsize=10x0
endif
if exists('+breakindent')
  set breakindent
  set breakindentopt=sbr
  set showbreak=<
endif
" let g:vim_json_syntax_conceal = 0
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


" sandwich
nmap s <Nop>
xmap s <Nop>

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

" map paste, yank and delete to named register so the content
" will not be overwritten (I know I should just remember...)
nnoremap x "_x
vnoremap x "_x
" }}}

"----------------------------------------
" Plugin Settings
"----------------------------------------
" mucomplete {{{
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#completion_delay= 2
let g:mucomplete#reopen_immediately = 0
let g:mucomplete#no_mappings = 1
imap <c-n> <plug>(MUcompleteFwd)
imap <c-p> <plug>(MUcompleteBwd)
" }}}
" LSC {{{
let g:lsc_enable_autocomplete = v:false
let g:lsc_auto_map = v:true
let g:lsc_complete_timeout = 0.5
let g:lsc_reference_highlights = v:false
let g:lsc_enable_diagnostics = v:true
let g:lsc_preview_popup_hover = v:true
let g:lsc_server_commands = {}
if executable('bash-language-server')
  let g:lsc_server_commands['sh'] = {'command': 'bash-language-server start'}
  autocmd vimrc FileType sh setlocal omnifunc=lsc#complete#complete
endif
if executable('pyls')
  let g:lsc_server_commands['python'] = {'command': 'pyls'}
  autocmd vimrc FileType python setlocal omnifunc=lsc#complete#complete
endif
if executable('gopls')
  let g:lsc_server_commands['go'] = {'command': 'gopls', 'log_level': -1, 'suppress_stderr': v:true}
  autocmd vimrc FileType go setlocal omnifunc=lsc#complete#complete
endif
if executable('terraform-lsp')
  let g:lsc_server_commands['terraform'] = {'command': 'terraform-lsp', 'suppress_stderr': v:true}
  autocmd vimrc FileType terraform setlocal omnifunc=lsc#complete#complete
endif
if executable('docker-langserver')
  let g:lsc_server_commands['dockerfile'] = {'command': 'docker-langserver --stdio', 'suppress_stderr': v:true}
  autocmd vimrc FileType dockerfile setlocal omnifunc=lsc#complete#complete
endif
if executable('rls')
  let g:lsc_server_commands['rust'] = {'command': 'rls', 'suppress_stderr': v:true}
  autocmd vimrc FileType rust setlocal omnifunc=lsc#complete#complete
endif
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
" lightline.vim{{{
let g:lightline = {
      \ 'colorscheme': 'vitaminonec',
      \ 'active': {
      \   'left': [['mode', 'paste'],
      \            ['gitbranch', 'filename']],
      \   'right': [['lineinfo'],
      \             ['method', 'fileformat', 'fileencoding', 'filetype']]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'Branch',
      \   'method': 'NearestMethodOrFunction',
      \ },
      \}

function! FileName()
  let s:name = expand('%:t')
  let s:name = s:name !=# '' ? s:name : '[No Name]'
  let s:readonly = &readonly ? ' Ro' : ''
  let s:modified = &modified ? ' Nm' : ''
  return s:readonly . s:name . s:modified
endfunction

function! Branch()
  try
    if &filetype !~? 'vimfiler\|gundo' && exists('*gitbranch#name') && strlen(gitbranch#name())
      return gitbranch#name()
    endif
  endtry
  return ''
endfunction

function! NearestMethodOrFunction() abort
  let l:func_name = get(b:, 'vista_nearest_method_or_function', '')
  if l:func_name != ''
    return l:func_name
  endif
  return ''
endfunction
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

" function! s:eskk_initial_pre()
"   let t = eskk#table#new('rom_to_hira*', 'rom_to_hira')
"   for n in range(10)
"     call t.add_map(n . '.', n . '.')
"   endfor
"   call eskk#register_mode_table('hira', t)
" endfunction
"
" augroup eskk
"   autocmd!
"   autocmd vimrc User eskk-initialize-pre call s:eskk_initial_pre()
" augroup end

"allow InsertMode toggle ESKK
augroup eskk
  autocmd!
  autocmd eskk VimEnter * imap <C-j> <Plug>(eskk:toggle)
  autocmd eskk VimEnter * cmap <C-j> <Plug>(eskk:toggle)
augroup END
"}}}
" Git {{{
nnoremap          [Git]   <Nop>
nmap     <Space>v [Git]
nnoremap <silent> [Git]g :<C-u>SignifyToggle<CR>
nnoremap <silent> [Git]r :<C-u>SignifyRefresh<CR>
" git command
nnoremap <silent> [Git]a :<C-u>Gina add -- %<CR>
nnoremap <silent> [Git]m :<C-u>Gina commit -v<CR>
nnoremap <silent> [Git]s :<C-u>Gina status<CR>
nnoremap <silent> [Git]d :<C-u>Gina diff :%<CR>
" }}}
" go {{{
let g:gopher_map = 0
" highlight error
augroup hierr
  autocmd!
  autocmd vimrc FileType go :highlight goErr cterm=bold ctermfg=214
  autocmd vimrc FileType go :match goErr /\<err\>/
  autocmd vimrc FileType go set omnifunc=lsc#complete#complete
augroup END
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
autocmd vimrc FileType tweetvim call s:tweetvim_my_settings()
function! s:tweetvim_my_settings()
  set nowrap
  set signcolumn=no
endfunction

let g:tweetvim_open_buffer_cmd = 'split'
let g:tweetvim_display_username =1

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
" CtrlP {{{
nnoremap          [CtrlP]   <Nop>
nmap     <Space>  [CtrlP]
nnoremap <silent> [CtrlP]<Space> :<C-u>CtrlP<CR>
nnoremap <silent> [CtrlP]g :<C-u>CtrlPGhq<CR>
nnoremap <silent> [CtrlP]b :<C-u>CtrlPBuffer<CR>
nnoremap <silent> [CtrlP]f :<C-u>CtrlPFunky<CR>
nnoremap <silent> [CtrlP]u :<C-u>CtrlPMRU<CR>
nnoremap <silent> [CtrlP]r :<C-u>CtrlPRegister<CR>
nnoremap <silent> [CtrlP]t :<C-u>Vista!!<CR>
nnoremap <silent> [CtrlP]h :<C-u>CtrlPHelp<CR>
nnoremap <silent> [CtrlP]s :<C-u>CtrlPSmartTabs<CR>
nnoremap <silent> [CtrlP]y :<C-u>CtrlPYankRound<CR>
nnoremap <silent> [CtrlP]c :<C-u>call ctrlp#init(ctrlp#commandline#id())<CR>
nnoremap <silent> [CtrlP]e :<C-u>e $MYVIMRC<CR>

if executable('ag')
  let g:ctrlp_use_caching=0
  let g:ctrlp_user_command='ag %s -i --nocolor --nogroup -g ""'
endif

let g:ctrlp_match_func = {'match': 'fruzzy#ctrlp#matcher'}
let g:ctrlp_match_current_file = 1 " to include current file in matches

let g:ctrlp_lazy_update = 1
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
let g:ultisnips_python_style = 'sphinx'
let g:formatter_yapf_style = 'google'

" ale
let g:ale_python_flake8_options = '--ignore=E129,E501,E302,E265,E241,E305,E402,W503'
let g:ale_python_pylint_options = '-j 0 --max-line-length=120'
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
let g:grepper.quickfix      = 0
let g:grepper.highlight     = 1
" }}}
" vim-pixela {{{
let g:pixela_debug = 0
let g:pixela_username = 'dohq'
let g:pixela_token = system('echo -n $(echo $VIM_PIXELA_TOKEN)')
" }}}
" Terrafrom {{{
let g:terraform_align = 1
let g:terraform_fmt_on_save = 1
let g:terraform_remap_spacebar = 0
let g:terraform_completion_keys = 0
autocmd FileType terraform setlocal commentstring=#%s
" }}}
" operator-user {{{
map y <Plug>(operator-flashy)
nmap Y 0<Plug>(operator-flashy)$
" }}}
" neoformat {{{
" Enable alignment
let g:neoformat_basic_format_align = 1
" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1
" Have Neoformat only msg when there is an error
let g:neoformat_only_msg_on_error = 1
" augroup fmt
"   autocmd!
"   autocmd BufWritePre * undojoin | Neoformat
" augroup END
" }}}
" vista.vim {{{
let g:vista_sidebar_width = 40
let g:vista_echo_cursor = 0
let g:vista_default_executive = 'ctags'

" relaod NearestMethodOrFunction
augroup LightLineOnVista
  autocmd!
  autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
augroup END
" }}}
" user command {{{
" Auto plugin install {{{
augroup pluginstall
  autocmd VimEnter *
        \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
        \|   PlugInstall --sync | q
        \| endif
augroup end
" }}}
" auto-cursorline {{{
augroup vimrc-auto-cursorline
  autocmd!
  autocmd CursorMoved,CursorMovedI * call s:auto_cursorline('CursorMoved')
  autocmd CursorHold,CursorHoldI * call s:auto_cursorline('CursorHold')
  autocmd WinEnter * call s:auto_cursorline('WinEnter')
  autocmd WinLeave * call s:auto_cursorline('WinLeave')

  set cursorline
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
" Json-jq {{{
command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
  if 0 == a:0
    let l:arg = '.'
  else
    let l:arg = a:1
  endif
  execute "%! jq \"" . l:arg . "\""
endfunction
" }}}
" }}}
if has('win32')
  let g:python3_host_prog = 'C:/devtools/Python/Python36/python.exe'
elseif has('unix')
  let g:python_host_prog = '/usr/bin/python'
  let g:python3_host_prog = '/usr/bin/python3'
endif
let test#strategy = "asyncrun"

let g:asyncrun_open = 8
