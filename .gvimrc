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

"----------------------------------------
" ColorScheme
"----------------------------------------
colorscheme gruvbox-material

"----------------------------------------
" FontSetting
"----------------------------------------
set guifont=PlemolJP\ Console\ NF:h13

if has('directx')
  set rop=type:directx,renmode:5
endif
