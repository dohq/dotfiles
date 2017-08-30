set columns=100
set lines=40
"----------------------------------------
" IME
"----------------------------------------
set imdisable
source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim

"----------------------------------------
" ColorScheme
"----------------------------------------
colorscheme base16-ashes

"highlight Normal ctermbg=NONE guibg=NONE
"highlight NonText ctermbg=NONE guibg=NONE
"highlight SpecialKey ctermbg=NONE guibg=NONE
"highlight EndOfBuffer ctermbg=NONE guibg=NONE

set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b

"----------------------------------------
" FontSetting
"----------------------------------------
set guifont=Ricty\ Diminished\ Discord:h12
" set guifontwide=Ricty\ Diminished\ Discord:h12
" set guifont=Fira\ Code\ Light:h12
