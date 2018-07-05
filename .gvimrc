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

augroup startfullscreen
  autocmd!
  autocmd GUIEnter * simalt ~x
augroup end

"----------------------------------------
" ColorScheme
"----------------------------------------
colorscheme iceberg
let g:gruvbox_italic = 0

"----------------------------------------
" FontSetting
"----------------------------------------
set guifont=Cica:h12
set printfont=Cica:h8
