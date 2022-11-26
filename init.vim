set synmaxcol=1000  " 搜索语法项目的最大列数。长行里超过此列数的文本不再高亮，后续行也不一定 能正确高亮。因为语法状态被清除。 有助于避免单个长行的 XML 文件的重画非常缓慢的问题。
set ttyfast  " u got a fast terminal
set lazyredraw " to avoid scrolling problems

set encoding=UTF-8
set clipboard=unnamed
" for paste mode toggle
set pastetoggle=<F2>
map <F4> :%retab! <CR> :w <CR>

"for mac os crontab
autocmd filetype crontab setlocal nobackup nowritebackup
map <M-s> :w<kEnter>  "Works in normal mode, must press Esc first"
imap <M-s> <Esc>:w<kEnter>i "Works in insert mode, saves and puts back in insert mode"
autocmd BufWritePre * :%s/\s\+$//ge

"set list listchars=eol:¬,tab:▸\ ,trail:.,
" keep 3 lines when scrolling"
set scrolloff=3
set shiftround

" NOTE: you must create ~/.vim/undo first
set undofile
set undodir=~/.vim/undo
set undolevels=1000

set guifont=Monaco:h16
set guifont=Monaco\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11
set backupdir=~/.vim/backup
set cursorline

set tags=tags
set noautochdir    " 注意这个自动切换目录会使rope找目录不正确，禁用，坑死我
autocmd BufRead,BufNewFile *.py set et ts=4 sw=4 sts=4
set tabstop=2
set expandtab
set softtabstop=2
set shiftwidth=2
set nu
autocmd BufRead,BufNewFile *.py set et ts=4 sw=4 sts=4
set background=dark

" 配置多语言环境
if has("multi_byte")
    " UTF-8 编码
    set encoding=utf-8
    set termencoding=utf-8
    set formatoptions+=mM
    set fencs=utf-8,gbk
endif


set splitright
set nocompatible
set completeopt=longest,menu
set history=1000
set showmatch
set ruler
set incsearch
set hlsearch
set title
"set foldenable         "折叠
"set foldmethod=indent  "折叠
set foldcolumn=0
set foldopen=all
set formatoptions=tcqr

" 还不知道有什么用
"nnoremap gc :!gcc -Wall -g -o %:r %<cr>
"nnoremap gp :!g++ -Wall -g -o %:r %<cr>
" nnoremap py :!python %<cr>
" nnoremap pt :!py.test %<cr>
" nnoremap no :!node %<cr>
" nnoremap gd :!sudo gdb %:r<cr>
" nnoremap ma :!make<cr>

call plug#begin()

" 美化
Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-startify'
Plug 'w0ng/vim-hybrid'
" Plug 'morhetz/gruvbox'
" Plug 'sainnhe/gruvbox-material'
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'ryanoasis/vim-devicons'

" 编码
Plug 'Chiel92/vim-autoformat' " https://github.com/Chiel92/vim-autoformat for code formatter
Plug 'othree/html5.vim'   "html5
Plug 'mattn/emmet-vim'    "html5
Plug 'alvan/vim-closetag'
"Plug 'python-mode/python-mode'
"Plug 'heavenshell/vim-pydocstring'  "py 注释文档
Plug 'tpope/vim-commentary'

" coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" 便捷
Plug 'tpope/tpope-vim-abolish'  "切换命名格式
Plug 'ntpeters/vim-better-whitespace'   "清除空格    :StripWhitespace
Plug 'tpope/vim-repeat'  "重复提示插件  使用 .
Plug 'mileszs/ack.vim'   "全局搜索 整个文件夹
Plug 'rking/ag.vim'      "同 ack.vim
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'    " 快速移动插件, ',,w'可以在单词上出现前缀，然后快速跳转
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/BufOnly.vim'  "关闭缓冲区  :BufOnly
Plug 'jiangmiao/auto-pairs'  "补全或者删除括号
Plug 'tpope/vim-surround'    "
Plug 'farmergreg/vim-lastplace'  "打开上次编辑位置
Plug 'mbbill/undotree'       "撤销树
" Plug 'scrooloose/nerdcommenter'   "添加撤销注释
Plug 'preservim/nerdcommenter'
let g:NERDSpaceDelims = 1

" 增强 ? / 搜索
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'brooth/far.vim'

