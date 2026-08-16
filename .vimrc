noremap - $
nnoremap $ <nop>


" =============== 智能Tab配置 ===============
" 默认：4空格（C代码）
" Tab = 4空格设置
set tabstop=4           " Tab显示4空格宽度
set shiftwidth=4        " 自动缩进4空格
set expandtab           " Tab键输入空格，不是制表符
set softtabstop=4       " 编辑时Tab感觉像4空格

" 可选：额外设置
set autoindent          " 自动缩进
set smartindent         " 智能缩进
syntax on               " 语法高亮

" ========== Makefile特殊处理 ==========

autocmd FileType make setlocal noexpandtab tabstop=8 shiftwidth=8
autocmd BufRead,BufNewFile Makefile,makefile setlocal noexpandtab tabstop=8 shiftwidth=8

