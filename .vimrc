"----------------------------------------
" init
"----------------------------------------
" init {{{
" encoding
set encoding=utf8
scriptencoding utf-8

" set MYVIMDIR
let s:MSWindows = has('win32')
if s:MSWindows
  let $MYVIMDIR = expand('$HOME/vimfiles')
else
  let $MYVIMDIR = expand('$HOME/.vim')
endif

" Enable Tmux in TrueColor
if !has('gui_running') && exists('&termguicolors')
  " https://medium.com/@dubistkomisch/how-to-actually-get-italics-and-true-colour-to-work-in-iterm-tmux-vim-9ebe55ebc2be
  set termguicolors
  if !has('nvim')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif
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

"----------------------------------------
" Option Settings
"----------------------------------------
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
set completeopt+=noinsert,menuone,noselect,popup
set completeopt-=preview
if has('nvim-0.3.2') || has('patch-8.1.0360')
  set diffopt+=internal,algorithm:histogram,indent-heuristic
endif
set display=lastline
set expandtab
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
if exists('+breakindent')
  set breakindent
  set breakindentopt=sbr
  set showbreak=<
endif
" }}}
" Keybind {{{
let g:mapleader = ','
let g:maplocalleader = ','

" escape
inoremap jj <ESC>

" replace ; to :
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Switch
nnoremap <silent> <leader>s :Switch<CR>

" sandwich
nmap s <Nop>
xmap s <Nop>

" moving nextline
nnoremap <expr> j v:count == 0 ? 'gj' : 'j'
nnoremap <expr> k v:count == 0 ? 'gk' : 'k'

" redraw and nohl
nnoremap <silent> <C-l> :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr>:redraw!<cr>

" sudo write
cnoremap w!! w !sudo tee > /dev/null %<CR> :e!<CR>