" 提示高亮
Plug 'jaxbot/semantic-highlight.vim' "语义高亮
Plug 'lfv89/vim-interestingwords'    "感兴趣的单词高亮
Plug 'terryma/vim-multiple-cursors'  "vim 多个光标
Plug 'kien/rainbow_parentheses.vim'  "高亮括号

Plug 'elzr/vim-json'

" vue
Plug 'posva/vim-vue'
Plug 'sekel/vim-vue-syntastic'

" javascript and react
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'jelera/vim-javascript-syntax'
Plug 'w0rp/ale'
Plug 'prettier/vim-prettier', {'do': 'npm install -g prettier'}
Plug 'Quramy/tsuquyomi'
Plug 'groenewege/vim-less'
Plug 'tasn/vim-tsx'

Plug 'glench/vim-jinja2-syntax'
Plug 'moll/vim-node'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'cakebaker/scss-syntax.vim'

" 代码片段模板补全
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'  "查看git提交
Plug 'airblade/vim-gitgutter'

" Plug 'MattesGroeger/vim-bookmarks'

" 不知道
Plug 'tpope/vim-dispatch'
"Plug 'fatih/vim-go'

" 待定
"Plug 'tpope/vim-sensible'
"Plug 'jszakmeister/vim-togglecursor'  "vim 切换光标
"Plug 'vim-scripts/LargeFile'  "编辑大文件？？？
"Plug 'rykka/riv.vim'    " rst  笔记？
"Plug 'Rykka/InstantRst', { 'do': 'pip install https://github.com/Rykka/instant-rst.py/archive/master.zip'}
"Plug 'kchmck/vim-coffee-script'  "CoffeeScript支持添加到vim。它涵盖了语法，缩进，编译等等
"Plug 'tpope/vim-eunuch' "文件操作？？？
"Plug 'solarnz/thrift.vim'
"Plug 'jmcantrell/vim-virtualenv'  "虚拟环境
"Plug 'xolox/vim-misc'

" markdown 相关
"Plug 'godlygeek/tabular'   "对齐表格
"Plug 'plasticboy/vim-markdown'
"Plug 'iamcco/mathjax-support-for-mkdp'
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

"Plug 'sukima/xmledit' " 编写 xml 插件

"Plug 'Valloric/ListToggle'

" 模糊搜索，使用z/支持模糊搜索
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)

call plug#end()



" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.

let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'

let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''

let g:closetag_close_shortcut = '<leader>>'

" brew install vim --with-python3
" nmap <silent> <C-d> <Plug>(pydocstring)
" nnoremap py :!python %<cr>
" pymode
"let g:pymode_python = 'python3'  " Values are `python`, `python3`, `disable`.
"let g:pymode_paths = reverse(split(globpath(getcwd().'/eggs', '*'), '\n'))    " support zc.buildout
"let g:pymode_trim_whitespaces = 1
"let g:pymode_quickfix_maxheight = 3
"let g:pymode_indent = 1
"let g:pymode_folding = 1
"let g:pymode_breakpoint = 1
"let g:pymode_breakpoint_bind = "<C-k>"
"let g:pymode_breakpoint_cmd = 'import ipdb; ipdb.set_trace()  # BREAKPOINT TODO REMOVE; from nose.tools import set_trace; set_trace()'


"let g:pymode_run = 1
"let g:pymode_run_bind = "<C-e>"
""let g:pymode_run_bind = '<leader>r'
"let g:pymode_virtualenv = 1

"" Override view python doc key shortcut to Ctrl-Shift-d
"let g:pymode_doc=1
"let g:pymode_doc_bind = 'K'

"autocmd CompleteDone * pclose
"" python-mode conflict with jedi
"let g:pymode_rope = 0
"let g:pymode_rope_autoimport = 0
"let g:pymode_rope_lookup_project = 0
"let g:pymode_rope_goto_definition_bind = "<C-j>"
"let g:pymode_rope_goto_definition_cmd = 'vnew'
"let g:pymode_rope_regenerate_on_write = 0
"command! PR PymodeRopeRegenerate
"autocmd FileType python noremap <leader>p :Autoformat<cr>

