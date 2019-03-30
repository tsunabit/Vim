" System vimrc file for MacVim
"
" Author:       Bjorn Winckler <bjorn.winckler@gmail.com>
" Maintainer:   macvim-dev (https://github.com/macvim-dev)

set nocompatible

" The default for 'backspace' is very confusing to new users, so change it to a
" more sensible value.  Add "set backspace&" to your ~/.vimrc to reset it.
set backspace+=indent,eol,start

" Disable localized menus for now since only some items are translated (e.g.
" the entire MacVim menu is set up in a nib file which currently only is
" translated to English).
set langmenu=none

" Python2
" MacVim is configured by default to use the pre-installed System python2
" version. However, following code tries to find a Homebrew, MacPorts or
" an installation from python.org:
if exists("&pythondll") && exists("&pythonhome")
  if filereadable("/usr/local/Frameworks/Python.framework/Versions/2.7/Python")
    " Homebrew python 2.7
    set pythondll=/usr/local/Frameworks/Python.framework/Versions/2.7/Python
    set pythonhome=/usr/local/Frameworks/Python.framework/Versions/2.7
  elseif filereadable("/opt/local/Library/Frameworks/Python.framework/Versions/2.7/Python")
    " MacPorts python 2.7
    set pythondll=/opt/local/Library/Frameworks/Python.framework/Versions/2.7/Python
    set pythonhome=/opt/local/Library/Frameworks/Python.framework/Versions/2.7
  elseif filereadable("/Library/Frameworks/Python.framework/Versions/2.7/Python")
    " https://www.python.org/downloads/mac-osx/
    set pythondll=/Library/Frameworks/Python.framework/Versions/2.7/Python
    set pythonhome=/Library/Frameworks/Python.framework/Versions/2.7
  endif
endif

" Python3
" MacVim is configured by default to use Homebrew python3 version
" If this cannot be found, following code tries to find a MacPorts
" or an installation from python.org:
if exists("&pythonthreedll") && exists("&pythonthreehome") &&
      \ !filereadable(&pythonthreedll)
  if filereadable("/opt/local/Library/Frameworks/Python.framework/Versions/3.7/Python")
    " MacPorts python 3.7
    set pythonthreedll=/opt/local/Library/Frameworks/Python.framework/Versions/3.7/Python
    set pythonthreehome=/opt/local/Library/Frameworks/Python.framework/Versions/3.7
  elseif filereadable("/Library/Frameworks/Python.framework/Versions/3.7/Python")
    " https://www.python.org/downloads/mac-osx/
    set pythonthreedll=/Library/Frameworks/Python.framework/Versions/3.7/Python
    set pythonthreehome=/Library/Frameworks/Python.framework/Versions/3.7
  endif
endif


" ---追加設定---
" setting
"文字コードをUFT-8に設定
set fenc=utf-8
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" ヤンクとクリップボードを連携
" unnamed=ヤンクとクリップボード連携
" autoselect=選択範囲を自動でコピーする
set clipboard=unnamed,autoselect


" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
set cursorcolumn
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest

" コメント中の特定(TODO)の単語を強調表示する
augroup HilightsForce
  autocmd!
  autocmd WinEnter,BufRead,BufNew,Syntax * :silent! call matchadd('Todo', '\(TODO\|todo\|NOTE\|INFO\|DONE\|done\|TEMP\)')
  autocmd WinEnter,BufRead,BufNew,Syntax * highlight Todo guibg=cyan guifg=black
augroup END

" オートインデント時にインデントする文字数。tab = 4
set tabstop=4
" オートインデント時にインデントする文字数。tabstopと同じ値にしておけばよい
set shiftwidth=4
" TABキーを押した際にタブ文字の代わりにスペースをいれる(「ソフトTab」というらしい)。デフォルトはON。
" ソフトタブを有効にする
set expandtab
" ソフトタブを無効にする
" set noexpandtab

" 不可視文字を表示する
" 補足
" tab：タブ文字を表示
" trail：行末のスペースを表示
" nbsp：ノーブレークスペースを表示
" eol：改行を表示
set list
set listchars=tab:»-,trail:-,nbsp:%,eol:
