" VIM setting.
" Szu-Yu Chen (Aknow)

" Not support for win32

"------------------------------------------------------------------------------
" vundle setting.
"------------------------------------------------------------------------------
set nocompatible               " be iMproved
filetype off                   " required!

" http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
  let iCanHazVundle=0
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" :: Basic editing or moving
Bundle 'Lokaltog/vim-easymotion'
" Produce increasing/decreasing columns of numbers, dates, or daynames
Bundle 'VisIncr'
Bundle 'YankRing.vim'
Bundle 'indent-motion'
" extended % matching for HTML, LaTeX, and many other languages
Bundle 'matchit.zip'
Bundle 'tpope/vim-surround'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-unimpaired'
"Bundle 'tomtom/tlib_vim'
"Bundle 'wincent/Command-T'
Bundle 'Raimondi/delimitMate'

" :: Coding
Bundle 'LnL7/vim-tslime'
Bundle 'SirVer/ultisnips'
Bundle 'Valloric/YouCompleteMe'
Bundle 'autoload_cscope.vim'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'
Bundle 'scrooloose/nerdcommenter'
"Bundle 'honza/vim-snippets'
"Bundle 'mattn/zencoding-vim'

" :: Decorator
Bundle 'chriskempson/base16-vim'
Bundle 'bling/vim-airline'
Bundle 'airblade/vim-gitgutter'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'
"Bundle 'Twinside/vim-cuteErrorMarker'

" :: Language support
Bundle 'kchmck/vim-coffee-script'
Bundle 'mozfr/mozilla.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'scrooloose/syntastic'
Bundle 'sukima/xmledit'
Bundle 'tell-k/vim-autopep8'

" :: Others
"Bundle 'guns/xterm-color-table.vim'

"------------------------------------------------------------------------------

if iCanHazVundle == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :BundleInstall
  :qall
endif
" Setting up Vundle - the vim plugin bundler end

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..


"---------------------------------------------------------------------------
" General Settings
"---------------------------------------------------------------------------
" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

filetype off          " necessary to make ftdetect work on Linux
syntax on
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins


if has("gui_running")	" GUI color and font settings
  set background=dark
  colorscheme base16-default
  set guifont=Monaco\ 12
  set cursorline        " highlight current line

  " Copy/paste
  nmap <C-V> "+gP
  imap <C-V> <ESC><C-V>a
  vmap <C-C> "+y
else
" terminal color settings
  set term=xterm-256color
  colorscheme aknow

  " Arror key
  nmap OA k
  nmap OB j
  nmap OC l
  nmap OD h
endif

set nocompatible	" not compatible with the old-fashion vi mode
set bs=2		" allow backspacing over everything in insert mode
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set autoread		" auto read when file is changed from outside
set colorcolumn=80

set hlsearch		" search highlighting
set t_Co=256            " 256 color mode
set clipboard=unnamed	" yank to the system register (*) by default
set showmatch		" Cursor shows matching ) and }
set showmode		" Show current mode
set wildchar=<TAB>	" start wild expansion in the command line using <TAB>
set wildmenu            " wild char completion menu

" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc

set autoindent		" auto indentation
set incsearch		" incremental search
set nobackup		" no *~ backup files
set copyindent		" copy the previous indentation on autoindenting
set ignorecase		" ignore case when searching
set smartcase		" ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab		" insert tabs on the start of a line according to context

