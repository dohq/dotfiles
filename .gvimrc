set columns=100
set lines=48
"----------------------------------------
" IME
"----------------------------------------
set imdisable
if has('multi_byte_ime') || has('xim')
  set iminsert=0 imsearch=0
  if has('xim') && has('GUI_GTK')
    " set imactivatekey=C-Space
  endif
endif

if has('multi_byte_ime')
  highlight Cursor guifg=NONE guibg=Green
  highlight CursorIM guifg=NONE guibg=Purple
endif

"----------------------------------------
" ColorScheme
"----------------------------------------
colorscheme molokai

"----------------------------------------
" FontSetting
"----------------------------------------
set guifont=Ricty\ Regular\ for\ Powerline:h16
