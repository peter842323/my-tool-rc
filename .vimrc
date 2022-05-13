set mouse=a
set colorcolumn=80
highlight ColorColumn ctermbg=10 guibg=Green
highlight LineNr cterm=bold ctermfg=DarkGrey ctermbg=NONE
highlight CursorLineNr cterm=bold ctermfg=10 ctermbg=NONE
set t_Co=256
set laststatus=2 	" 總是顯示狀態列
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%] "顯示檔名：總行數，總的字元數
syntax on
set nu
set cursorline		" 光標底線：光標所在的那一行會有底線，幫助尋找光標位置
"set tabstop=4   	" 縮排間隔數 ( 預設為 8 個空白對齊 )
"set shiftwidth=4	" 自動縮排對齊間隔數：向右或向左一個縮排的寬度
"set relativenumber
set wrap
"set ruler 			" 在編輯過程中，在右下角顯示游標位置的狀態行
set showcmd
set showmatch
set tags=./tags,./TAGS,tags;~,TAGS;~
set ignorecase
"改變ttymosue讓滑鼠可以拖曳window layout
if has("mouse_sgr")
	set ttymouse=sgr
else
	set ttymouse=xterm2
endif
"set paste
" 支持在Visual模式下，通过C-y复制到系统剪切板
"vnoremap <C-y> "+y
" 支持在normal模式下，通过C-p粘贴系统剪切板
"nnoremap <C-p> "*p
":inoremap ( ()<Esc>i
":inoremap " ""<Esc>i
":inoremap ' ''<Esc>i
":inoremap [ []<Esc>i
":inoremap {<CR> {<CR>}<Esc>ko
":inoremap {{ {}<ESC>i
set clipboard+=unnamed "和系统共用剪贴板

"讓backspace不會變成^?、DEL不會變成^h
noremap! <C-?> <C-h>

" 關閉vim時自動刷新畫面
"au VimLeave * :!clear

" for cscope
set cscopetag
set csto=0

if filereadable("cscope.out")
	cs add cscope.out
elseif $CSCOPE_DB != ""
	cs add $CSCOPE_DB
endif
set cscopeverbose

nmap zs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap zg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap zc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap zt :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap ze :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap zf :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap zi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap zd :cs find d <C-R>=expand("<cword>")<CR><CR>
" end for cscope

nmap <F7> :TrinityToggleAll

call plug#begin('~/.vim/plugged')
" for taglist
Plug 'vim-scripts/taglist.vim'
nmap <F8> :TlistToggle<CR><CR>
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
set ut=100
" end for taglist

" for SrcExpl
Plug 'wenlongche/SrcExpl'
nmap <F10> :SrcExplToggle<CR>
let g:SrcExpl_pluginList = [
    \ "__Tag_List__",
    \ "_NERD_tree_",
    \ "Source_Explorer"
    \ ]
" end for SrcExpl

Plug 'junegunn/vim-easy-align'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Initialize plugin system
Plug 'preservim/nerdtree'
nmap <F9> :NERDTreeFind<CR><CR>
let NERDTreeWinPos=1

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
Plug 'sgur/vim-textobj-parameter'

Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'Yggdroot/indentLine'
let g:indent_guides_guide_size            = 1  " 指定對齊線的尺寸
let g:indent_guides_start_level           = 2  " 從第二層開始可視化顯示縮進

Plug 'honza/vim-snippets'

Plug 'haya14busa/incsearch.vim'
set hlsearch
set incsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

call plug#end()
