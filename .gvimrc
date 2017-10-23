set columns=100
set lines=40

set hlsearch
"----------------------------------------
" GUI Setting
"----------------------------------------
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
set guifont=Cica-Regular:h14
