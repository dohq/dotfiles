" Startup: {{{
" Skip initialization for vim-tiny or vim-small
" take account of '-eval'
"if !1 | finish | endif
if 0 | endif
" Use plain vim
" when vim was invoked by 'sudo' command
" or, invoked as 'git difftool'
if exists('$SUDO_USER') || exists('$GIT_DIR')
finish
endif
if has('vim_starting')
" Necesary for lots of cool vim things
"set nocompatible
" http://rbtnn.hateblo.jp/entry/2014/11/30/174749
" Define the entire vimrc encoding
scriptencoding utf-8
" Initialize runtimepath
set runtimepath&
" Vim starting time
if has('reltime')
let g:startuptime = reltime()
augroup vimrc-startuptime
autocmd! VimEnter * let g:startuptime = reltime(g:startuptime) | redraw
\ | echomsg 'startuptime: ' . reltimestr(g:startuptime)
augroup END
endif
endif
" Script variables
" boolean
let s:true = 1
let s:false = 0
" platform
let s:is_windows = has('win16') || has('win32') || has('win64')
let s:is_cygwin = has('win32unix')
let s:is_mac = !s:is_windows && !s:is_cygwin
\ && (has('mac') || has('macunix') || has('gui_macvim') ||
\ (!executable('xdg-open') &&
\ system('uname') =~? '^darwin'))
let s:is_linux = !s:is_mac && has('unix')
let s:vimrc = expand("<sfile>:p")
let $MYVIMRC = s:vimrc
"}}}

if has('vim_starting')
  set rtp+=~/.vim/plugged/vim-plug
  if !isdirectory(expand('~/.vim/plugged/vim-plug'))
    echo 'install vim-plug...'
    call system('mkdir -p ~/.vim/plugged/vim-plug')
    call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
  end
endif

" Plugin list
call plug#begin('~/.vim/plugged')
  Plug 'junegunn/vim-plug',
     \ {'dir': '~/.vim/plugged/vim-plug/autoload'}
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neco-vim'
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/vimproc.vim'
Plug 'Shougo/unite.vim' | Plug 'Shougo/unite-outline'
Plug 'tsukkee/unite-tag'
Plug 'basyura/J6uil.vim'
Plug 'kassio/neoterm'
Plug 'justinmk/vim-dirvish'
Plug 'vim-jp/vital.vim'
Plug 'thinca/vim-quickrun'

Plug 'ynkdir/vim-funlib'

" Format
"Plug 'scrooloose/syntastic'
Plug 'benekastah/neomake'
Plug 'rcmdnk/vim-markdown'
Plug 'lambdalisue/vim-unified-diff'
Plug 'vim-scripts/sh.vim--Cla'
Plug 'osyo-manga/shabadou.vim'
Plug 'osyo-manga/vim-watchdogs'
" UI
Plug 'spolu/dwm.vim'
Plug 'itchyny/lightline.vim'
Plug 'altercation/vim-colors-solarized'
"Plug 'nathanaelkane/vim-indent-guides'
Plug 'Yggdroot/indentLine'
" Tweet
Plug 'basyura/TweetVim', { 'branch' : 'dev' }
Plug 'basyura/bitly.vim'
Plug 'basyura/twibill.vim'
Plug 'mattn/favstar-vim'
Plug 'mattn/webapi-vim'
" Input
Plug 'tyru/eskk.vim'
Plug 'rhysd/unite-codic.vim' | Plug 'koron/codic-vim'
Plug 'ujihisa/neco-look'
Plug 'tpope/vim-surround'
Plug 'cohama/lexima.vim'
Plug 'Shougo/neosnippet' | Plug 'Shougo/neosnippet-snippets'
Plug 'osyo-manga/vim-over'
Plug 'Lokaltog/vim-easymotion'
" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'lambdalisue/vim-gista', { 'on' : ['Gista'] }
Plug 'lambdalisue/vim-gista-unite'
" Tags
Plug 'ludovicchabant/vim-gutentags'
call plug#end()

" PluginCheckInstall {{{
let s:plug = {
      \ "plugs": get(g:, 'plugs', {})
      \ }

function! s:plug.is_installed(name)
  return has_key(self.plugs, a:name) ? isdirectory(self.plugs[a:name].dir) : 0
endfunction

if s:plug.is_installed("vim-myplugin")
  " setting