" disable sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" TAB setting{
   set expandtab        "replace <TAB> with spaces
   set softtabstop=2
   set shiftwidth=2

   au FileType Makefile set noexpandtab
   autocmd FileType python,java setlocal shiftwidth=4 tabstop=4
"}

" C/C++ specific settings
autocmd FileType c,cpp,cc,h  set cindent comments=sr:/*,mb:*,el:*/,:// cino=>s,e0,n0,f0,{0,}0,:s,=s,g0,h1s,p2,t0,+2s,(0,W2s,)20,*30

"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"---------------------------------------------------------------------------
" Tip #382: Search for <cword> and replace with input() in all open buffers
"---------------------------------------------------------------------------
fun! Replace()
    let s:word = input("Replace " . expand('<cword>') . " with:")
    :exe 'bufdo! %s/\<' . expand('<cword>') . '\>/' . s:word . '/ge'
    :unlet! s:word
endfun

set tags=./tags;/


"---------------------------------------------------------------------------
" USEFUL SHORTCUTS
"---------------------------------------------------------------------------
" set leader to ,
let mapleader=","
let g:mapleader=","

"replace the current word in all opened buffers
map <leader>r :call Replace()<CR>

" --- move around splits {
" move to and maximize the below split
map <C-J> <C-W>j
" move to and maximize the above split
map <C-K> <C-W>k
" move to and maximize the left split
nmap <c-h> <c-w>h
" move to and maximize the right split
nmap <c-l> <c-w>l
" }

" move around tabs. conflict with the original screen top/bottom
" comment them out if you want the original H/L
" go to prev tab
map <S-H> gT
" go to next tab
map <S-L> gt

" new tab
map <C-t><C-t> :tabnew<CR>
" close tab
map <C-t><C-w> :tabclose<CR>

" ,/ turn off search highlighting
nmap <leader>/ :nohl<CR>

" Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>

" ,p toggles paste mode
nmap <leader>p :set paste!<BAR>set paste?<CR>

" allow multiple indentation/deindentation in visual mode
vnoremap < <gv
vnoremap > >gv

" :cd. change working directory to that of the current file
cmap cd. lcd %:p:h

" Writing Restructured Text (Sphinx Documentation) {
   " Ctrl-u 1:    underline Parts w/ #'s
   noremap  <C-u>1 yyPVr#yyjp
   inoremap <C-u>1 <esc>yyPVr#yyjpA
   " Ctrl-u 2:    underline Chapters w/ *'s
   noremap  <C-u>2 yyPVr*yyjp
   inoremap <C-u>2 <esc>yyPVr*yyjpA
   " Ctrl-u 3:    underline Section Level 1 w/ ='s
   noremap  <C-u>3 yypVr=
   inoremap <C-u>3 <esc>yypVr=A
   " Ctrl-u 4:    underline Section Level 2 w/ -'s
   noremap  <C-u>4 yypVr-
   inoremap <C-u>4 <esc>yypVr-A
   " Ctrl-u 5:    underline Section Level 3 w/ ^'s
   noremap  <C-u>5 yypVr^
   inoremap <C-u>5 <esc>yypVr^A
"}


"---------------------------------------------------------------------------
" Removes trailing spaces
"---------------------------------------------------------------------------
highlight TrailingWhitespaces ctermbg=gray guibg=gray
match TrailingWhitespaces /\s\+$/

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    %s/^$\n\+\%$//ge
    call cursor(l, c)
endfun

autocmd FileWritePre   *.c,*.cpp,*.h,*.js,*.py :call <SID>StripTrailingWhitespaces()
autocmd FileAppendPre  *.c,*.cpp,*.h,*.js,*.py :call <SID>StripTrailingWhitespaces()
autocmd FilterWritePre *.c,*.cpp,*.h,*.js,*.py :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre    *.c,*.cpp,*.h,*.js,*.py :call <SID>StripTrailingWhitespaces()
nmap <F2> :call <SID>StripTrailingWhitespaces()<CR>


"---------------------------------------------------------------------------
" PROGRAMMING SHORTCUTS
"---------------------------------------------------------------------------

" Ctrl-[ jump out of the tag stack (undo Ctrl-])
map <C-[> <ESC>:po<CR>

" ,g generates the header guard
map <leader>g :call IncludeGuard()<CR>
fun! IncludeGuard()
   let basename = substitute(bufname(""), '.*/', '', '')
   let guard = '_' . substitute(toupper(basename), '\.', '_', "H")
   call append(0, "#ifndef " . guard)
   call append(1, "#define " . guard)
   call append( line("$"), "#endif // for #ifndef " . guard)
endfun


" Enable omni completion. (Ctrl-X Ctrl-O)
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType c set omnifunc=ccomplete#Complete
"autocmd FileType java set omnifunc=javacomplete#Complete

" use syntax complete if nothing else available
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
              \	if &omnifunc == "" |
              \		setlocal omnifunc=syntaxcomplete#Complete |
              \	endif
endif

set cot-=preview "disable doc preview in omnicomplete

" make CSS omnicompletion work for SASS and SCSS
autocmd BufNewFile,BufRead *.scss             set ft=scss.css
autocmd BufNewFile,BufRead *.sass             set ft=sass.css


"---------------------------------------------------------------------------
" ENCODING SETTINGS
"---------------------------------------------------------------------------
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1

fun! ViewUTF8()
	set encoding=utf-8
	set termencoding=big5
endfun

fun! UTF8()
	set encoding=utf-8
	set termencoding=big5
	set fileencoding=utf-8
	set fileencodings=ucs-bom,big5,utf-8,latin1
endfun

fun! Big5()
	set encoding=big5
	set fileencoding=big5
endfun


"---------------------------------------------------------------------------
" PLUGIN SETTINGS
"---------------------------------------------------------------------------

" --- Command-T
let g:CommandTMaxHeight = 15


" --- EasyMotion
"let g:EasyMotion_leader_key = '<Leader>m' " default is <Leader>w
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment


" --- NERDTree
" toggle NERDTree with F5
nnoremap <silent> <F5> :NERDTreeToggle<CR>


" --- TagBar
" toggle TagBar with F7
nnoremap <silent> <F7> :TagbarToggle<CR>
" set focus to TagBar when opening it
let g:tagbar_autofocus = 1


" --- coffee-script
au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw! " recompile coffee scripts on write


" --- vim-gitgutter
let g:gitgutter_enabled = 1


" --- YouCompleteMe
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_select_completion = ['<TAB>']
let g:ycm_key_list_previous_completion=['<S-TAB>']


" --- Ultisnips
"let g:UltiSnipsExpandTrigger="<s-tab>"
"let g:UltiSnipsListSnippets="<c-s-tab>"
let g:UltiSnipsSnippetsDir="~/.vim/bundle/ultisnips/UltiSnips"


" --- gist-vim
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_browser_command = 'google-chrome %URL% &'
let g:gist_clip_command = 'xclip -selection clipboard'


" --- syntastic
let g:syntastic_jshint_exec="jshint-gecko"
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_python_checkers=['pyflakes', 'pylint']
let g:syntastic_always_populate_loc_list = 1
nnoremap <silent> <F4> :lwindow<CR>


" --- tslime
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars


" --- autopep8
let g:autopep8_disable_show_diff = 1


" --- airline
"let g:airline_powerline_fonts = 1

