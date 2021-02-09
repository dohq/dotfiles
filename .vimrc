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

if empty(glob('$MYVIMDIR/autoload/plug.vim'))
  silent !curl -fLo $MYVIMDIR/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
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
" set autowrite
set backspace=indent,eol,start
set belloff=all
set colorcolumn=100
set cmdheight=2
set completeopt+=noinsert,menuone,noselect,popup
set completeopt-=preview
if has('nvim-0.3.2') || has('patch-8.1.0360')
  set diffopt+=internal,filler,iblank,closeoff,algorithm:histogram,indent-heuristic
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
set listchars=tab:»-,eol:\ ,extends:»,precedes:«,nbsp:%,trail:-
set noautoindent
" set nobackup
set nofixeol
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
if !has('nvim')
  set termwinsize=15x0
endif
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
" File Backups
set backupcopy=yes
let s:swpdir = $MYVIMDIR .. '/swap'
if !isdirectory(s:swpdir)
  call mkdir(s:swpdir)
endif
set directory=s:swpdir
" Persistent Undo
let s:undodir = $MYVIMDIR .. '/undo'
if !isdirectory(s:undodir)
  call mkdir(s:undodir)
endif
set undodir=s:undodir
set undofile
let g:is_posix=1
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

nnoremap <c-h> :<C-u>bp <enter>
nnoremap <c-l> :<C-u>bn <enter>

nnoremap <leader>y "*
nnoremap gf :<C-u>e <cfile><cr>

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
Plug 'DeepInThought/vscode-shell-snippets'
Plug 'LeafCage/yankround.vim'
Plug 'ajh17/VimCompletesMe'
Plug 'andymass/vim-matchup'
Plug 'basyura/TweetVim'
Plug 'basyura/twibill.vim'
Plug 'bronson/vim-trailing-whitespace', {'on': 'FixWhitespace'}
Plug 'buoto/gotests-vim', {'for': 'go'}
Plug 'cocopon/iceberg.vim'
Plug 'cohama/lexima.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'deris/vim-textobj-ipmac'
Plug 'gkapfham/vim-vitamin-onec'
Plug 'glidenote/memolist.vim', {'on': ['MemoNew', 'MemoList' ,'MemoGrep']}
Plug 'golang/vscode-go'
Plug 'hashicorp/vscode-terraform'
Plug 'hashivim/vim-terraform', {'for': 'terraform'}
Plug 'haya14busa/vim-operator-flashy'
Plug 'hrsh7th/vim-lamp'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'janko/vim-test'
Plug 'kana/vim-operator-replace'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-user'
Plug 'lambdalisue/gina.vim'
Plug 'lambdalisue/vim-gista'
Plug 'machakann/vim-sandwich'
Plug 'markonm/traces.vim'
Plug 'mattn/ctrlp-ghq'
Plug 'mattn/ctrlp-matchfuzzy'
Plug 'mattn/ctrlp-register'
Plug 'mattn/sonictemplate-vim'
Plug 'mattn/vim-godoc', {'for': 'go'}
Plug 'mattn/vim-goimports', {'for': 'go'}
Plug 'mattn/vim-molder'
Plug 'mattn/vim-textobj-url'
Plug 'mattn/webapi-vim'
Plug 'mhinz/vim-grepper', {'on': ['Grepper', '<plug>(GrepperOperator)']}
Plug 'mhinz/vim-signify' , {'commit': 'd80e507'}
Plug 'microsoft/vscode-python'
Plug 'morhetz/gruvbox'
Plug 'osyo-manga/shabadou.vim'
Plug 'osyo-manga/vim-operator-stay-cursor'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'previm/previm', {'for': 'markdown'}
Plug 'rhysd/try-colorscheme.vim'
Plug 'sbdchd/neoformat'
Plug 'sgur/vim-editorconfig'
Plug 'skywind3000/asyncrun.vim'
Plug 'suy/vim-ctrlp-commandline'
Plug 'tacahiroy/ctrlp-funky'
Plug 'thinca/vim-qfreplace'
Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-speeddating'
Plug 'tyru/caw.vim'
Plug 'tyru/eskk.vim'
Plug 'tyru/open-browser.vim'
Plug 'vim-jp/vimdoc-ja'
Plug 'wakatime/vim-wakatime'
Plug 'zeero/vim-ctrlp-help'
Plug 'zinit-zsh/zinit-vim-syntax', {'for': 'zsh'}
if !has('nvim')
  Plug 'rbtnn/vim-pterm'
  Plug 'kana/vim-slacky'
