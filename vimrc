"necessary on some Linux distros for pathogen to properly load bundles
filetype off

"load pathogen managed plugins
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" 载入文件类型插件
filetype plugin indent on 
" 为特定文件类型载入相关缩进文件
filetype indent on 

" 代码折叠可以只以缩进为依据：
" autocmd FileType python setlocal foldmethod=indent
autocmd FileType python setlocal et sta sw=4 sts=4  omnifunc=pysmell"4个空格替代TAB

imap <F6> <C-X><C-O>  “把缺省的Ctrl – X + O 改为 F6

" colorscheme railscasts
" colorscheme solarized
colorscheme wombat256
" colorscheme fruidle
" colorscheme gemcolors 
" colorscheme night
" colorscheme twilight
" colorscheme blackboard

" 忽略
set wildignore=*.swp,*.bak,*.pyc,*.class

"语法样式开启
syntax on
"设置字体大小
"set guifont=Monaco\ Powerline:h14
set guifont=Consolas:h10:cDEFAULT
"set guifont=Fixedsys:h10:cDEFAULT
"set guifont=Bitstream\ Vera\ Sans\ Mono\ for\ Powerline:h14

"当使用了图形界面，并且环境变量 LANG 中不含“.”（即没有规定编码）时，把 Vim 的内部编码设为 UTF-8
set encoding=utf-8

set ffs=unix,dos,mac
set fenc=utf-8
set fencs=utf-8,ucs-bom,euc-jp,gb18030,gbk,gb2312,cp936,GB18030,ucs-bom,default,latin1

" Status Line
set laststatus=2
"set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l/%L:%c:
set statusline=\ \%F\ %m%r%h%w\ \ %y\ [%{&ff}]\ [%{&fileencoding}]\ [tw:%{&tw}]\ [%p%%]\ [%l/%L]\ [%c]

"set statusline=%f\ [%{&fenc}\ %{&ff}]\ [%Y]\ [\%03.3b\ \%02.2B]\ [%02v\ %03l\ %L\ %p%%]  
"Git
"set statusline+=[%{GitBranch()}]

"设置缩进
set sw=2
set ts=2
set softtabstop=2
set expandtab
" history文件中需要记录的行数
set history=1000 
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,- 
" 高亮显示普通txt文件（需要txt.vim脚本）
au BufRead,BufNewFile *  setfiletype txt 
"不需要保持和 vi 非常兼容
set nocompatible
"执行 Vim 缺省提供的 .vimrc 文件的示例，包含了打开语法加亮显示等最常用的功能
"source $VIMRUNTIME/vimrc_example.vim
" 使backspace正常处理indent, eol, start等
set backspace=indent,eol,start whichwrap+=<,>,[,]
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l 
"在输入命令时列出匹配项目，也就是截图底部的效果
set wildmenu
"打开自动缩,继承前一行的缩进注释 进
set autoindent
"默认情况下手动折叠
set foldmethod=manual
"默认展开所有代码
set foldlevel=99

"显示行号（否：nonumber）
" relativenumber,相对行号
set number
"显示光标的坐标
set ruler
"不自动换行(否：wrap)
set nowrap
"缺省不产生备份文件
set nobackup
" 不要生成swap文件
set noswapfile
"set bufhidden=hide
"在输入括号时光标会短暂地跳到与之相匹配的括号处，不影响输入
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 搜索时不区分大小写
set ignorecase
" 在搜索时，输入的词句的逐字符高亮（类似firefox的搜索）
set incsearch
" 搜索高亮
set hlsearch
" 不要闪烁
set novisualbell 
"正确地处理中文字符的折行和拼接
set formatoptions+=mM
"文件 UTF-8 编码
set fileencodings=utf-8
"设置文件格式为unix
set fileformat=unix
"开启命令显示
set showcmd
"设置窗口大小
set lines=35
set columns=120
" 启动的时候不显示那个援助索马里儿童的提示
set shortmess=atI 
" 导出 html 设置
let html_use_css = 1
let html_number_lines = 0
let use_xhtml = 1

"隐藏底部滚动条
set guioptions-=b
"隐藏右边滚动条
set guioptions-=R
set guioptions-=r
"隐藏左边滚动条
set guioptions-=l
set guioptions-=L
"隐藏菜单栏
set guioptions-=m
"隐藏工具栏
set guioptions-=T

"设置Ctrl+F12呼出菜单栏
function! ToggleMenuBar()
	echo "ToggleMenuBar"
	if &guioptions =~# 'm'
		set guioptions-=m
	else
		set guioptions+=m
	endif
