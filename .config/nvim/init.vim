setglobal rtp+=$HOME/.vim/plugged/vim-plug
if !isdirectory(expand('~/.vim/plugged/vim-plug'))
  echo 'install vim-plug...'
  call system('mkdir -p ~/.vim/plugged/vim-plug')
  call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
end

" Plugin list
call plug#begin('$HOME/.vim/plugged')
  Plug 'junegunn/vim-plug',
     \ {'dir': '$HOME/.vim/plugged/vim-plug/autoload'}
Plug 'kassio/neoterm', { 'on': 'Terminal' }
Plug 'justinmk/vim-dirvish'
Plug 'rhysd/unite-codic.vim', { 'on': 'Unite' }
Plug 'tsukkee/unite-tag', { 'on': 'Unite' }
Plug 'koron/codic-vim', { 'on': 'Codic' }

" executable
Plug 'thinca/vim-quickrun'
Plug 'cohama/vim-hier'
Plug 'dannyob/quickfixstatus'
Plug 'osyo-manga/shabadou.vim'
Plug 'osyo-manga/vim-watchdogs'
" Shougo ware
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/unite.vim', { 'on': 'Unite' }
Plug 'Shougo/unite-outline', { 'on': 'Unite' }
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neoinclude.vim'
" Format
Plug 'rcmdnk/vim-markdown', { 'for': 'markdown' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'lambdalisue/vim-unified-diff'
Plug 'vim-scripts/sh.vim--Cla', { 'for': 'sh' }
Plug 'Konfekt/FastFold'
" Go lang
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'zchee/deoplete-go', { 'for': 'go' }
" UI
Plug 'junegunn/limelight.vim'
Plug 'spolu/dwm.vim'
Plug 'itchyny/lightline.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'Yggdroot/indentLine'
" Sociales
Plug 'basyura/TweetVim', { 'on': [ 'TweetVim', 'TweetVimSay' ] }
Plug 'basyura/bitly.vim', { 'on': [ 'TweetVim', 'TweetVimSay' ] }
Plug 'basyura/twibill.vim', { 'on': [ 'TweetVim', 'TweetVimSay' ] }
Plug 'mattn/favstar-vim', { 'on': [ 'TweetVim', 'TweetVimSay' ] }
Plug 'mattn/webapi-vim'
Plug 'basyura/J6uil.vim', { 'on': 'J6uil' }
" Input
Plug 'tyru/eskk.vim'
Plug 'ujihisa/neco-look'
Plug 'tpope/vim-surround'
Plug 'cohama/lexima.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'osyo-manga/vim-over', { 'on': 'OverCommandLine' }
Plug 'Lokaltog/vim-easymotion'
Plug 'Shougo/echodoc.vim'
" Git
"Plug 'tpope/vim-fugitive'
Plug 'lambdalisue/vim-gita'
Plug 'airblade/vim-gitgutter', { 'on': 'GitGutterEnable' }
Plug 'lambdalisue/vim-gista'
Plug 'lambdalisue/vim-gista-unite'
" Tags
Plug 'ludovicchabant/vim-gutentags'
" Tools
Plug 'chimay/unite-mpc'
call plug#end()

""""""""""""""""""
" Global Setting "
""""""""""""""""""
" Color
colorscheme solarized
" disable italic
let g:solarized_italic = 0
set background=dark

" Basic
filetype plugin indent on
syntax on
set fencs=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932,utf-16le,utf-16,default,latin1,utf-8
augroup spacend
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//e
augroup END
set ambiwidth=double
set autoindent
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set backspace=indent,eol,start
set display=lastline
set foldmethod=marker
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
"set clipboard=unnamed,unnamedplus
set completeopt+=noselect
set lazyredraw
set ttyfast
set nf=""
set hlsearch
set cmdheight=2

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
cnoremap w!! w !sudo tee > /dev/null %<CR> :e!<CR>

" Reload VIMRC
if has('vim_starting')
  function s:reload_vimrc() abort
    execute printf('source %s', $MYVIMRC)
    if has('gui_running')
      execute printf('source %s', $MYGVIMRC)
    endif
    redraw
    echo printf('.vimrc/.gvimrc has reloaded (%s).', strftime('%c'))
  endfunction
endif
nmap <silent> <Plug>(my-reload-vimrc) :<C-u>call <SID>reload_vimrc()<CR>
nmap <Leader>v <Plug>(my-reload-vimrc)<Paste>

" ノーマルモード時だけ ; と : を入れ替える
if has('mac') || has('unix')
 nnoremap ; :
 nnoremap : ;
endif


" Plugin Settings
" Deoplete {{{
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#auto_completion_start_length = 2
let g:deoplete#enable_auto_pairs = 1
let g:deoplete#keyword_patterns = {}
let g:deoplete#omni#functions = {}
let g:deoplete#omni_patterns = {}
let g:deoplete#omni#input_patterns = {}
let g:deoplete#sources#go = 'vim-go'
let g:deoplete#omni#input_patterns.ruby =
\ ['[^. *\t]\.\w*', '[a-zA-Z_]\w*::']
" disable buffer source
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['buffer']
"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"
 "Enterで補完を確定(endwiseとの関係でおかしくなる対策）
function! s:my_crinsert()
  return pumvisible() ? deoplete#mappings#smart_close_popup() : "\<Cr>"
endfunction
inoremap <silent> <CR> <C-R>=<SID>my_crinsert()<CR>

if has("patch-7.4.314")
  set shortmess+=c
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
        \     ['lineinfo', 'syntastic'],
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
        \   'syntastic': 'SyntasticStatuslineFlag',
        \   'charcode': 'MyCharCode',
        \   'gitgutter': 'MyGitGutter',
        \ },
        \ 'separator': {'left': '⮀', 'right': '⮂'},
        \ 'subseparator': {'left': '⮁', 'right': '⮃'}
        \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &ro ? '⭤' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
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

  let encoding = (&fenc == '' ? &enc : &fenc)

  if encoding == 'utf-8'
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
" }}}
" Neosnippet {{{
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif "}}}
" eskk {{{
let g:eskk#directory = expand('$CACHE/eskk')
let g:eskk#large_dictionary = {
\ 'path': '~/.vim/skk/SKK-JISYO.L',
\ 'sorted': 1,
\}
" Don't keep state.
let g:eskk#show_annotation = 1
let g:eskk#rom_input_style = 'msime'
let g:eskk#egg_like_newline = 1
let g:eskk#egg_like_newline_completion = 1
let g:eskk#tab_select_completion = 1
let g:eskk#start_completion_length = 2 "}}}
" vim-easymotion {{{
let g:EasyMotion_do_shade = 0
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
let g:EasyMotion_space_jump_first = 1 "}}}
" dwm.vim {{{
nnoremap <c-j> <c-w>w
nnoremap <c-k> <c-w>W
nmap <m-r> <Plug>DWMRotateCounterclockwise
nmap <m-t> <Plug>DWMRotateClockwise
nmap <c-n> <Plug>DWMNew
nmap <c-c> <Plug>DWMClose
nmap <c-l> <Plug>DWMGrowMaster
nmap <c-h> <Plug>DWMShrinkMaster
"let g:dwm_master_pane_width=85 "}}}
"TweetVim {{{
let g:tweetvim_tweet_per_page = 60
let g:tweetvim_cache_size     = 10
let g:tweetvim_display_source = 1

nnoremap    [TweetVim]   <Nop>
nmap    <Space>t [TweetVim]
nnoremap <silent> [TweetVim]l :<C-u>Unite<Space>tweetvim<CR>
nnoremap <silent> [TweetVim]s :<C-u>TweetVimSay<CR>
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
nnoremap <silent> [unite]g :<C-u>Unite<Space>grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]h :<C-u>Unite<Space>history/yank<CR>
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]c :<C-u>Unite<Space>codic<CR>
nnoremap <silent> [unite]t :<C-u>Unite<Space>tag<CR>
nnoremap <silent> [unite]s :UniteResume<CR>

 " use pt
" https://github.com/monochromegane/the_platinum_searcher
if executable('pt')
set grepprg=pt\ --hidden\ --nogroup\ --nocolor\ --smart-case
let g:unite_source_grep_command = 'pt'
let g:unite_source_grep_default_opts =
\ '--hidden --nogroup --nocolor --smart-case'
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_grep_encoding = 'utf-8'
endif
"}}}
" vim-fugitive{{{
nnoremap    [vim-Gita]   <Nop>
nmap    <Space>g [vim-Gita]
nnoremap <silent> [vim-Gita]a :<C-u>Gita<Space>add<CR>
nnoremap <silent> [vim-Gita]c :<C-u>Gita<Space>commit<CR>
nnoremap <silent> [vim-Gita]d :<C-u>Gita<Space>diff<CR>
nnoremap <silent> [vim-Gita]s :<C-u>Gita<Space>status<CR>
" }}}
" vim-fugitive{{{
nnoremap    [fugitive]   <Nop>
nmap    <Space>g [fugitive]
nnoremap <silent> [fugitive]a :<C-u>Gwrite<CR>
nnoremap <silent> [fugitive]c :<C-u>Gcommit<CR>
nnoremap <silent> [fugitive]d :<C-u>Gdiff<CR>
nnoremap <silent> [fugitive]s :<C-u>Gstatus<CR>
" }}}
" watchdogs {{{
let g:watchdogs_check_BufWritePost_enable = 1
let g:watchdogs_check_CursorHold_enable = 1
let g:quickrun_config = {
\	'watchdogs_checker/_' : {
\		'outputter/quickfix/open_cmd' : '',
\	},
\}
" watchdogs.vim の設定を追加
call watchdogs#setup(g:quickrun_config)
" :WatchdogsRun の出力先を buffer に指定する
let g:quickrun_config["watchdogs_checker/_"] = {
\	"outputter" : "buffer",
\}
"}}}
" vim-go {{{
au BufNewFile,BufRead *.go set noexpandtab tabstop=4 shiftwidth=4
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
" Keymapping
nnoremap    [vim-go]   <Nop>
nmap    <Space>l [vim-go]
au FileType go nmap [vim-go]r <Plug>(go-run)
au FileType go nmap [vim-go]b <Plug>(go-build)
au FileType go nmap [vim-go]t <Plug>(go-test)
au FileType go nmap [vim-go]c <Plug>(go-coverage)
au FileType go nmap [vim-go]d <Plug>(go-doc-vertical)
"}}}
" Limelight {{{
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1
"}}}

" over.vim
nnoremap <silent> <Space>m :OverCommandLine<CR>
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>

" IndentLine
let g:indentLine_enabled = 1

" dirvish
let g:dirvish_hijack_netrw = 1

" Lexima
call lexima#add_rule({'at': '\%#.*[-0-9a-zA-Z_,:]', 'char': '{', 'input': '{'})
call lexima#add_rule({'at': '\%#\n\s*}', 'char': '}', 'input': '}', 'delete': '}'})

" Neoterm
let g:neoterm_position = 'horizontal'

" Git-gutter
let g:gitgutter_enabled = 0
nnoremap <silent> <Leader>gg :<C-u>GitGutterToggle<CR>
nnoremap <silent> <Leader>gh :<C-u>GitGutterLineHighlightsToggle<CR>

" Vim-Gista
let g:gista#client#default_username = 'dohq'