endif
call plug#end()

"----------------------------------------
" color settings
"----------------------------------------
" color {{{
" if exists('+termguicolors')
"   set termguicolors
" endif
if $TMUX != ""
  let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
  let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
endif
syntax enable
set background=dark
colorscheme gruvbox
"}}}

"----------------------------------------
" Plugin Settings
"----------------------------------------
" manual filetype {{{
autocmd BufRead,BufNewFile *pipeline.yml set filetype=yaml.concourse
autocmd BufRead,BufNewFile *_test.go set filetype=go.test
autocmd BufRead,BufNewFile .envrc set filetype=sh
" }}}
" VimCompletesMe {{{
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
let g:vcm_s_tab_behavior = 1
" }}}
" vim-lamp {{{
autocmd! vimrc User lamp#initialized call s:on_initialized()
function! s:on_initialized()
  " built-in setting
  if executable('typescript-language-server')
    call lamp#builtin#typescript_language_server()
  endif
  if executable('vim-language-server')
    call lamp#builtin#vim_language_server()
  endif
  if executable('gopls')
    call lamp#builtin#gopls()
  endif
  if executable('pyls')
    call lamp#builtin#pyls()
  endif

  " custom setting
  if executable('terraform-lsp')
    call lamp#register('terraform-lsp', {
        \   'command': ['terraform-lsp'],
        \   'filetypes': ['terraform'],
        \   'root_uri': { -> lamp#findup(['provider.tf']) },
        \ })
  endif
  if executable('bash-language-server')
    call lamp#register('bash-language-server', {
        \   'command': ['bash-language-server', 'start'],
        \   'filetypes': ['sh'],
        \ })
  endif
  if executable('concourse-language-server')
    call lamp#register('concourse-language-server', {
        \   'command': ['concourse-language-server'],
        \   'filetypes': ['yaml.concourse'],
        \ })
  endif
  if executable('yaml-language-server')
    call lamp#register('yaml-language-server', {
        \   'command': ['yaml-language-server', '--stdio'],
        \   'filetypes': ['yaml'],
        \   'workspace_config': { -> {
        \     'yaml': {
        \     'completion': v:true,
        \     'hover': v:true,
        \     'validate': v:true,
        \       'schemas': {
        \         "https://json.schemastore.org/github-action.json": ["/*.yml"],
        \       }
        \     },
        \   } },
        \ })
  endif
endfunction
autocmd! vimrc User lamp#text_document_did_open call s:on_text_document_did_open()
function! s:on_text_document_did_open() abort
  " completion
  setlocal omnifunc=lamp#complete

  " commands
  nnoremap <buffer> gd           :<C-u>LampDefinition edit<CR>
  nnoremap <buffer> gD           :<C-u>LampDefinition split<CR>
  nnoremap <buffer> K            :<C-u>LampHover<CR>
  nnoremap <buffer> gr           :<C-u>LampRename<CR>
  nnoremap <buffer> gR           :<C-u>LampReferences<CR>
  nnoremap <buffer> <Leader>f    :<C-u>LampFormatting<CR>
  vnoremap <buffer> <Leader>f    :LampRangeFormatting<CR>
  nnoremap <buffer> ga           :<C-u>LampCodeAction<CR>
  vnoremap <buffer> ga           :LampCodeAction<CR>
  nnoremap <buffer> <C-k>        :<C-u>LampDiagnosticsPrev<CR>
  nnoremap <buffer> <C-j>        :<C-u>LampDiagnosticsNext<CR>
