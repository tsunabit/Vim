" System vimrc file for MacVim
"
" Maintainer:	Bjorn Winckler <bjorn.winckler@gmail.com>
" Last Change:	Sat Aug 29 2009

" ---追加コメント---
" vimrc、gvimrc保存場所
" /Applications/MacVim.app/Contents/Resources/vim/vimrc

set nocompatible

" The default for 'backspace' is very confusing to new users, so change it to a
" more sensible value.  Add "set backspace&" to your ~/.vimrc to reset it.
set backspace+=indent,eol,start

" Disable localized menus for now since only some items are translated (e.g.
" the entire MacVim menu is set up in a nib file which currently only is
" translated to English).
set langmenu=none

" Python2
" MacVim uses Homebrew python2 if installed, otherwise configured one
if exists("&pythondll") && exists("&pythonhome")
  if filereadable("/usr/local/Frameworks/Python.framework/Versions/2.7/Python")
    " Homebrew python 2.7
    set pythondll=/usr/local/Frameworks/Python.framework/Versions/2.7/Python
    set pythonhome=/usr/local/Frameworks/Python.framework/Versions/2.7
  endif
endif

" Python3
" MacVim uses Homebrew python3 if installed, next try to use python.org binary
if exists("&pythonthreedll") && exists("&pythonthreehome") &&
      \ !filereadable(&pythonthreedll)
  if filereadable("/Library/Frameworks/Python.framework/Versions/3.6/Python")
    " https://www.python.org/downloads/mac-osx/
    set pythonthreedll=/Library/Frameworks/Python.framework/Versions/3.6/Python
    set pythonthreehome=/Library/Frameworks/Python.framework/Versions/3.6
  endif
endif


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
  autocmd WinEnter,BufRead,BufNew,Syntax * :silent! call matchadd('Todo', '\(TODO\|todo\)')
  autocmd WinEnter,BufRead,BufNew,Syntax * highlight Todo guibg=Red guifg=white
  autocmd WinEnter,BufRead,BufNew,Syntax * :silent! call matchadd('Done', '\(DONE\|done\)')
  autocmd WinEnter,BufRead,BufNew,Syntax * highlight Done guibg=blue guifg=white

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
set listchars=tab:»-,trail:-,nbsp:%,eol:↲
