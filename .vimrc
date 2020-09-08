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
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
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
set helplang=ja,en
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
set nojoinspaces
set noequalalways
set noshowmode
set nosmartindent
set nostartofline
set noswapfile
set novisualbell
set nowrap
set maxmempattern=200000
set nrformats-=octal
set pumheight=10
set scrolloff=9999
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
set colorcolumn=100
set title
set ttyfast
set updatetime=50
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

nnoremap <c-h> :<c-u>bp <enter>
nnoremap <c-l> :<c-u>bn <enter>

nnoremap <leader>y "+

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
" manual filetype {{{
autocmd BufRead,BufNewFile *pipeline.yml set filetype=yaml.concourse
autocmd BufRead,BufNewFile *_test.go set filetype=go.test
" }}}

"----------------------------------------
" Plugin list
"----------------------------------------
call plug#begin($MYVIMDIR.'/plugins')
" exTools
Plug 'bronson/vim-trailing-whitespace',     {'on': 'FixWhitespace'}
Plug 'glidenote/memolist.vim',              {'on': ['MemoNew', 'MemoList' ,'MemoGrep']}
Plug 'mhinz/vim-grepper',                   {'on': ['Grepper', '<plug>(GrepperOperator)']}
Plug 'cocopon/vaffle.vim'
Plug 'sgur/vim-editorconfig'
Plug 'tpope/vim-dadbod'
Plug 'wakatime/vim-wakatime'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'andymass/vim-matchup'
Plug 'thinca/vim-qfreplace'
Plug 'markonm/traces.vim'
Plug 'freitass/todo.txt-vim'
Plug 'vim-jp/vimdoc-ja'
" textobj/operator
Plug 'kana/vim-textobj-user'
Plug 'mattn/vim-textobj-url'
Plug 'deris/vim-textobj-ipmac'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'
Plug 'haya14busa/vim-operator-flashy'
Plug 'kana/vim-slacky'
" Input Assist
Plug 'AndrewRadev/switch.vim'
Plug 'sbdchd/neoformat'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
" if has('python3')
"   Plug 'SirVer/ultisnips'
"   Plug 'honza/vim-snippets'
" endif
Plug 'cohama/lexima.vim'
Plug 'mattn/sonictemplate-vim'
Plug 'machakann/vim-sandwich'
Plug 'tyru/caw.vim'
Plug 'tyru/eskk.vim'
" autocomplete
Plug 'ajh17/VimCompletesMe'
Plug 'natebosch/vim-lsc'
" Visual
Plug 'itchyny/lightline.vim'
Plug 'rhysd/try-colorscheme.vim'
Plug 'morhetz/gruvbox'
Plug 'gkapfham/vim-vitamin-onec'
Plug 'cocopon/iceberg.vim'
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
" Markdown
Plug 'previm/previm',                       {'for': 'markdown'}
" go
Plug 'mattn/vim-goimports',                 {'for': 'go'}
Plug 'mattn/vim-godoc',                     {'for': 'go'}
Plug 'buoto/gotests-vim',                   {'for': 'go'}
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
syntax enable
let g:gruvbox_invert_selection='0'
set background=dark
colorscheme gruvbox
"}}}

"----------------------------------------
" Plugin Settings
"----------------------------------------
" VimCompletesMe {{{
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
let g:vcm_s_tab_behavior = 1
" }}}
" LSC {{{
let g:lsc_enable_autocomplete = v:true
let g:lsc_auto_completeopt = v:false
let g:lsc_enable_snippet_support = v:true
let g:lsp_ultisnips_integration = 0
let g:lsc_complete_timeout = 1
let g:lsc_reference_highlights = v:false
let g:lsc_enable_diagnostics = v:true
let g:lsc_trace_level = 'off'
let g:lsc_auto_map = {
      \ 'GoToDefinition': 'gd',
      \ 'GoToDefinitionSplit': 'gD',
      \ 'FindReferences': 'gR',
      \ 'NextReference': '<C-n>',
      \ 'PreviousReference': '<C-p>',
      \ 'FindImplementations': 'gI',
      \ 'FindCodeActions': 'ga',
      \ 'Rename': 'gr',
      \ 'ShowHover': v:true,
      \ 'DocumentSymbol': 'go',
      \ 'WorkspaceSymbol': 'gS',
      \ 'SignatureHelp': 'gm',
      \ 'Completion': 'omnifunc',
      \}

let g:lsc_server_commands = {}
if executable('pyls')
  let g:lsc_server_commands['python'] = {
        \ 'command': 'pyls',
        \ 'workspace_config': {
        \   'pyls': {
        \     'plugins': {
        \       'jedi_completion': {'enabled': v:true},
        \       'jedi_definition': {
        \         'follow_imports': v:true,
        \         'follow_builtin_imports': v:true
        \       },
        \       'jedi_hover': {'enabled': v:true},
        \       'jedi_references': {'enabled': v:true},
        \       'jedi_signature_help': {'enabled': v:true},
        \       'jedi_symbols': {
        \         'enabled': v:true,
        \         'all_scopes': v:true,
        \       },
        \       'mccabe': {
        \         'enabled': v:true,
        \         'threshold': 15,
        \       },
        \       'preload': {'enabled': v:true},
        \       'pylint': {'enabled': v:false},
        \       'pycodestyle': {
        \         'enabled': v:true,
        \         'maxLineLength': 160,
        \         'ignore': 'W292'
        \       },
        \       'pydocstyle': {'enabled': v:true},
        \       'flake8': {'enabled': v:true},
        \       'rope_completion': {'enabled': v:true},
        \       'yapf': {'enabled': v:true},
        \     }
        \   },
        \ },
        \}
endif
if executable('gopls')
  let g:lsc_server_commands['go'] = {
        \ 'command': 'gopls serve',
        \ 'initialization_options': {
        \   'usePlaceholders': v:true,
        \   'hoverKind': 'FullDocumentation',
        \   'completeUnimported': v:true,
        \   'matcher': 'fuzzy',
        \ },
        \ 'log_level': -1,
        \ 'suppress_stderr': v:true
        \}
endif
if executable('vim-language-server')
  let g:lsc_server_commands['vim'] = {
        \ 'command': 'vim-language-server --stdio',
        \ 'initialization_options': {
        \   "iskeyword": "",
        \   "vimruntime": $VIMRUNTIME,
        \   "runtimepath": &rtp,
        \   "diagnostic": {
        \     "enable": v:true
        \   },
        \   "indexes": {
        \     "runtimepath": v:true,
        \     "gap": 100,
        \     "count": 3,
        \   },
        \   "suggest": {
        \     "fromVimruntime": v:true,
        \     "fromRuntimepath": v:false
        \   }
        \ },
        \ 'log_level': -1,
        \ 'suppress_stderr': v:true
        \}
endif
if executable('solargraph')
  let g:lsc_server_commands['ruby'] = {
        \ 'command': 'solargraph.sh',
        \ 'initialization_options': {'diagnostic': v:true},
        \ 'log_level': -1,
        \ 'suppress_stderr': v:true
        \}
endif
if executable('terraform-lsp')
  let g:lsc_server_commands['terraform'] = {'command': 'terraform-lsp', 'suppress_stderr': v:true}
endif
" if executable('terraform-ls')
"   let g:lsc_server_commands['terraform'] = {'command': 'terraform-ls serve', 'suppress_stderr': v:true}
" endif
if executable('bash-language-server')
  let g:lsc_server_commands['sh'] = {'command': 'bash-language-server start', 'suppress_stderr': v:true}
endif
if executable('concourse-language-server')
  let g:lsc_server_commands['yaml.concourse'] = {'command': 'concourse-language-server', 'suppress_stderr': v:true}
endif
" }}}
" vsnip {{{
" Expand
imap <expr> <C-k>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-k>'
smap <expr> <C-k>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-k>'

" Jump forward or backward
imap <expr> <C-k>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-k>'
smap <expr> <C-k>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-k>'
imap <expr> <C-h> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-h>'
smap <expr> <C-h> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-h>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
smap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)
smap        S   <Plug>(vsnip-cut-text)
" }}}
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
let g:lightline = {}

let g:lightline.colorscheme = "gruvbox"

let g:lightline.active = {
      \   'left': [['mode', 'paste'],
      \            ['gitbranch', 'absolutepath']],
      \   'right': [['lineinfo'],
      \             [ 'error', 'warning', 'info', 'hint', 'fix' ],
      \             ['status'],
      \             ['fileformat', 'fileencoding', 'filetype']]
      \}

let g:lightline.component_function = {
      \   'gitbranch': 'Branch',
      \   'status'   : 'LightlineStatus',
      \}
let g:lightline.component_expand = {
      \ 'error'       : 'LightlineErrors',
      \ 'warning'     : 'LightlineWarnings',
      \ 'info'        : 'LightlineInfos',
      \ 'hint'        : 'LightlineHints',
      \ 'fix'         : 'LightlineFixes',
      \}
let g:lightline.component_type = {
      \ 'error'       : 'error',
      \ 'warning'     : 'warning',
      \ 'info'        : 'info',
      \ 'hint'        : 'middle',
      \ 'fix'         : 'middle',
      \}
" Diagnostic error messages count
function! LightlineErrors() abort
  let l:current_buf_number = bufnr('%')
  let l:qflist = getloclist(0)
  let l:current_buf_diagnostics = filter(qflist, {index, dict -> dict['bufnr'] == current_buf_number && dict['type'] == 'E'})
  let l:count = len(current_buf_diagnostics)
  return l:count > 0 ? 'E:' . l:count : ''
endfunction

