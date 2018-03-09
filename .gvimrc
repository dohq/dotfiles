"----------------------------------------
" GUI Setting
"----------------------------------------
" set iminsert=0

set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b

if has("gui_running")
  au GUIEnter * simalt ~x
endif

"----------------------------------------
" ColorScheme
"----------------------------------------
colorscheme base16-ashes

"----------------------------------------
" FontSetting
"----------------------------------------
" set guifont=Ricty\ Diminished\ Discord:h14
" set guifontwide=Ricty\ Diminished\ Discord:h12
" set guifont=Cica-Regular:h12
set guifont=Cica:h12
set printfont=Cica:h8
" set ambiwidth=double