"let g:pymode_lint = 1
"let g:pymode_lint_on_write = 1
"let g:pymode_lint_on_fly = 0
"let g:pymode_lint_message = 1
"let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe', 'pylint']
"" http://stackoverflow.com/questions/16021297/how-to-map-alias-a-command-in-vim, PymodeLint映射成PL
"command! PL PymodeLint
"command! F PymodeLintAuto    " auto pep8 fix
"let g:pymode_lint_ignore = "C0111, W0105, C0325"
"let g:pymode_lint_signs = 1
"let g:pymode_lint_todo_symbol = '😡'
"" let g:pymode_lint_error_symbol = '❌'
"" let g:pymode_lint_comment_symbol = '😢'
"let g:pymode_lint_error_symbol = "\U2717"
"let g:pymode_lint_comment_symbol = "\u2757"
"let g:pymode_lint_visual_symbol = "\u0021"

" 修改默认的红线为浅色，solorized黑色主题
" highlight ColorColumn ctermbg=233
" let g:pymode_lint_cwindow = 0
" let g:pymode_options_max_line_length = 120
" let g:pymode_options_colorcolumn = 1
" " 指定UltiSnips python的docstring风格, sphinx, google, numpy
" let g:ultisnips_python_style = 'sphinx'

" Ultisnips
inoremap <c-n> <nop>
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/Ultisnips/']
silent! au BufEnter,BufRead,BufNewFile * silent! unmap <c-r>


" For emmet only avilable for html,css,sass
let g:user_emmet_install_global = 0
autocmd FileType html,htmldjango,css,scss.css,sass,jsx,javascript,javascript.jsx  EmmetInstall
let g:user_emmet_expandabbr_key = '<C-j>'
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends': 'jsx',
\      'quote_char': "'",
\  },
\}


autocmd BufNewFile *.py,*.cc,,*.java exec ":call SetTitle()"
"新建.py,.cc,.java,.sh,
"定义函数SetTitle，自动插入文件头
func SetTitle()
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call setline(2, "\# -*- coding:utf-8 -*-")
        normal G
        normal o
        normal o
        call setline(5, "if __name__ == '__main__':")
        call setline(6, "    pass")
    endif
endfunc


function HeaderSh()
    call setline(1, "#!/usr/bin/env bash")
    normal G
    normal o
    normal o
endf
autocmd bufnewfile *.sh call HeaderSh()



" shortcuts to vimdiff, http://stackoverflow.com/questions/7309707/why-does-git-mergetool-opens-4-windows-in-vimdiff-id-expect-3
let mapleader=','
" let g:mapleader=','

if &diff
    map <leader>1 :diffget LOCAL<CR>
    map <leader>2 :diffget BASE<CR>
    map <leader>3 :diffget REMOTE<CR>
endif

" Turn off search highlight
nnoremap , :noh<CR>

" for nerdtree
nmap ,v :NERDTreeFind<cr>
nmap ,g :NERDTreeToggle<cr>
let NERDTreeShowHidden=1
let NERDTreeIgnore = [
            \ '\.git$', '\.hg$', '\.svn$', '\.stversions$', '\.pyc$', '\.pyo$', '\.svn$', '\.swp$',
            \ '\.DS_Store$', '\.sass-cache$', '__pycache__$', '\.egg-info$', '\.ropeproject$',
            \ 'node_modules$', 'Pods$']
nmap ge :CocCommand explorer<CR>

" for Tagbarbar, sudo apt-get install ctags
"nmap <F8> :TagbarToggle<CR>
nnoremap <silent> <F8> :TagbarToggle<CR>
nnoremap <leader>t :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0    " sort by sourcefile
"let g:tagbar_show_linenumbers = 1
set updatetime=1000   " ms update



" for airline
let g:airline_powerline_fonts=1
let g:airline_theme = 'wombat'
let g:airline#extensions#tabline#enabled = 1
function! ArilineInit()
    let g:airline_section_a = airline#section#create(['mode', ' ', 'branch'])
    let g:airline_section_b = airline#section#create_left(['ffenc', 'hunks', '%F'])
    "let g:airline_section_c = airline#section#create(['filetype'])
    let g:airline_section_x = airline#section#create(['%P'])
    let g:airline_section_y = airline#section#create(['%B'])
    let g:airline_section_z = airline#section#create_right(['%l', '%c'])
endfunction
autocmd VimEnter * call ArilineInit()

