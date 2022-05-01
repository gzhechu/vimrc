"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 更新时间：2022-05-01
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 定义快捷键的前缀，即 <Leader>
let mapleader=";"

" >>
" 文件类型侦测
" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
" <<

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vundle 会接管 .vim/ 下的所有原生目录，所以先清空该目录，再通过如下命令安装 vundle：
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" 然后 :PluginInstall 安装插件
" vundle 环境设置
" set nocompatible                " 去除VI一致性,必须
filetype off                    " 必须
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
" 让vundle管理插件版本,必须
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'       " 颜色主题
Plugin 'tomasr/molokai'                         " 颜色主题
Plugin 'vim-scripts/phd'                        " 颜色主题
Plugin 'Lokaltog/vim-powerline'                 " 状态栏
Plugin 'octol/vim-cpp-enhanced-highlight'       " C++ 语法 高亮
Plugin 'nathanaelkane/vim-indent-guides'        " 缩进关系关联
Plugin 'derekwyatt/vim-fswitch'                 " C++ 头文件源文件切换
Plugin 'kshenoy/vim-signature'                  " 收藏夹 :echo has('signs')
Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines' " 书签行高亮 
Plugin 'majutsushi/tagbar'                      " 基于标签的标识符列表
Plugin 'dyng/ctrlsf.vim'                        " 带上下文的查找，区别 grep
Plugin 'terryma/vim-multiple-cursors'           " 同时选中多个项目
Plugin 'scrooloose/nerdcommenter'               " 文本块注释代码
Plugin 'vim-scripts/DrawIt'
Plugin 'scrooloose/nerdtree'                    " 工程文件管理
Plugin 'fholgado/minibufexpl.vim'               " BUFFER 多文档编辑
Plugin 'gcmt/wildfire.vim'                      " 选中结对符内的文本
"Plugin 'sjl/gundo.vim'                         " 多路分支 undo
"Plugin 'Lokaltog/vim-easymotion'               " 快速移动 
"Plugin 'suan/vim-instant-markdown'             " 编辑 markdown
Plugin 'lilydjwg/fcitx.vim'
" 你的所有插件需要在下面这行之前
call vundle#end()               " 必须
filetype plugin indent on       " 必须 加载vim自带和插件相应的语法和文件类型相关脚本


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 配色方案，载入上面插件中的配色
set background=dark
"colorscheme torte
"colorscheme desert
"colorscheme solarized
"colorscheme molokai
colorscheme phd

" >>
" 辅助信息
" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
set cursorcolumn
" 高亮显示搜索结果
set hlsearch
" <<

" 设置 gvim 显示字体
"set guifont=DejaVu\ Sans\ Mono\ Book\ 13
set guifont=Hack\ 13

" 禁止折行
set nowrap

" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码缩进
" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 将相同缩进的代码关联起来
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码折叠
" vim 自身支持多种折叠：手动建立折叠（manual）、基于缩进进行折叠（indent）、
"                    基于语法进行折叠（syntax）、未更改文本构成折叠（diff）
" 操作：za，打开或关闭当前折叠；zM，关闭所有折叠；zR，打开所有折叠。
" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

" *.cpp 和 *.h 间切换
nmap <silent> <Leader>sw :FSHere<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctags -R --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+liaS --extra=+q --language-force=c++

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 基于标签的标识符列表 tagbar 
" 设置 tagbar 子窗口的位置出现在主编辑区的左边 
let tagbar_left=1 
" 设置显示／隐藏标签列表子窗口的快捷键。速记：identifier list by tag
nnoremap <Leader>ilt :TagbarToggle<CR> 
" 设置标签子窗口的宽度 
let tagbar_width=32 
" tagbar 子窗口中不显示冗余帮助信息 
let g:tagbar_compact=1
" 设置 ctags 对哪些代码标识符生成标签
let g:tagbar_type_cpp = {
    \ 'kinds' : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0', 
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }

" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
nnoremap <Leader>sp :CtrlSF<CR>

" 正向遍历同名标签
nmap <Leader>tn :tnext<CR>
" 反向遍历同名标签
nmap <Leader>tp :tprevious<CR>

" 代码块注释 常用操作：
" cc，注释当前选中文本
" cu，取消选中文本块的注释

" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
nnoremap <leader>nt :NERDTreeFocus<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="right"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
" 常用操作：回车，打开选中文件；r，刷新工程目录文件列表；I（大写），显示/隐藏隐藏文件；m，出现创建/删除/剪切/拷贝操作列表。

" 显示/隐藏 MiniBufExplorer 窗口
map <Leader>bl :MBEToggle<cr>
" buffer 切换快捷键,  ctrl-tab 正向遍历 ctro-shift-tab 反向遍历
map <C-Tab> :MBEbn<cr> 
map <C-S-Tab> :MBEbp<cr> 

" 结对符内文本快捷键
map <SPACE> <Plug>(wildfire-fuel)
vmap <S-SPACE> <Plug>(wildfire-water)
" 适用于哪些结对符
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "i>", "ip"]


