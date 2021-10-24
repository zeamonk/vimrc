" 设置编码
" set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
" set termencoding=utf-8
set encoding=utf-8
if &compatible
  set nocompatible               " Be iMproved
endif

filetype plugin indent on
syntax enable

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" 按键记忆辅助
Plug 'liuchengxu/vim-which-key'
" vim 配色
Plug 'tyrannicaltoucan/vim-quantum'
" 彩虹括号
Plug 'frazrepo/vim-rainbow'
" 自动补全括号
Plug 'jiangmiao/auto-pairs'
" 轻量级补全
Plug 'jayli/vim-easycomplete'
" 高效操作配对符号
Plug 'tpope/vim-surround'
" 快速注释插件
Plug 'preservim/nerdcommenter'
" 树形目录
Plug 'preservim/nerdtree'
" 缩进指示线
Plug 'Yggdroot/indentLine'
" 代码片段引擎
"Plug 'SirVer/ultisnips'
" 代码片段
"Plug 'honza/vim-snippets'
" 安装 fzf
Plug 'junegunn/fzf', {'do':{->fzf#install()}}
Plug 'junegunn/fzf.vim'
" 异步语法检查插件
Plug 'dense-analysis/ale'
" 异步执行 shell
Plug 'skywind3000/asyncrun.vim'
" vim 中文文档
Plug 'yianwillis/vimcdoc'
" Initialize plugin system
call plug#end()

" 主题设置
set background=dark
set termguicolors
colorscheme quantum

" 下一行缩进自动与上一行保持一致
set autoindent
" 1 个 Tab 转为 4 个空格
set tabstop=4
set softtabstop=4
" 将 Tab 自动转换为空格
set expandtab
" 为缩进和对齐开启 Tab 与空格的智能化转换
set smarttab
" 设置每一级缩进的字符数，>>\<<\==
set shiftwidth=4

" 在底部显示当前处于命令模式还是插入模式
set showmode
" 命令模式下显示当前键入的指令
set showcmd
" 支持使用鼠标
set mouse=a
" 使用 utf-8 编码
set encoding=utf-8
" 使用 256 色
set t_Co=256

" 设置显示行号
set number
" 高亮当前行
set cursorline
" 高亮当前列
set cursorcolumn
" 设置行宽，即每行显示多少个字符
set textwidth=80
" 自动换行
set wrap
" 只有遇到指定的符号才开启折行
set linebreak
" 折行处与右边缘之间空出的字符数
set wrapmargin=2
" 垂直滚动时，光标距离顶部/底部的位置
set scrolloff=5
" 是否显示状态栏。0 表示不显示，1 表示只在多窗口显示，2 表示显示
set laststatus=2
" 在状态栏显示光标位于哪一行哪一列
set ruler

" 自动高亮匹配光标中的括号
set showmatch
" 高亮显示搜索结果
set hlsearch
" 搜索时，实时跳到匹配的结果
set incsearch
" 搜索时忽略大小写
set ignorecase
" 搜索时智能匹配大小写，可以与 ignorecase 同时开启
set smartcase

" 不创建备份文件
set nobackup
" 不创建交换文件
set noswapfile
" 自动切换工作目录
set autochdir
" 出错不要发出响声，而是屏幕闪烁
set noerrorbells
set visualbell
" 记住 1000 次历史操作
set history=1000
" 打开文件监视，如果在编辑过程中文件发生外部改变，就会发出提示
set autoread
" 如果行尾有多余的空格（包括 Tab），该配置让这些空格显示为可见的小方块
set listchars=tab:»■,trail:■
set list
" 命令模式下，底部操作指令按下 Tab 键自动补全
set wildmenu
set wildmode=longest:list,full
" 共享系统剪贴板
set clipboard=unnamedplus
" 基于缩进进行代码折叠
set foldmethod=indent
" 默认关闭折叠
set nofoldenable
" 检测到文件修改后自动重新加载
set autoread

let mapleader = "\<space>"

" 设置超时时间为 500ns
set timeoutlen=500

" vim-which-key 的最小配置
let g:mapleader = "\<space>"
let g:maplocalleader = ","

" 始终启用彩虹括号
let g:rainbow_active = 1
" 指定文件类型启动彩虹括号
" au FileType c,cpp,objc,objcpp call rainbow#load()

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :WhichKey ','<CR>

inoremap jk <ESC>
nnoremap <leader>qq :q<CR>
nnoremap <leader>fs :wall<CR>

" 取消撤销操作
nnoremap U <C-r>

" 窗口相关操作
" 水平分割窗口
nnoremap <leader>ws :split<CR>
" 垂直分割窗口
nnoremap <leader>wv :vsplit<CR>
" 关闭其他所有窗口
nnoremap <leader>wm :only<CR>
" 移动到上下左右四个方向的窗口中
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wh <C-w>h
nnoremap <leader>wl <C-w>l
" 增加/减少窗口所占的屏幕高度
nnoremap <leader>w+ <C-w>+
nnoremap <leader>w- <C-w>-
" 平均分布窗口大小
nnoremap <leader>w= <C-w>=

" vim-plug 相关命令
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pc :PlugClean<CR>
nnoremap <leader>pU :PlugUpgrade<CR>
nnoremap <leader>pu :PlugUpdate<CR>

" 文件相关命令

" 检索当前目录下文件
nnoremap <leader><SPACE> :
" 打开配置文件
nnoremap <leader>fp :e<SPACE>~/.vimrc<CR>
" 以 root 权限保存文件
nnoremap <leader>fS :write !sudo tee % > /dev/null<CR>
" 打开文件目录树
nnoremap <leader>ft :NERDTreeToggle<CR>
" 刷新配置文件
nnoremap <leader>fr :source<SPACE>$MYVIMRC<CR>
" 缓冲区相关命令(借助 CtrlP 插件)
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>bj :bn<CR>
nnoremap <leader>bk :bp<CR>
nnoremap <leader>br :source<SPACE>%<CR>

" 将搜索到的内容显示到屏幕中间行
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" 避免增加缩进后丢失选择的文本
vnoremap < <gv
vnoremap > >gv

nnoremap j gj
nnoremap k gk
nnoremap H ^
nnoremap L $

cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

nnoremap <leader>nh :nohl<CR>