endfunction
imap <silent> <C-F12> <C-O>:call ToggleMenuBar()<CR>
map <silent> <C-F12> :call ToggleMenuBar()<CR>

"设置工作目录
function! CHANGE_CURR_DIR()
let _dir = expand("%:p:h")
exec "cd " . _dir
unlet _dir
endfunction
autocmd BufEnter * call CHANGE_CURR_DIR()

" NERDTree插件的快捷键
imap <silent> <F7> <esc>:NERDTreeToggle<CR>
nmap <silent> <F7> :NERDTreeToggle<CR>
" BufExplorer 快捷键 {{{
imap <silent> <F8> <esc>:BufExplorer<CR>
nmap <silent> <F8> :BufExplorer<CR>
" }}}

"CTRL-[ and CTRL-] indent and unindent blocks {{{
"  inoremap <C-[> <C-O><LT><LT>
" inoremap <C-]> <C-O><GT><GT>
"  nnoremap <C-[> <LT><LT>
"  nnoremap <C-]> <GT><GT>
"  vnoremap <C-[> <LT>
"  vnoremap <C-]> <GT>
"}}}

" NERD Commenter {{{
let NERDSpaceDelims = 1
map <M-/> <Plug>NERDCommenterToggle
imap <M-/> <C-O><Plug>NERDCommenterToggle
" }}}

" 窗口区域切换,Ctrl+↑↓←→  来切换
imap <silent> <C-left> <esc><C-W><left>
vmap <silent> <C-left> <esc><C-W><left>
nmap <silent> <C-left> <C-W><left>
imap <silent> <C-right> <esc><C-W><right>
vmap <silent> <C-right> <esc><C-W><right>
nmap <silent> <C-right> <C-W><right>
imap <silent> <C-up> <esc><C-W><up>
vmap <silent> <C-up> <esc><C-W><up>
nmap <silent> <C-up> <C-W><up>
imap <silent> <C-down> <esc><C-W><down>
vmap <silent> <C-down> <esc><C-W><down>
nmap <silent> <C-down> <C-W><down>

" ctrl + c,a,v,x,z
nnoremap <BS> d
" ctrl + a
noremap <C-A> ggVG
inoremap <C-A> <C-O>ggVG

imap <C-s> <esc>:w<CR>:echo expand("%f") . " saved."<CR>
vmap <C-s> <esc>:w<CR>:echo expand("%f") . " saved."<CR>
nmap <C-s> :w<CR>:echo expand("%f") . " saved."<CR>

" ctrl + n
imap <C-n> <esc>:enew!<CR>
nmap <C-n> :enew!<CR>
vmap <C-n> <esc>:enew!<CR>
" ctrl + c
vmap <C-c> "+y
" ctrl + x
vmap <C-x> "+x
" ctrl + z
inoremap <C-z> <C-O>u
nnoremap <C-z> u
" ctrl + y
inoremap <C-y> <C-O><C-R>
nnoremap <C-y> <C-R>
" ctrl + v
" 原有 c + v 为列模式,现在用 c+q
nnoremap <C-v> "+gP
inoremap <C-v> <C-O>"+gP

" 以下设置与supertab 有冲突
"" ctrl + f
"imap <C-f> <esc>:/
"nmap <C-f> :/
"" ctrl + r
"imap <C-r> <esc>:%s/
"vmap <C-r> <esc>:%s/
"nmap <C-r> :%s/
"" ctrl + o
"imap <C-o> <C-O>:e
"vmap <C-o> <esc>:e
"nmap <C-o> :e 
""}}}

let g:acp_enableAtStartup = 1
" 自动完成设置 禁止在插入模式移动的时候出现 Complete 提示
let g:acp_mappingDriven = 1
let g:acp_ignorecaseOption = 0
" 自动完成设置为 Ctrl + p 弹出
let g:acp_behaviorKeywordCommand = "\<C-p>"
let g:acp_completeoptPreview = 0

" 
"fix grep
:let Grep_Find_Use_Xargs = 0
":let Grep_Default_Filelist = '*.rb'

"keymapping
nmap <F11> 1G=G
imap <F11> <ESC>1G=Ga
map <C-u> :FufFile **/<CR>
map <C-e> :MRU<CR>

"visual search mappings
function! s:VSetSearch()
    let temp = @@
    norm! gvy
    let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>

"jump to last cursor position when opening a file
"dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    end
endfunction

