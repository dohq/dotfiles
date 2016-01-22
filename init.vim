""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" NeoVimは現行Vimと違って幾つかのオプションが最初から有効にされていたり、
" 今まであったオプションが無くなっている。
" ex. http://neovim.jp/translations/help/vim_diff.html
"
"---+----1----+----2----+----3----+----4----+----5----+----6----+----7----+----8
" init autocmd {{{

" autocmdを初期化する
" source $MYVIMRCとかする時にautocmdが複数回呼ばれるとアレがナニだから
augroup vimrc
autocmd!
augroup END

"}}}


"---+----1----+----2----+----3----+----4----+----5----+----6----+----7----+----8

" Plugin init
" プラギンマネージャーはPlugを使用する
" ･･･が、Neobundleもいいなと思う
if has('vim_starting')
  setglobal rtp+=$XDG_CONFIG_HOME/nvim/plugged
  " vim-plugがインストールされていない場合、自動でインストールする
  " インストール先は~/.config/nvim/plugged以下
  if !isdirectory(expand('$XDG_CONFIG_HOME/nvim/plugged'))
    echo 'install vim-plug...'
    call system('mkdir -p $XDG_CONFIG_HOME/nvim/plugged')
    call system('git clone https://github.com/junegunn/vim-plug.git
    \ $XDG_CONFIG_HOME/nvim/plugged/autoload')
    augroup pinstall
      autocmd VimEnter * PlugInstall | source $MYVIMRC
    augroup END
  end
endif

call plug#begin('$XDG_CONFIG_HOME/nvim/plugged')
  Plug 'junegunn/vim-plug',
     \ {'dir': '$XDG_CONFIG_HOME/nvim/plugged/autoload'}

" Plugin list {{{

"入力補完"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 標準の補完機能よりもっと強力なの
Plug 'Shougo/deoplete.nvim'

" カーソル位置を基準とした、文脈から特定の filetype を判定する為のライブラリ
Plug 'Shougo/context_filetype.vim'

" echoエリアに様々な情報を表示できる
Plug 'Shougo/echodoc.vim'

" Deoplete用フレームワーク
Plug 'Shougo/neoinclude.vim'

"実行"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" バッファ上のコードをその場で実行
Plug 'thinca/vim-quickrun'

" QuickFix の該当箇所のハイライトを行う
Plug 'cohama/vim-hier'

" QuickFix の該当箇所にカーソルを移動した際echoエリアにエラー内容を表示
Plug 'dannyob/quickfixstatus'

" QuickRunのHook集
Plug 'osyo-manga/shabadou.vim'

" シンタックスチェックを非同期で行なえるスグレモノ
Plug 'osyo-manga/vim-watchdogs'

"実行"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#end()

"}}}
