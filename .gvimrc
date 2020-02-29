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

if has('win32')
  augroup startfullscreen
    autocmd!
    autocmd GUIEnter * simalt ~x
  augroup end
endif

"----------------------------------------
" ColorScheme
"----------------------------------------
colorscheme vitaminonec

"----------------------------------------
" FontSetting
"----------------------------------------
" set guifont=Cica:h12
set guifont=Sarasa\ Mono\ T\ J:h12
" set printfont=Cica:h8

if has('directx')
  set rop=type:directx,renmode:5
endif