"define :HighlightLongLines command to highlight the offending parts of
"lines that are longer than the specified length (defaulting to 80)
command! -nargs=? HighlightLongLines call s:HighlightLongLines('<args>')
function! s:HighlightLongLines(width)
    let targetWidth = a:width != '' ? a:width : 79
    if targetWidth > 0
        exec 'match Todo /\%>' . (targetWidth) . 'v/'
    else
        echomsg "Usage: HighlightLongLines [natural number]"
    endif
endfunction

let ScreenShot = {'Icon':0, 'Credits':0, 'force_background':'#FFFFFF'} 

" Taglist variables
" Display function name in status bar:
let g:ctags_statusline=1

" Automatically start script
let generate_tags=1

" Displays taglist results in a vertical window:
let Tlist_Use_Horiz_Window=0

" Shorter commands to toggle Taglist display
nnoremap TT :TlistToggle
map <F4> :TlistToggle<cr>

" Various Taglist diplay config:
let Tlist_Use_Left_Window = 1
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_File_Fold_Auto_Close = 1

" FuzzyFinder 
map ff <esc>:FufFile<cr>
map fcd <esc>:FufDir<cr>
map fb <esc>:FufBookmarkFile<cr>
map fu <esc>:FufBuffer<cr>
map fl <esc>:FufLine<cr>

" gradle
au BufNewFile,BufRead *.gradle setf groovy

" cntrl+n for completion
" inoremap <Nul> <C-n>

" show tab
" set list
" set listchars=tab:>-,trail:-

" ack
" let g:ackprg="ack-grep -H --nocolor --nogroup --column"  
" nnoremap <leader>s :Ack

"vmap <F2> <C-C>:Ack "/b<C-V>/b"<CR>
"vmap <M-F2> <C-C>:Ack "/b<C-V>/b" 
"vmap <F3> <C-C>/<C-V><CR>
"nmap <F3> n

" python
" source ~/vimfiles/python
" 让它不要在每次保存Python文件的时候都检查，而是用“:Pylint”指令来调用。
" let g:pylint_onwrite = 0

" 设置leader建，默认是 /
let mapleader = ","

map <F12> :call FormartSrc()<CR> 

"定义FormartSrc() 
func FormartSrc() 
exec "w" 
if &filetype == 'c' 
exec "!astyle --style=ansi --one-line=keep-statements -a --suffix=none %" 
elseif &filetype == 'cpp' || &filetype == 'hpp' 
exec "r !astyle --style=ansi --one-line=keep-statements -a --suffix=none %> /dev/null 2>&1" 
elseif &filetype == 'perl' 
exec "!astyle --style=gnu --suffix=none %" 
elseif &filetype == 'py'||&filetype == 'python' 
exec "r !pydent % > /dev/null 2>&1" 
elseif &filetype == 'java' 
exec "!astyle --style=java --suffix=none %" 
elseif &filetype == 'jsp' 
exec "!astyle --style=gnu --suffix=none %" 
elseif &filetype == 'xml' 
exec "!astyle --style=gnu --suffix=none %" 
elseif &filetype == 'html' 
exec "!astyle --style=gnu --suffix=none %" 
elseif &filetype == 'htm' 
exec "!astyle --style=gnu --suffix=none %" 
endif 
exec "e! %" 
endfunc 
"结束定义FormartSrc

"dbext连接设置
"---------------------------------------------------------------------
" let g:dbext_default_profile_usual = 'type=ASA:user=DBA:passwd=SQL'
" let g:dbext_default_profile_ORA   = 'type=ORA:user=fauser@ora920:passwd=fauser'
"如果想dbext用一个专门的连接给每个新的缓冲，可以用以下命令：
" let g:dbext_default_profile = 'usual'

"解决snippet与supertab冲突
let g:SuperTabMappingForward="<tab>"

" python-mode
" Disable pylint checking every save
let g:pymode_lint_write = 0

" Set key 'R' for run python code
let g:pymode_run_key = 'R'

let python_highlight_all = 1

" 高亮显示标尺
set cc=80
"按下,ch 就可以将当前光标下的列高亮，再按下一次，取消高亮；并且可以同时多列高亮。
map ,ch :call SetColorColumn()<CR>
function! SetColorColumn()
    let col_num = virtcol(".")
    let cc_list = split(&cc, ',')
    if count(cc_list, string(col_num)) <= 0
        execute "set cc+=".col_num
    else
        execute "set cc-=".col_num
    endif
endfunction
