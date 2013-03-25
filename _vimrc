if has('gui_running')

	set nocompatible
	filetype off
	  
	if has('vim_starting')
	  set runtimepath+=~/.bundle/neobundle.vim
	
	  call neobundle#rc(expand('~/.bundle'))
	endif
	
	NeoBundle 'git://github.com/Shougo/unite.vim.git'
	NeoBundle 'git://github.com/ujihisa/unite-colorscheme.git'
	NeoBundle 'git://github.com/sgur/unite-qf.git'

	NeoBundle 'git://github.com/Shougo/neocomplcache.git'
	NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
	NeoBundle 'git://github.com/vim-scripts/AutoClose.git'
	NeoBundle 'git://github.com/tpope/vim-surround.git'
	NeoBundle 'git://github.com/fuenor/qfixgrep.git'
	NeoBundle 'git://github.com/tpope/vim-rails.git'
	NeoBundle 'git://github.com/thinca/vim-qfreplace.git'
	NeoBundle 'git://github.com/pangloss/vim-javascript.git'
	NeoBundle 'git://github.com/jelera/vim-javascript-syntax.git'
	NeoBundle 'git://github.com/wookiehangover/jshint.vim.git'
	NeoBundle 'git://github.com/scrooloose/syntastic.git'
	NeoBundle 'git://github.com/kchmck/vim-coffee-script.git'
	NeoBundle 'git://github.com/Shougo/vimfiler.git'
	NeoBundle 'git://github.com/Shougo/vimproc.git'
	NeoBundle 'git://github.com/thinca/vim-quickrun.git'

	NeoBundle 'git://github.com/jpo/vim-railscasts-theme.git'
	NeoBundle 'git://github.com/altercation/vim-colors-solarized.git'
	NeoBundle 'git://github.com/matthewtodd/vim-twilight.git'
	NeoBundle 'git://github.com/tomasr/molokai.git'
	NeoBundle 'git://github.com/vim-scripts/Zenburn.git'
	NeoBundle 'git://github.com/yuroyoro/yuroyoro256.vim.git'
	NeoBundle 'git://github.com/mrkn/mrkn256.vim.git'
	NeoBundle 'git://github.com/nanotech/jellybeans.vim.git'
	NeoBundle 'git://github.com/vim-scripts/Colour-Sampler-Pack.git'
	NeoBundle 'git://github.com/tpope/vim-fugitive.git'
	NeoBundle 'git://github.com/w0ng/vim-hybrid.git'
	NeoBundle 'git://github.com/yoos/leap.vim.git'
	filetype plugin on
endif

" 行番号を表示
set number
" カレントディレクトリを自動で変更
set autochdir
" バックアップファイルを作成しない
set nobackup
" スワップファイルを作成しない
set noswapfile

" クリップボードを共有する
set clipboard=unnamed,autoselect

" タブ入力を半角スペースに変換
set expandtab
" タブを表示するときの幅
set tabstop=4
" タブを挿入するときの幅
set shiftwidth=4

au FileType javascript set ts=2 sw=2 expandtab
au FileType ruby set ts=2 sw=2 expandtab
au FileType php set ts=4 sw=4 noexpandtab

" JSHint
let g:JSHintHighlightErrorLine = 0

" NeoComplCache
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" 補完ウィンドウの設定
set completeopt=menuone

" VimFiler
" Edit file by default
let g:vimfiler_edit_action = 'tabopen'

" Don't use preview at QuickFix
let QFix_PreviewEnable = 0

" CoffeeScriptの自動コンパイル
autocmd BufWritePost *.coffee silent CoffeeMake! -cb | cwindow | redraw!

" キーマップ(矢印キー制限)
"inoremap <BS> <Nop>
inoremap <Right> <Nop>
"inoremap <Left> <Nop> " 追記：日本語入力時に誤動作する
inoremap <Up> <Nop>
inoremap <Down> <Nop>
nnoremap <Right> <Nop>
nnoremap <Left> <Nop>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap 0 :<C-u>call append(expand('.'), '')<Cr>

" キーマップ設定(NERD_Tree)
nmap <silent> <C-e> :VimFiler<CR>

" キーマップ設定(Unite)
nnoremap <silent> ,ub :<C-u>Unite buffer<CR> " Buffer list
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file " File list
nnoremap <silent> ,uc :<C-u>Unite colorscheme -auto-preview<CR>
nnoremap <silent> ,uq :<C-u>Unite qf<CR>

" キーマップ設定(Unite)
noremap <C-U><C-B> :Unite buffer<CR> " バッファ一覧
noremap <C-U><C-F> :UniteWithBufferDir -buffer-name=files file<CR> " ファイル一覧

"tabで補完候補の選択を行う
inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"