endif
function! s:plug.check_installation()
  if empty(self.plugs)
    return
  endif

  let list = []
  for [name, spec] in items(self.plugs)
    if !isdirectory(spec.dir)
      call add(list, spec.uri)
    endif
  endfor

  if len(list) > 0
    let unplugged = map(list, 'substitute(v:val, "^.*github\.com/\\(.*/.*\\)\.git$", "\\1", "g")')

    " Ask whether installing plugs like Plug
    echomsg 'Not installed plugs: ' . string(unplugged)
    if confirm('Install plugs now?', "yes\nNo", 2) == 1
      PlugInstall
      " Close window for vim-plug
      silent! close
      " Restart vim
      silent! !vim
      quit!
    endif
  endif
endfunction

augroup check-plug
  autocmd!
  autocmd VimEnter * if !argc() | call s:plug.check_installation() | endif
augroup END

" }}}
""""""""""""""""""
" Global Setting "
""""""""""""""""""
" Color
colorscheme solarized
set background=dark

" Basic
filetype plugin indent on
set enc=UTF-8
scriptencoding utf-8
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
set clipboard=unnamed,unnamedplus
set completeopt+=noinsert
set lazyredraw
set ttyfast
set nf=""
syntax on
set hlsearch

" Keybind
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz
vmap y "*Y
let g:mapleader = ","
inoremap jj <ESC>
nnoremap J 15j
nnoremap K 15k
nnoremap L 10l
nnoremap H 10h
nnoremap Y y$
" ノーマルモード時だけ ; と : を入れ替える
if has('mac')
 nnoremap ; :
 nnoremap : ;
endif


" Plugin Settings
" Deoplete {{{
let g:deoplete#auto_completion_start_length = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_auto_pairs = 1
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns._ = '[a-zA-Z_]\k*\(?'
let g:deoplete#omni#functions = {}
let g:deoplete#omni_patterns = {}

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deolete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><C-g> deoplete#mappings#undo_completion()
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
return deoplete#mappings#close_popup() . "\<CR>"
endfunction
" Use auto delimiter
call deoplete#custom#set('_', 'converters',
\ ['converter_auto_paren',
\ 'converter_auto_delimiter', 'remove_overlap'])
" <S-TAB>: completion back.
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
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
\ 'path': '~/skk/SKK-JISYO.L',
\ 'sorted': 1,
\}
" Don't keep state.
let g:eskk#keep_state = 0
let g:eskk#show_annotation = 1
"let g:eskk#rom_input_style = 'msime'
let g:eskk_revert_henkan_style = "okuri"
let g:eskk#egg_like_newline = 1
let g:eskk#egg_like_newline_completion = 1
let g:eskk#tab_select_completion = 1
let g:eskk#start_completion_length = 3 "}}}
" vim-easymotion {{{
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
let g:dwm_master_pane_width=85 "}}}
"TweetVim {{{
let g:tweetvim_tweet_per_page = 60
let g:tweetvim_cache_size     = 10
let g:tweetvim_display_source = 1

nnoremap <silent> <Space>ts :<C-u>TweetVimSay<Space><CR>
nnoremap <silent> <Space>tl :<C-u>Unite tweetvim<Space><CR>
nnoremap <F6> :<C-u>Unite tweetvim<CR>
nnoremap ,ts :<C-u>TweetVimSay<CR>
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
nnoremap <silent> [unite]s :UniteResume<CR>

if executable('pt')
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_max_candidates = 200
  let g:unite_source_grep_encoding = 'utf-8'
endif
"}}}

" over.vim
nnoremap <silent> <Space>m :OverCommandLine<CR>
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>

" IndentLine
let g:indentLine_enabled = 1

" dirvish
let g:dirvish_hijack_netrw = 1

" vim-fugitive
nmap <F9> :Gwrite<CR>
nmap <F10> :Gcommit -v<CR>

" Lexima
call lexima#add_rule({'at': '\%#.*[-0-9a-zA-Z_,:]', 'char': '{', 'input': '{'})
call lexima#add_rule({'at': '\%#\n\s*}', 'char': '}', 'input': '}', 'delete': '}'})

" Neoterm
let g:neoterm_position = 'horizontal'

" Git-gutter
let g:gitgutter_enabled = 1
nnoremap <silent> <Leader>gg :<C-u>GitGutterToggle<CR>
nnoremap <silent> <Leader>gh :<C-u>GitGutterLineHighlightsToggle<CR>