" Diagnostic warning messages count
function! LightlineWarnings() abort
  let l:current_buf_number = bufnr('%')
  let l:qflist = getloclist(0)
  let l:current_buf_diagnostics = filter(qflist, {index, dict -> dict['bufnr'] == current_buf_number && dict['type'] == 'W'})
  let l:count = len(current_buf_diagnostics)
  return l:count > 0 ? 'W:' . l:count : ''
endfunction

" Diagnostic informational messages count
function! LightlineInfos() abort
  let l:current_buf_number = bufnr('%')
  let l:qflist = getloclist(0)
  let l:current_buf_diagnostics = filter(qflist, {index, dict -> dict['bufnr'] == current_buf_number && dict['type'] == 'I'})
  let l:count = len(current_buf_diagnostics)
  return l:count > 0 ? 'I:' . l:count : ''
endfunction

" Diagnostic hint's count
function! LightlineHints() abort
  let l:current_buf_number = bufnr('%')
  let l:qflist = getloclist(0)
  let l:current_buf_diagnostics = filter(qflist, {index, dict -> dict['bufnr'] == current_buf_number && dict['type'] == 'H'})
  let l:count = len(current_buf_diagnostics)
  return l:count > 0 ? 'H:' . l:count : ''
endfunction

" Language Server Status
function! LightlineStatus() abort
  return LSCServerStatus()
endfunction

augroup exec_lsc_actions
  autocmd!
  " Update lightline on LSC diagnostic update
  autocmd User LSCDiagnosticsChange call lightline#update()
augroup end

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
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1
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
" inoremap <C-l> <C-r>=lexima#insmode#leave(1, '<LT>C-G>U<LT>RIGHT>')<CR>
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
let test#strategy = "vimterminal"
" }}}
" operator {{{
map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$
map _ <Plug>(operator-replace)
" }}}
" vim-slackey {{{
let s:PATH_RULES = [
     \   ['\.log$', ':elasticsearch:'],
     \ ]
let s:FILETYPE_RULE_MAP = {
     \   'git': ':git:',
     \   'gitcommit': ':git:',
     \   'gitconfig': ':git:',
     \   'gitrebase': ':git:',
     \   'help': ':p-hatena:',
     \   'markdown': ':markdown:',
     \   'sql': ':mysql:',
     \   'vim': ':vim:',
     \   'yaml.concourse': ':concourse_circle:',
     \   'sh': ':shell:',
     \   'terraform': ':terraform:',
     \   'txt': ':file-txt:',
     \   'yaml.docker-compose': ':party_docker:',
     \ }
let s:FALLBACK_EMOJIS = [
     \   ':vim:',
     \   ':eagles:',
     \ ]

" Format: [$branch] $path ($line,$col)
" Note that:
" - Head part of $path might be truncated if there is not enough room.
" - Tail part of $branch might be truncated too.
function! Slacky_build_status_text()
  let branch = Branch()
  let pjname = substitute(getcwd(), '^.*/', '', '')
  let bufname = bufname('')
  if bufname == ''
    let bufname = '[No Name]'
  endif
  let path = fnamemodify(bufname, ':~:.')
  let s_pos = ' (' . line('.') . ',' . col('.') . ')'

  let limit = 100
  let estimated_branch_room = min([16, strchars(branch, 1)]) + 3
  let path_room = limit - strchars(s_pos, 1) - estimated_branch_room
  if strchars(path, 1) <= path_room
    let s_path = path
  else
    let s_path = '…' . path[-(path_room - 1):]
  endif

  let actual_branch_room = limit - 3 - strchars(s_path, 1) - strchars(s_pos, 1)
  if strchars(branch, 1) <= actual_branch_room
    let s_branch = branch
  else
    let s_branch = branch[:actual_branch_room - 1 - 1] . '…'
  endif

  return '{' . pjname . '}' . '[' . s_branch . '] ' . s_path . s_pos
endfunction

function! Slacky_build_status_emoji()
  let path = bufname('')

  for [pattern, emoji] in s:PATH_RULES
    if path =~? pattern
      return emoji
    endif
  endfor

  let emoji = get(s:FILETYPE_RULE_MAP, &l:filetype, 0)
  if emoji isnot 0
    return emoji
  endif

  let hash = s:hash_path(path)
  return s:FALLBACK_EMOJIS[hash % len(s:FALLBACK_EMOJIS)]
endfunction

function! s:hash_path(path)
  let n = len(a:path)
  let m = 4
  let hash = 0
  for i in range(m)
    let hash = xor(hash * 2, char2nr(a:path[n * i / m]))
  endfor
  return hash
endfunction
let g:slacky_build_status_emoji = 'Slacky_build_status_emoji'
let g:slacky_build_status_text = 'Slacky_build_status_text'
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
" vsnip {{{
" Expand
imap <expr> <C-k>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-k>'
smap <expr> <C-k>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-k>'

" Jump forward or backward
imap <expr> <C-k>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-k>'
smap <expr> <C-k>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-k>'
imap <expr> <C-h> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-h>'
smap <expr> <C-h> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-h>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
smap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)
smap        S   <Plug>(vsnip-cut-text)
" }}}
