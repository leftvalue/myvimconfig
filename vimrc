" Configuration file for vim
set nocompatible              " be iMproved, required
filetype on                 " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'Raimondi/delimitMate'
Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plugin 'suan/vim-instant-markdown'
Plugin 'prettier/vim-prettier', { 'do': 'npm install' }
Plugin 'hotoo/pangu.vim'
Plugin 'majutsushi/tagbar'
Plugin 'luochen1990/rainbow' "彩虹括号，多重括号容易分辨
Plugin 'Yggdroot/indentLine' 
Plugin 'kien/ctrlp.vim' "告别文件跳转
Plugin 'vim-scripts/DoxygenToolkit.vim' "注释生成
Plugin 'tpope/vim-surround'
Plugin 'gko/vim-coloresque'
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

let skip_defaults_vim=1
"set number 
set nu rnu
"高亮行
"set cursorcolumn
set cursorline
colorscheme neodark
syntax on

"--------------------------------------------------------------------------
"vim-airline
"--------------------------------------------------------------------------
let g:airline_theme="papercolor"

"这个是安装字体后 必须设置此项"
let g:airline_powerline_fonts = 1
"打开tabline功能,方便查看Buffer和切换，这个功能比较不错"
 "我还省去了minibufexpl插件，因为我习惯在1个Tab下用多个buffer"
 let g:airline#extensions#tabline#enabled = 1
 let g:airline#extensions#tabline#buffer_nr_show = 1
 "设置切换Buffer快捷键"
 nnoremap <C-N> :bn<CR>
 nnoremap <C-P> :bp<CR>

" markdown
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0
" macvim 字体
set guifont=Source\ Code\ Pro\ for\ Powerline
" 盘古自动中文格式调整
 autocmd BufWritePre *.markdown,*.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing()
" indentLine setting
let g:indentLine_char = '¦' 
let g:indentLine_enabled = 1
let g:indentLine_color_term = 239
map <C-i> :IndentLinesToggle<CR> 
" vim 注释
let g:DoxygenToolkit_authorName="linxi" 
" 剪切板
set clipboard=unnamed
" ctags 
let g:ctags_path='~/.vim/bundle/ctags.vim'
let g:ctags_statusline=1
let generate_tags=1
" taglist
"设置ctags路径
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
"启动vim后自动打开taglist窗口
let Tlist_Auto_Open = 1
"不同时显示多个文件的tag，仅显示一个
let Tlist_Show_One_File = 1
"taglist为最后一个窗口时，退出vim
let Tlist_Exit_OnlyWindow = 1
"taglist窗口显示在右侧，缺省为左侧
let Tlist_Use_Right_Window =1
"设置taglist窗口大小
"let Tlist_WinHeight = 100
let Tlist_WinWidth = 40
"设置taglist打开关闭的快捷键F8
noremap <F8> :TlistToggle<CR>
"更新ctags标签文件快捷键设置
noremap <F6> :!ctags -R<CR>

 " 在 vim 启动的时候默认开启 NERDTree（autocmd 可以缩写为 au）
autocmd VimEnter * NERDTree
" 当打开 NERDTree 窗口时，自动显示 Bookmarks
let NERDTreeShowBookmarks=1
" nerdtree 打开后光标移到编辑区
wincmd w
autocmd VimEnter * wincmd w
" 搜索优化
set hlsearch
set incsearch
let g:rainbow_active = 1