" yanky
nnoremap Y y$
vnoremap y y`>

" Centering search word
nnoremap n nzz
nnoremap N Nzz

" disable space keymap
nnoremap <Space> <Nop>
" }}}

"----------------------------------------
" Plugin list
"----------------------------------------
call plug#begin($MYVIMDIR.'/plugins')
" exTools
Plug 'bronson/vim-trailing-whitespace',     {'on': 'FixWhitespace'}
Plug 'glidenote/memolist.vim',              {'on': ['MemoNew', 'MemoList' ,'MemoGrep']}
Plug 'mhinz/vim-grepper',                   {'on': ['Grepper', '<plug>(GrepperOperator)']}
Plug 'justinmk/vim-dirvish'
Plug 'sgur/vim-editorconfig'
Plug 'tpope/vim-dadbod'
Plug 'wakatime/vim-wakatime'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'kana/vim-textobj-user'
Plug 'mattn/vim-textobj-url'
Plug 'deris/vim-textobj-ipmac'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'
Plug 'haya14busa/vim-operator-flashy'
Plug 'andymass/vim-matchup'
Plug 'thinca/vim-qfreplace'
Plug 'markonm/traces.vim'
Plug 'freitass/todo.txt-vim'
" Input Assist
Plug 'AndrewRadev/switch.vim'
Plug 'sbdchd/neoformat'
if has('python3')
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
endif
Plug 'cohama/lexima.vim'
Plug 'mattn/sonictemplate-vim'
Plug 'machakann/vim-sandwich'
Plug 'tyru/caw.vim'
Plug 'tyru/eskk.vim'
" autocomplete
Plug 'ajh17/VimCompletesMe'
Plug 'natebosch/vim-lsc'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
" Visual
Plug 'itchyny/lightline.vim'
Plug 'rhysd/try-colorscheme.vim'
Plug 'morhetz/gruvbox'
Plug 'gkapfham/vim-vitamin-onec'
Plug 'cocopon/iceberg.vim'
Plug 'sainnhe/gruvbox-material'
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
Plug 'jreybert/vimagit'
Plug 'rhysd/git-messenger.vim'
Plug 'rhysd/conflict-marker.vim'
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
Plug 'skywind3000/asyncrun.vim'
" Python
Plug 'Vimjas/vim-python-pep8-indent',       {'for': 'python'}
" Markdown
Plug 'previm/previm',                       {'for': 'markdown'}
" go
Plug 'mattn/vim-goimports',                 {'for': 'go'}
" UML
Plug 'scrooloose/vim-slumlord',             {'for': 'plantuml'}
" Hashicorp
Plug 'hashivim/vim-terraform',              {'for': 'terraform'}
" zsh
Plug 'zinit-zsh/zinit-vim-syntax',          {'for': 'zsh'}
" syntax
Plug 'sheerun/vim-polyglot'
call plug#end()

"----------------------------------------
" color settings
"----------------------------------------
" color {{{
set t_Co=256
syntax on
set background=dark
let g:gruvbox_material_background = 'soft'
let g:gruvbox_material_disable_italic_comment = 1
let g:gruvbox_material_enable_italic = 0
colorscheme gruvbox-material
"}}}

"----------------------------------------
" Plugin Settings
"----------------------------------------
" VimCompletesMe {{{
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
let g:vcm_s_tab_behavior = 1
autocmd FileType terraform let b:vcm_tab_complete = "omni"
autocmd FileType go let b:vcm_tab_complete = "omni"
autocmd FileType python let b:vcm_tab_complete = "omni"
autocmd FileType rust let b:vcm_tab_complete = "omni"
autocmd FileType sh let b:vcm_tab_complete = "omni"
autocmd FileType yaml let b:vcm_tab_complete = "omni"
autocmd FileType yaml.concourse let b:vcm_tab_complete = "omni"
autocmd FileType yaml.manifest let b:vcm_tab_complete = "omni"
" }}}
" LSC {{{
let g:lsc_auto_map = {
    \  'FindCodeActions': 'gA',
    \  'GoToDefinition': 'gd',
    \  'GoToDefinitionSplit': 'gs',
    \  'FindReferences': 'gr',
    \  'Rename': 'gR',
    \  'ShowHover': 'K',
    \  'Completion': 'omnifunc',
    \}
let g:lsc_enable_autocomplete = v:false
let g:lsc_auto_completeopt = v:false
let g:lsc_complete_timeout = 1
let g:lsc_reference_highlights = v:false
let g:lsc_enable_diagnostics = v:true
let g:lsc_enable_snippet_support = v:false
let g:lsc_trace_level = 'off'

let g:lsc_server_commands = {}
if executable('pyls')
  let g:lsc_server_commands['python'] = {
      \ 'command': 'pyls',
      \ 'workspace_config' : {
      \   'pyls': {'plugins': {
      \      'jedi_definition': {'follow_imports': v:true, 'follow_builtin_imports': v:true},
      \      'pycodestyle': {'maxLineLength': 160, 'ignore': 'W292'},
      \   }},
      \ },
      \ }
endif
if executable('gopls')
  let g:lsc_server_commands['go'] = {
      \ 'command': 'gopls serve',
      \ 'initialization_options': {
      \   'usePlaceholders': v:true,
      \   'hoverKind': 'FullDocumentation',
      \   'completeUnimported': v:true,
      \ },
      \ 'log_level': -1,
      \ 'suppress_stderr': v:true
      \ }
endif
if executable('terraform-lsp')
  let g:lsc_server_commands['terraform'] = {'command': 'terraform-lsp', 'suppress_stderr': v:true}
endif
if executable('rls')
  let g:lsc_server_commands['rust'] = {'command': 'rls', 'suppress_stderr': v:true}
endif
if executable('bash-language-server')
  let g:lsc_server_commands['sh'] = {'command': 'bash-language-server start', 'suppress_stderr': v:true}
endif
if executable('concourse-language-server')
  autocmd BufRead,BufNewFile *pipeline*.yml set filetype=yaml.concourse
  let g:lsc_server_commands['yaml.concourse'] = {'command': 'concourse-language-server', 'suppress_stderr': v:true}
endif
if executable('manifest-yaml-language-server')
  autocmd BufRead,BufNewFile *manifest*.yml set filetype=yaml.manifest
  let g:lsc_server_commands['yaml.manifest'] = {'command': 'manifest-yaml-language-server', 'suppress_stderr': v:true}
endif
" }}}
" vsnip {{{
" let g:vsnip_integ_config.vim_lsc = v:true
" }}}
" ultisnips {{{
" Trigger configuration.
let g:UltiSnipsExpandTrigger = '<c-k>'
let g:UltiSnipsJumpForwardTrigger = '<c-k>'
let g:UltiSnipsJumpBackwardTrigger = '<c-h>'

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit='vertical'
" Python Comment Style
let g:ultisnips_python_style = 'sphinx'
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
    \       'outputter/buffer/into' : 0,
    \       'outputter/quickfix/into' : 0,
    \   },
    \}

if has('win32')
  let g:quickrun_config['python'] = {
      \     'hook/output_encode/enable' : 1,
      \     'hook/output_encode/encoding' : 'cp932',
      \}
endif
autocmd BufRead,BufNewFile *_test.go set filetype=go.test
let g:quickrun_config['go.test'] = {'command' : 'go', 'exec' : ['%c test']}
let g:quickrun_config['go'] = {'command': 'go', 'exec': ['%C run *.go']}

let g:quickrun_no_default_key_mappings = 1
" Running with close quickfix and save file
nnoremap <silent><Leader>r :cclose<CR>:write<CR>:QuickRun<CR>
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : ""
autocmd vimrc FileType qf nnoremap <silent><buffer>q :cclose<CR>
command! -nargs=+ -complete=command Capture QuickRun -type vim -src <q-args>
" }}}
" lightline.vim{{{
let g:lightline = {
      \ 'colorscheme': 'gruvbox_material',
      \ 'active': {
      \   'left': [['mode', 'paste'],
      \            ['gitbranch', 'absolutepath']],
      \   'right': [['lineinfo'],
      \             ['fileformat', 'fileencoding', 'filetype']]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'Branch'
      \ },
      \}

function! Branch()
  try
    if &filetype !~? 'vimfiler\|gundo' && exists('*gitbranch#name') && strlen(gitbranch#name())
      return gitbranch#name()
    endif
  endtry
  return ''
endfunction

" }}}
" ESKK {{{
let g:eskk#enable_completion = 0
let g:eskk#directory = expand($MYVIMDIR.'/eskk')
if filereadable('/usr/share/skk/SKK-JISYO.L')
  let s:skk_dic = '/usr/share/skk/SKK-JISYO.L'
else
  let s:skk_dic = expand($MYVIMDIR.'/eskk/SKK-JISYO.L')
  if !filereadable(s:skk_dic)
    echo s:skk_dic
    execute 'silent !curl -fLo '.s:skk_dic.' --create-dirs "http://openlab.jp/skk/skk/dic/SKK-JISYO.L"'
  endif
endif
let g:eskk#large_dictionary = {
      \ 'path': s:skk_dic,
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
" highlight error
augroup hierr
  autocmd!
  autocmd vimrc FileType go :highlight goErr cterm=bold ctermfg=214
  autocmd vimrc FileType go :match goErr /\<err\>/
augroup END
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
let g:memolist_path = '~/memo'
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
nnoremap <silent> [CtrlP]h :<C-u>CtrlPHelp<CR>
nnoremap <silent> [CtrlP]s :<C-u>CtrlPSmartTabs<CR>
nnoremap <silent> [CtrlP]y :<C-u>CtrlPYankRound<CR>
nnoremap <silent> [CtrlP]c :<C-u>call ctrlp#init(ctrlp#commandline#id())<CR>
nnoremap <silent> [CtrlP]e :<C-u>e $MYVIMRC<CR>

if executable('ag')
  let g:ctrlp_use_caching=0
  let g:ctrlp_user_command='ag %s -i --nocolor --nogroup -g ""'
endif

let g:fruzzy#usenative = 1
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
let g:grepper.open          = 1
let g:grepper.switch        = 1
let g:grepper.repo          = ['.git', '.hg', '.svn']
let g:grepper.quickfix      = 1
let g:grepper.highlight     = 1
" }}}
" Terrafrom {{{
let g:terraform_align = 1
let g:terraform_fmt_on_save = 1
let g:terraform_remap_spacebar = 0
let g:terraform_completion_keys = 0
autocmd FileType terraform setlocal commentstring=#%s
" }}}
" neoformat {{{
let g:neoformat_try_formatprg = 1
" Enable alignment
let g:neoformat_basic_format_align = 1
" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1
" Have Neoformat only msg when there is an error
let g:neoformat_only_msg_on_error = 1
let g:neoformat_enabled_python = ['black']
" augroup fmt
"   autocmd!
"   autocmd BufWritePre * undojoin | Neoformat
" augroup END
" }}}
" vim-test {{{
let test#strategy = "asyncrun"
let g:asyncrun_open = 8
" }}}
" operator {{{
map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$
" }}}
" user command {{{
" Auto plugin install {{{
augroup pluginstall
  autocmd!
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
" Window Size {{{
let g:toggle_window_size = 0
function! ToggleWindowSize()
  if g:toggle_window_size == 1
    exec "normal \<C-w>="
    let g:toggle_window_size = 0
  else
    :resize
    :vertical resize
    let g:toggle_window_size = 1
  endif
endfunction
nnoremap M :call ToggleWindowSize()<CR>
" }}}
" }}}
if has('win32')
  let g:python3_host_prog = 'C:/devtools/Python/Python36/python.exe'
elseif has('unix')
  let g:python_host_prog = '/usr/bin/python'
  let g:python3_host_prog = '/usr/bin/python3'
endif
