" Vim 8.0 用 .vimrc

" エンコード設定
" ・デフォルト
" ・ファイルエンコード
" ・エコーディングを自動判別
" ・改行コード方式(dos,mac,unix)

set fileencodings=iso-2022-jp,euc-jp,utf-8,ucs-2,cp932,sjis
set fileformat=unix

" コマンド設定
" ・コマンド入力行を1行にする
" ・入力中コマンド表示
" ・コマンドライン補完

set cmdheight=1
set showcmd
set wildmenu

" 検索設定
" ・検索語強調表示
" ・ESCキー連打で強調表示をキャンセル
" ・検索時大文字小文字区別なし
" ・検索語大文字小文字混在時 大文字小文字区別あり
" ・ファイル終端まで検索したら先頭から検索しなおさない
" ・インクリメンタルサーチを有効にする

set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>
set ignorecase
set smartcase
set nowrapscan
set incsearch

" ステータス行に情報表示設定
" ・編集しているファイル名 (ファイルパス)
" ・ファイルエンコーディング/改行スタイル
" ・現在行数/ファイルの総行数

set statusline=%{expand('%:p:t')}\ %<\(%{SnipMid(expand('%:p:h'),80-len(expand('%:p:t')),'...')}\)%=\ encoding=%{&fileencoding}/%{&ff},\ [%l/%L]
function! SnipMid(str, len, mask)
    if a:len >= len(a:str)
        return a:str
    elseif a:len <= len(a:mask)
        return a:mask
    endif
    let len_tail = a:len - len(a:mask) - len_head
    return (len_head > 0 ? a:str[: len_head - 1] : '') . a:mask . (len_tail > 0 ? a:str[-len_tail :] : '')
endfunction

" 画面表示
" ・行番号表示
" ・ステータス行表示
" ・対応するカッコを表示
" ・特殊文字表示
" ・特殊文字表示設定
" ・カーソル行ハイライト有効
" ・カーソル列ハイライト有効
" ・ カーソルの行、列位置を表示

set number
set laststatus=2
set showmatch
set cursorline
set cursorcolumn
set showtabline=1
set ruler

set list
set listchars=tab:>-,extends:<

" 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする
set autoindent

" スマートインデントなし
set nosmartindent
set noundofile

" スワップファイルを生成しない
set noswapfile

" タブは半スペ4個
set tabstop=4

" Tabを視覚化
set list
set listchars=tab:>-,extends:<

" Backspaceの有効化
set backspace=indent,eol,start

" ----------------------------------------
" dein Scripts

if &compatible
  set nocompatible
endif

" dein path
let s:dein_dir = expand('~/.vim/')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" install dein.vim if not found
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/neosnippet')
  call dein#add('Shougo/neocomplcache')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/context_filetype.vim')
  call dein#add('tomasr/molokai')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" Enable neocomplcache
let g:neocomplete#enable_at_startup = 1

" カラースキーマ
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1
