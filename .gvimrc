set columns=100
set lines=40
"----------------------------------------
" IME
"----------------------------------------
set imdisable
source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim
"if has('multi_byte_ime') || has('xim')
"  set iminsert=0 imsearch=0
"  if has('xim') && has('GUI_GTK')
"    " set imactivatekey=C-Space
"  endif
"endif
"
"if has('multi_byte_ime')
"  highlight Cursor guifg=NONE guibg=Green
"  highlight CursorIM guifg=NONE guibg=Purple
"endif

"----------------------------------------
" ColorScheme
"----------------------------------------
colorscheme base16-ashes
"set background=dark
"let g:solarized_italic = 0

"----------------------------------------
" FontSetting
"----------------------------------------
set guifont=Ricty\ Regular\ for\ Powerline:h14