" change tab
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
" https://stackoverflow.com/questions/15583346/how-can-i-temporarily-make-the-window-im-working-on-to-be-fullscreen-in-vim
nnoremap tt :tab split<CR>

" 高亮当前选中单词
autocmd CursorMoved * exe exists("HlUnderCursor")?HlUnderCursor?printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\')):'match none':""
nnoremap <silent> <F3> :exe "let HlUnderCursor=exists(\"HlUnderCursor\")?HlUnderCursor*-1+1:1"<CR>


" ctrlp, 在~/.agignore添加一行node_modules
" https://stackoverflow.com/questions/24479101/vim-ctrlp-not-parsing-ag-silver-search-ignore-option-correctly
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|swp|pyc|pyo)$',
  \ }
let g:ctrlp_match_window='top,order:ttb,min:1,max:15,results:15'
nmap <C-x> :CtrlPBufTag<CR>
if executable('ag')
  " Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast, respects .gitignore
  " and .agignore. Ignores hidden files by default.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -f -g ""'
else
  "ctrl+p ignore files in .gitignore
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
endif


"http://vimawesome.com/plugin/scss-syntax-vim
au BufRead,BufNewFile *.scss set filetype=scss.css

"http://vimawesome.com/plugin/rainbow-parentheses-vim   花里胡哨的彩虹括号^_^
"http://www.wklken.me/posts/2015/06/07/vim-plugin-rainbowparentheses.html
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

" 不加入这行, 防止黑色括号出现, 很难识别
" \ ['black',       'SeaGreen3'],



" for html
autocmd BufNewFile,BufRead *.html setlocal expandtab tabstop=2 shiftwidth=2

" for json
let g:vim_json_syntax_conceal = 0
autocmd FileType json,javascript,html,jsx,javascript.jsx setlocal ts=2 sts=2 sw=2 expandtab


" 禁止 startify 自动切换目录
let g:startify_change_to_dir = 0

" solarized 主题
" let g:solarized_termtrans = 1
" set background=dark
" colorscheme solarized
" let g:solarized_visibility = "high"
" let g:solarized_contrast = "high"
" colorschema hybrid, https://github.com/w0ng/vim-hybrid
set background=dark
" colorscheme gruvbox
" let g:gruvbox_contrast_dark = 'hard'
silent! colorscheme hybrid

" 退出快捷键
inoremap jj <Esc>
inoremap hhh <Esc>
inoremap kkk <Esc>
inoremap lll <Esc>
inoremap ooo <Esc>
inoremap <C-k> <Esc>
inoremap <leader>w <Esc>:w<cr>
noremap <leader>e :q<cr>
noremap <leader>E :qa!<cr>
noremap <leader>b :bd<cr>
noremap <leader>s :vs<cr>  " vertical split
noremap <leader>r :e!<cr>  " reload without save
noremap <leader>w :w<cr>

" 切换 buffer
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> [n :bnext<CR>
nnoremap <silent> [d :bdelete<CR>

" use ctrl+h/j/k/l switch window
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l


" javascript plugin config
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#print_width = 120
let g:prettier#exec_cmd_async = 1
let g:prettier#config#arrow_parens = 'always'
let g:prettier#config#bracket_spacing = 'true'

" ale config 今天检查错误显示方式
" let g:ale_sign_error = '✗'
" let g:ale_sign_warning = '⚡'
let g:ale_sign_error = "\U2717"
let g:ale_sign_warning =  "\ue009"
" let g:ale_linters = {'python': []}

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" auto BufWrite * :Autoformat
noremap <leader>p :Autoformat<cr>:StripWhitespace<cr>
" nnoremap <leader> :StripWhitespace<CR>

" gitgutter
" let g:gitgutter_sign_added = '▎'
" let g:gitgutter_sign_modified = '▎'
" let g:gitgutter_sign_removed = '▏'
" let g:gitgutter_sign_removed_first_line = '▔'
" let g:gitgutter_sign_modified_removed = '▋'
set updatetime=400

let g:formatdef_eslint = '"SRC=eslint-temp-${RANDOM}.js; cat - >$SRC; eslint --fix $SRC >/dev/null 2>&1; cat $SRC | perl -pe \"chomp if eof\"; rm -f $SRC"'
let g:formatters_javascript = ['eslint']
let g:formatters_typescript = ['eslint']
