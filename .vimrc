" init {{{
let s:MSWindows = has('win32')
if s:MSWindows
  let $MYVIMDIR = expand($VIM.'/vimfiles')
else
  let $MYVIMDIR = expand('~/.vim')
endif

" All autocmd reset
augroup vimrc
  autocmd!
augroup END
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
" Input Assist
Plug 'maralla/completor.vim'
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
" Plug 'wakatime/vim-wakatime'
Plug 'lambdalisue/vim-unified-diff'
Plug 'kana/vim-operator-user'
" Visual
Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'
Plug 'felixjung/vim-base16-lightline'
Plug 'Yggdroot/indentLine'
Plug 'ryanoasis/vim-devicons'
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
Plug 'keith/investigate.vim'
" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'lambdalisue/vim-gista',               {'on': 'Gista'}
Plug 'lambdalisue/gina.vim'
" CtrlP
Plug 'ctrlpvim/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'mattn/ctrlp-launcher'
Plug 'mattn/ctrlp-register'
Plug 'suy/vim-ctrlp-commandline'
Plug 'tacahiroy/ctrlp-funky'
Plug 'zeero/vim-ctrlp-help'
Plug 'mattn/ctrlp-filer'
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
" json
Plug 'elzr/vim-json',                       {'for': 'json'}
" go
Plug 'fatih/vim-go',                        {'for': 'go', 'do': ':GoInstallBinaries'}

Plug 'thinca/vim-showtime',                 {'on': 'ShowtimeStart'}
Plug 'y0za/vim-reading-vimrc'

call plug#end()

"----------------------------------------
" Option Settings
"----------------------------------------
" color {{{
set t_Co=256
let base16colorspace=256
colorscheme base16-ashes
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
set encoding=utf8
scriptencoding utf-8
set fencs=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932,utf-16le,utf-16,default,latin1,utf-8
" }}}
" set opt {{{
set ttyfast
set nrformats-=octal
set helplang=ja,en
set nobackup noswapfile
set imdisable
set clipboard=unnamed
set ambiwidth=double
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set whichwrap=b,s,[,],<,>
set foldmethod=marker
set cmdheight=2
set ignorecase
set smartcase
set wildignore=*.o,*.obj,*.pyc,*.so,*.dll,*.exe,*.xlsx
set wildmenu
set wildmode=full
set vb t_vb=
set novisualbell
set incsearch
set hlsearch
set display=lastline
set list
set listchars=tab:>.,extends:>,precedes:<,trail:-,eol:↲
set completeopt-=preview
if exists('+breakindent')
  set breakindent
  set breakindentopt=sbr
  set showbreak=<
endif
" }}}
" Keybind {{{
let g:mapleader = ','
" let g:mapleader = '<space>'
inoremap jj <ESC>

" InsertMode move cursor liught
inoremap <C-l> <C-g>U<Right>

" replace ; to :
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" disable allow key
nnoremap <Up>    <nop>
nnoremap <Down>  <nop>
nnoremap <Left>  <nop>
nnoremap <Right> <nop>
inoremap <Up>    <nop>
inoremap <Down>  <nop>
inoremap <Left>  <nop>
inoremap <Right> <nop>

" buffer
nnoremap <S-H> :bprev<CR>
nnoremap <S-L> :bnext<CR>

" fuckin jis keyboard
nnoremap q: q:i
nnoremap q/ q/i
nnoremap q? q?i

" resize func
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
"
" sudo write
cnoremap w!! w !sudo tee > /dev/null %<CR> :e!<CR>

" }}}

"----------------------------------------
" Plugin Settings
"----------------------------------------
" completor {{{
let g:completor_auto_trigger = 1
let g:completor_refresh_always = 0
let g:completor_set_options = 1
noremap <leader>K :call completor#do('doc')<CR>
noremap <leader>d :call completor#do('definition')<CR>
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
" }}}
" ultisnips {{{
" Trigger configuration.
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif

"}}}
" Quick-Run {{{
let g:quickrun_config = {
\   '_' : {
\       'runner' : 'job',
\       'outputter' : 'error',
\       "hook/neco/enable" : 1,
\       "hook/neco/wait" : 10,
\       'outputter/error/success' : 'buffer',
\       'outputter/error/error'   : 'quickfix',
\       'outputter/buffer/split' : ':botright 8sp',
\       'outputter/buffer/close_on_empty' : 1,
\       'outputter/buffer/into' : 1,
\       'outputter/quickfix/into' : 1,
\   },
\   'python' : {
\       'hook/output_encode/enable' : 1,
\       'hook/output_encode/encoding' : 'cp932',
\   },
\}
let g:quickrun_no_default_key_mappings = 1
" Running with close quickfix and save file
nnoremap <silent><Leader>r :cclose<CR>:write<CR>:QuickRun -mode n<CR>
xnoremap <silent><Leader>r :<C-U>cclose<CR>:write<CR>gv:QuickRun -mode v<CR>
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : ""
au FileType qf nnoremap <silent><buffer>q :cclose<CR>
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

" Linter
let g:ale_linters = {
\   'python': ['pylint'],
\}

nmap [ale] <Nop>
map <C-k> [ale]
" エラー行にジャンプ
nmap <silent> [ale]<C-P> <Plug>(ale_previous)
nmap <silent> [ale]<C-N> <Plug>(ale_next)

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
\ 'active': {
\   'left': [['mode', 'paste'],
\            ['fugitive', 'filename']],
\   'right': [['lineinfo', 'validator'],
\             ['fileformat', 'fileencoding', 'filetype']]
\ },
\ 'component_function': {
\   'fugitive': 'MyFugitive',
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
  let readonly = &readonly ? ' ' : ''
  let modified = &modified ? ' ' : ''
  return readonly . name . modified
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head') && strlen(fugitive#head())
      return '' . fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! MyFileencoding()
  return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
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
let g:eskk_revert_henkan_style = 'okuri'
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
nnoremap    [Git]   <Nop>
nmap    <Space>g [Git]
nnoremap <silent> [Git]gt :<C-u>GitGutterToggle<CR>
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
let g:indentLine_setColors = 1
let g:indentLine_setConceal = 1
let g:indentLine_faster = 1
let g:indentLine_color_term = 111
let g:indentLine_color_gui = '#708090'
" let g:indentLine_char = '︙'
let g:indentLine_char = '¦'
" }}}
" over.vim {{{
nnoremap <silent> <leader>o :OverCommandLine<CR>
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
"}}}
" Python {{{
autocmd FileType python setlocal omnifunc=jedi#completions
let python_highlight_all = 1
let g:jedi#completions_enabled = 1
let g:jedi#goto_command = "<leader>g"
let g:jedi#documentation_command = "<leader>k"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>R"
let g:jedi#show_call_signatures = "2"
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
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown,*.mmd setlocal filetype=markdown
augroup END
let g:previm_enable_realtime = 1
let g:netrw_nogx = 1 " netrwのキーマッピングを無効化
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
let g:SuperTabContextDefaultCompletionType = "<c-n>"
let g:SuperTabDefaultCompletionType = "<c-n>"
" }}}
" vim-ref {{{
let g:ref_phpmanual_path = $MYVIMDIR.'/doc/php-chunked-xhtml'
" }}}
" lexima {{{
inoremap <C-l> <C-r>=lexima#insmode#leave(1, '<LT>C-G>U<LT>RIGHT>')<CR>
" }}}
" Grepper {{{
cnoremap <c-n> <down>
cnoremap <c-p> <up>

let g:grepper               = {}
let g:grepper.tools         = ['rg', 'git', 'pt', 'ag']
let g:grepper.jump          = 0
let g:grepper.simple_prompt = 1
let g:grepper.quickfix      = 1
" }}}
" devicons {{{
" フォルダアイコンの表示をON
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:webdevicons_enable_ctrlp = 1
" }}}
let g:test#strategy = 'dispatch'
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1
let g:echodoc_enable_at_startup = 1
let g:opengoogletranslate#openbrowsercmd = 'electron-open --without-focus'
vmap <Leader><CR> <Plug>(reading_vimrc-update_clipboard)
