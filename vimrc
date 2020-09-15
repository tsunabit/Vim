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
  elseif filereadable("/opt/local/Library/Frameworks/Python.framework/Versions/2.7/Python")
    " MacPorts python 2.7
    set pythondll=/opt/local/Library/Frameworks/Python.framework/Versions/2.7/Python
  elseif filereadable("/Library/Frameworks/Python.framework/Versions/2.7/Python")
    " https://www.python.org/downloads/mac-osx/
    set pythondll=/Library/Frameworks/Python.framework/Versions/2.7/Python
  endif
endif

" Python3
" MacVim is configured by default to use Homebrew python3 version
" If this cannot be found, following code tries to find a MacPorts
" or an installation from python.org:
if exists("&pythonthreedll") && exists("&pythonthreehome") &&
      \ !filereadable(&pythonthreedll)
  if filereadable("/opt/local/Library/Frameworks/Python.framework/Versions/3.8/Python")
    " MacPorts python 3.8
    set pythonthreedll=/opt/local/Library/Frameworks/Python.framework/Versions/3.8/Python
  elseif filereadable("/Library/Frameworks/Python.framework/Versions/3.8/Python")
    " https://www.python.org/downloads/mac-osx/
    set pythonthreedll=/Library/Frameworks/Python.framework/Versions/3.8/Python
  endif
endif

" -----ここから自分の設定-----
" 文字コードをUFT-8に設定
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
" 参考URL = https://qiita.com/omega999/items/15031eece4256eb500e7
augroup HilightsForce
  autocmd!
  autocmd WinEnter,BufRead,BufNew,Syntax * :silent! call matchadd('Todo', '\(TODO\|todo\)')
  autocmd WinEnter,BufRead,BufNew,Syntax * highlight Todo guibg=Red guifg=white
  autocmd WinEnter,BufRead,BufNew,Syntax * :silent! call matchadd('Done', '\(DONE\|done\)')
  autocmd WinEnter,BufRead,BufNew,Syntax * highlight Done guibg=blue guifg=white
  autocmd WinEnter,BufRead,BufNew,Syntax * :silent! call matchadd('Info', '\(INFO\|info\)')
  autocmd WinEnter,BufRead,BufNew,Syntax * highlight Info guibg=yellow guifg=black
  autocmd WinEnter,BufRead,BufNew,Syntax * :silent! call matchadd('Agenda', '\(AGENDA\|agenda\)')
  autocmd WinEnter,BufRead,BufNew,Syntax * highlight Agenda guibg=darkgreen guifg=white
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