endfunction
" }}}
" vsnip {{{
let g:vsnip_snippet_dir = expand('$HOME/dotfiles/vsnip')
imap <expr> <C-k> vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-k>'
smap <expr> <C-k> vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-k>'
imap <expr> <C-h> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-h>'
smap <expr> <C-h> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-h>'
" }}}
" AsyncRun {{{
let g:asyncrun_open = 8
" }}}
" YankRound {{{
nmap p <Plug>(yankround-p)
xmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
" }}}
" Quick-Run {{{
let g:quickrun_config = {
      \   '_' : {
      \       'runner' : 'terminal',
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
let g:quickrun_config['go.test'] = {'command' : 'go', 'exec' : ['%c test -v']}
let g:quickrun_config['go'] = {'command': 'go', 'exec': ['%C run *.go']}
let g:quickrun_config['terraform'] = {'command': 'terraform', 'exec': ['%C plan -out plan -no-color']}
let g:quickrun_config['typescript'] = {
      \ 'command': 'npx tsc',
      \ 'exec': ['%C --project . --noEmit'],
      \ 'outputter/quickfix/errorformat' : '%+A %#%f %#(%l\,%c): %m,%C%m',
      \}
let g:quickrun_config['python'] = {
      \ 'command': 'python',
      \ 'exec': ['%C %s'],
      \ 'hook/shebang/enable': 0,
      \ 'outputter/quickfix/errorformat' : '%C %.%#,%A  File "%f"\, line %l%.%#,%Z%[%^ ]%@=%m',
      \ }

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
      \             ['fileformat', 'fileencoding', 'filetype']]
      \}

let g:lightline.component_function = {
      \   'gitbranch': 'Branch',
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
nnoremap <silent> [Git]d :<C-u>Gina diff %<CR>
" }}}
" go {{{
" highlight error
augroup hierr
  autocmd!
  autocmd vimrc FileType go :highlight goErr cterm=bold ctermfg=214
  autocmd vimrc FileType go :match goErr /\<err\>/
augroup END
augroup tab
  autocmd!
  autocmd vimrc FileType go set noexpandtab
  autocmd vimrc FileType go set tabstop=2
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

let g:fruzzy#usenative = 1
let g:fruzzy#sortonempty = 1
let g:ctrlp_match_current_file = 1
let g:ctrlp_match_func = {'match': 'ctrlp_matchfuzzy#matcher'}

let g:ctrlp_use_caching = 0
" Guess vcs root dir
let g:ctrlp_working_path_mode = 'ra'
if executable('rg')
  let g:ctrlp_user_command = 'rg --files %s'
  let g:ctrlp_switch_buffer = 'et'
endif

let g:ctrlp_map = '<Nop>'
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
" }}}
" vim-test {{{
let test#strategy = "vimterminal"
" }}}
" Python {{{
let g:neoformat_enabled_python = ['black']
" }}}
" operator {{{
map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$
map mp <Plug>(operator-replace)
vmap p <Plug>(operator-replace)
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
      \}
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
" sonic-template {{{
let g:sonictemplate_vim_template_dir = [
      \ '~/dotfiles/vim/template'
      \]
" }}}
" reading_vimrc {{{
autocmd vimrc FileType vim vmap <Space> <Plug>(reading_vimrc-update_clipboard)
"}}}
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
" color picker {{{
function! s:get_syn_id(transparent)
  let synid = synID(line('.'), col('.'), 1)
  return a:transparent ? synIDtrans(synid) : synid
endfunction
function! s:get_syn_name(synid)
  return synIDattr(a:synid, 'name')
endfunction
function! s:get_highlight_info()
  execute 'highlight ' . s:get_syn_name(s:get_syn_id(0))
  execute 'highlight ' . s:get_syn_name(s:get_syn_id(1))
endfunction
command! HighlightInfo call s:get_highlight_info()
" }}}
" Only use paste mode once {{{
augroup paste
  autocmd!
  autocmd InsertLeave * set nopaste
augroup END
" }}}
" FIXME {{{
if !has('nvim')
  augroup usrcmd
    autocmd!
    " fix vim script user command syntax highlighting
    " (should be unnecessary when https://github.com/vim/vim/issues/6587 is fixed)
    autocmd Syntax vim syn match vimUsrCmd '^\s*\zs\u\%(\w*\)\@>(\@!'
  augroup end
endif
" }}}
" }}}
