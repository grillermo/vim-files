"Author: Guillermo Siliceo Trueba
"
" Add the virtualenv's site-packages to vim path
" py << EOF
" import os.path
" import sys
" import vim
" if 'VIRTUAL_ENV' in os.environ:
"     project_base_dir = os.environ['VIRTUAL_ENV']
"     sys.path.insert(0, project_base_dir)
"     activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"     execfile(activate_this, dict(__file__=activate_this))
" EOF
""""""" DEFAULTS """"""""""
" No wrap"
set nowrap
"Vim not vi
set nocompatible "commented because xml.vim folding wont work with it
" show line number
set number
"
" color our sintax
syntax on
"
"
" change root dir to the current file
" set autochdir
"
" conver 
" tabs to spaces
set expandtab
"
" tabs mean 4 spaces
set tabstop=4
"
" each enter will shit how much spaces
set shiftwidth=4
"
" annoying swap message off
set noswapfile
"
" good PEP8 practice
" set textwidth=79
"
" file recognition
filetype plugin indent on

" highlight the search terms when searching with /

" Backspace the way it works in every editor
set backspace=indent,eol,start
" Show me mode changes, visual feedback.
set showmode
" Show me what am i typing"
set showcmd
"Move cursor as expected with wrapped lines"
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
"search in many files the ucrrent word"
map <F3> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw
"Remapping the ; to : to save the pinky"
nore ; :
" set ttyfast " tell vim we're using a fast terminal for redraws
set lazyredraw          " redraw only when we need to.
" Ignore case when searching and stuff
set ignorecase
set history=1000 " Long memory
" Fix indents on paste
:noremap <Esc>p p'[v']=
:noremap <Esc>P P'[v']="
"""""""""""""""""
set ruler " show the cursor position all the time
set scrolloff=2 " keep 3 lines when scrolling
set nostartofline " don't jump to first character when paging
set title " show title in console title bar
set so=7 " Set 7 lines to the curors - when moving vertical..
set cmdheight=2  " size of command line
set showmatch "# "Show matching bracets when text indicator is over them
set iskeyword+=_,$,@,%,# "none of these are word dividers
set cursorcolumn " highlight current cursor position like a pro"
" Create an market in the column 80
set cc=80
set ve=onemore " give me one more character at the end of lines" 
set hidden " you can change buffers without saving"
set wildmenu " turn on command line completion wild style"
" Save on losing focus, GUI option only
:au FocusLost * silent! wa!
" Save when changing buffer
:au BufLeave * silent! wa!
set showtabline=0
" Hide toolbar icons
set guioptions-=T
" Default font
" set guifont=Source\ Code\ Pro
" Disable middle click wheel to paste
noremap <MiddleMouse> <LeftMouse>

runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()


" let &stl="%#search# %t %* %f %([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]}%=#%n %l/%L,%c%V"
"VIMInfo stuf
set viminfo=!,%,'100,/5,:10,s500,n~/.vim/.viminfo
" less verbose messages
set shortmess=atIA
" Scroll faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
vnoremap <C-e> 3<C-e>
vnoremap <C-y> 3<C-y>
"Horrible swap file
"
" * Search
set incsearch     " search while typing:
set hlsearch      " highlight search results:
set wrapscan      " restart search from top when bottom hit
set smartcase     " case sensitive search when searching with upperase letters
set gdefault      " imply /g when s///
set magic         " ^ and $ are special symbols
" recursively search files
map <S-F3> :Rgrep<CR>
"Automatically add shebang line
augroup Shebang
  autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python\<nl># encoding: UTF-8\<nl>\"|$
augroup END
 
" Fold with indents
set foldmethod=indent
" everything folded at start
set foldlevelstart=2

" Persisten undo
set undofile
set undodir=~/.vim/undodir
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=1000 "maximum number lines to save for undo on a buffer reload
" Disable annoying ballons
set noballooneval
" Add a horizontal scrollbar
set go+=b
"
let mapleader = ','


""""""""""" PLUGINS """"""""""""

"
" VUNDLE
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'jgdavey/vim-blockle'
Plugin 'lmeijvogel/vim-yaml-helper'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'mxw/vim-jsx'
Plugin 'ntk148v/vim-horizon'
Plugin 'othree/yajs.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Quramy/vison'
Plugin 'prettier/vim-prettier'
Plugin 'ruanyl/vim-fixmyjs'

" All of your Plugins must be added before the following line
call vundle#end()

" Split join
let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''
let g:splitjoin_ruby_curly_braces=0
let g:splitjoin_quiet=1
let g:splitjoin_ruby_hanging_args=0
let g:splitjoin_ruby_options_as_arguments=1
nmap <Leader>V :SplitjoinJoin<cr>
nmap <Leader>v :SplitjoinSplit<cr>


"
" multiple selection cursor
" " Default mapping
let g:multi_cursor_next_key='<D-n>'
let g:multi_cursor_prev_key='<D-p>'
let g:multi_cursor_skip_key='<D-x>'
let g:multi_cursor_quit_key='<Esc>'
"
"
"
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>" 
let $VIMRUNTIME='/Users/grillermo/.vim' 
"" Command-t options
" let g:CommandTMatchWindowReverse=1
" let g:CommandTMaxHeight=20
" let g:CommandTMaxFiles=30000
" Ctags
let g:syntastic_javascript_checkers = ['eslint'] 
" Syntastic
let g:syntastic_python_checkers=['pyflakes']
" Ctags
set tags+=gems.tags,./tags,tags
"
let g:ctrlp_working_path_mode = 0
"
" RSpec.vim 
map <Leader>rf :w<CR>:RunItermSpringSpec<CR>
map <Leader>rc :w<CR>:RunItermSpringSpecLine<CR>
let g:rspec_runner = "os_x_iterm"
" Toggle show hidden files for NERDTREE
let NERDTreeShowHidden=1
" Fix lag while browsing
let NERDTreeHighlightCursorline=0


 " HTML Tidy, http://tidy.sourceforge.net/
 " select xml text to format and hit ,x
vmap <leader>h :!tidy -q -i -xml --force-output 1 --char-encoding utf8<CR>
nore <leader>h :!tidy -q -i -xml --force-output 1 --char-encoding utf8<CR>
let g:EasyGrepRecursive=1
" SESSIONS 
set sessionoptions=blank,buffers,folds,resize,tabpages,winpos,winsize 
"
" vim-indent-guides
set ts=4 sw=4 et
let g:indent_guides_start_level=2
let g:indent_guides_guide_size = 1
set softtabstop=4
"
"
" Indentation
"   
autocmd BufNewFile,BufRead *.py set shiftwidth=4
autocmd BufNewFile,BufRead *.py set tabstop=4
autocmd BufNewFile,BufRead *.py set softtabstop=4
autocmd BufNewFile,BufRead *.py set shiftwidth=4

autocmd BufNewFile,BufRead *.ruby set ts=2 sw=2 et
autocmd BufNewFile,BufRead *.ruby set shiftwidth=2
autocmd BufNewFile,BufRead *.ruby set tabstop=2
autocmd BufNewFile,BufRead *.ruby set softtabstop=2

autocmd BufNewFile,BufRead *.rb set shiftwidth=2
autocmd BufNewFile,BufRead *.rb set tabstop=2
autocmd BufNewFile,BufRead *.rb set softtabstop=2

autocmd BufNewFile,BufRead *.sass set ts=2 sw=2 et
autocmd BufNewFile,BufRead *.sass set shiftwidth=2
autocmd BufNewFile,BufRead *.sass set tabstop=2
autocmd BufNewFile,BufRead *.sass set softtabstop=2

autocmd BufNewFile,BufRead *.yml set ts=2 sw=2 et
autocmd BufNewFile,BufRead *.yml set shiftwidth=2
autocmd BufNewFile,BufRead *.yml set tabstop=2
autocmd BufNewFile,BufRead *.yml set softtabstop=2

autocmd BufNewFile,BufRead *.haml set ts=2 sw=2 et
autocmd BufNewFile,BufRead *.haml set shiftwidth=2
autocmd BufNewFile,BufRead *.haml set tabstop=2
autocmd BufNewFile,BufRead *.haml set softtabstop=2

autocmd BufNewFile,BufRead *.erb set ts=4 sw=4 et
autocmd BufNewFile,BufRead *.erb set shiftwidth=4
autocmd BufNewFile,BufRead *.erb set tabstop=4
autocmd BufNewFile,BufRead *.erb set softtabstop=4
"
"
"
" Jquery underscore syntax
autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
"
"
"
"" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  
  " " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR><CR>
"
" bind \ (backward slash) to ag shortcut
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
"
" When \ is pressed, Vim waits for our input:
nnoremap \ :Ag! -Q<SPACE>
"
" EASY align
vmap <leader><SPACE> <Plug>(EasyAlign)
"
" Prettier
vmap <leader>p :Prettier<CR>

" Run ruby file
nnoremap <leader>r :!ruby % <CR> 

" UNITE
nnoremap <leader>u :Unite<CR>
nnoremap <leader>gt :Unite -silent -start-insert menu:git<CR>
nnoremap <leader>h :Unite history/command <CR> 
nnoremap <leader>m :Unite file_mru <CR> 
nnoremap <leader>b :Unite buffer <CR> 
nnoremap <leader>l :Unite line<CR> 
function! s:unite_settings()

    " Enable navigation with control-j and control-k in insert mode
    inoremap <silent><buffer><expr> <C-s> unite#do_action('split')
    nnoremap <silent><buffer><expr> <C-s> unite#do_action('split')
    inoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
    nnoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')

    let g:unite_source_menu_menus = {}

    let g:unite_source_menu_menus.git = {
        \ 'description' : '            gestionar repositorios git
            \                            ⌘ [espacio]g',
        \}
    let g:unite_source_menu_menus.git.command_candidates = [
        \['▷ tig                                                        ⌘ ,gt',
            \'normal ,gt'],
        \['▷ git status       (Fugitive)                                ⌘ ,gs',
            \'Gstatus'],
        \['▷ git diff         (Fugitive)                                ⌘ ,gd',
            \'Gdiff'],
        \['▷ git commit       (Fugitive)                                ⌘ ,gc',
            \'Gcommit'],
        \['▷ git log          (Fugitive)                                ⌘ ,gl',
            \'exe "silent Glog | Unite quickfix"'],
        \['▷ git blame        (Fugitive)                                ⌘ ,gb',
            \'Gblame'],
        \['▷ git stage        (Fugitive)                                ⌘ ,gw',
            \'Gwrite'],
        \['▷ git checkout     (Fugitive)                                ⌘ ,go',
            \'Gread'],
        \['▷ git rm           (Fugitive)                                ⌘ ,gr',
            \'Gremove'],
        \['▷ git mv           (Fugitive)                                ⌘ ,gm',
            \'exe "Gmove " input("destino: ")'],
        \['▷ git push         (Fugitive, salida por buffer)             ⌘ ,gp',
            \'Git! push'],
        \['▷ git pull         (Fugitive, salida por buffer)             ⌘ ,gP',
            \'Git! pull'],
        \['▷ git prompt       (Fugitive, salida por buffer)             ⌘ ,gi',
            \'exe "Git! " input("comando git: ")'],
        \['▷ git cd           (Fugitive)',
            \'Gcd'],
        \]

    let g:unite_source_menu_menus.rspec = {
        \ 'description' : '            Run rspec stests
            \                            ⌘ [espacio]g',
        \}
    let g:unite_source_menu_menus.rspec.command_candidates = [
        \['▷ Run current file   (Rspec.vim)                                ⌘ ,rf',
            \'normal ,rf'],
        \['▷ Run nearesest spec (Rspec.vim)                                ⌘ ,rc',
            \'normal ,rc'],
        \['▷ Run last spec      (Rspec.vim)                                ⌘ ,rf',
            \'normal, rl'],
        \['▷ Run all specs      (Rspec.vim)                                ⌘ ,ra',
            \'normal, ra'],
        \]
endfunction
" Custom mappings for the unite buffer
autocmd! FileType unite call s:unite_settings()

let g:unite_enable_start_insert = 1
let g:unite_winheight = 20

" Match fuzzy finder ctrlp like'
call unite#filters#matcher_default#use(['matcher_fuzzy'])

"
"
"""""""""""" PERSONAL HOTKEYS """""""""""
" 
nmap <leader>qn :cnext<cr>
nmap <leader>qp :cprevious<cr>

" Do not force me to do "0p after overriding something with paste
xnoremap p "_dP
"
" Start a substitue for current work
nmap <leader>sw y:%s/<C-r>"/<C-e>

" browse through windows
nmap <Tab> <C-w>w
nmap <s-Tab> <C-w>W
"
" Toggle mouse usage, This is only relevante for the not terminal version of vim not the
function! ToggleMouse()
  if &mouse == 'a'
    set mouse=
    echo "Mouse usage disabled"
  else
    set mouse=a
    echo "Mouse usage enabled"
  endif
endfunction
map <F6> :call ToggleMouse()<CR>

"
" enable paste toggling to fix the indentation issue when pasting text comming from outside vim, again only not GUI
nnoremap <F4> :set invpaste paste?<CR>
" " Quickly add a return in normal mode
noremap <cr> o <Backspace><Esc>
" But restore behavior in quickfix
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
" " Make backspace work in normal mode
nmap <Backspace> d<Left>
" Toggle case sensitivness"
nnoremap <F7> :set ignorecase! ignorecase?<CR>
" Open Nerdtree"
nmap <C-n> :NERDTreeToggle<CR>
" Indent with tabs in visual mode"
vmap <Tab> >gv
vmap <S-Tab> <gv
" Move between buffers using tabs
map <C-Tab> :bnext<cr>
map <C-S-Tab> :bcrevious<cr>
"

" Move text around with ctrl and hjkl
nmap <C-l> >>
nmap <C-h> <<
" Yank cut
nmap <C-X> Ydd

" Close the window and delete the buffer associated with it
map <D-w> :bd!<cr>
" Go to end of line, closer key
inoremap <D-=> <esc>g$i
imap <D--> <esc>g$i
" Go to begin of line, closer to my fingers key
noremap <A--> g^
imap <A--> <esc>g^i
" Fix shift-v selecting all the line including the endofline
nmap <S-v> g^vg$h
imap <C-l> <right>
imap <C-k> <up>
imap <C-j> <down>
imap <C-h> <left>
"
" Mapping shift tab to <s-tab>
map <Esc>[Z <s-tab>
ounmap <Esc>[Z
" Now using it to get a deendenting effect
imap <s-tab> <esc><<i
"
"remap save
map <D-s> :update!<cr>
"remap copy
map <D-c> <c-c>
map <D-v> <c-v>
imap <D-v> <c-v>
" i don't want the end of the line to be selected
vnoremap $ $<left>
" gundotool
map <leader>g :GundoToggle<cr>
" the standard w behavior sucks i like more how e works
vmap w e
" Disable ex mode
map Q <Nop>
"
" Set foldlevel
map <leader>f1 :set foldlevel=1<CR>
map <leader>f2 :set foldlevel=2<CR>
map <leader>f3 :set foldlevel=3<CR>
map <leader>f4 :set foldlevel=4<CR>
map <leader>f5 :set foldlevel=5<CR>


" Do not jump immediatly with *
nmap <silent> * "syiw<Esc>: let @/ = @s<CR>

nmap ,cs :let @*=expand("%")<CR>
nmap ,cl :let @*=expand("%:p")<CR>
"
"
if has("mac") || has("gui_macvim") || has("gui_mac")
  " relative path  (src/foo.txt)
  nnoremap <leader>cf :let @*=expand("%")<CR>

  " absolute path  (/something/src/foo.txt)
  nnoremap <leader>cF :let @*=expand("%:p")<CR>
endif


"" Yank the current yaml line
nnoremap <leader>cyl :YamlGetFullPath<CR>


" to handle exiting insert mode via a control-C
inoremap <c-c> <c-o>:call InsertLeaveActions()<cr><c-c>
" default the statusline to green when entering Vim
hi statusline guibg=green
" have a permanent statusline to color
set laststatus=2


function! Indent4spaces()
    echo "Indenting with 4 spaces"
    set shiftwidth=4
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
endfunction
nmap <leader>i4 :call Indent4spaces()<CR>


function! Indent2spaces()
    echo "Indenting with 2 spaces"
    set shiftwidth=2
    set tabstop=2
    set softtabstop=2
    set shiftwidth=2
endfunction
nmap <leader>i2 :call Indent2spaces()<CR>

function! MoveLineUp()
  call MoveLineOrVisualUp(".", "")
endfunction

function! MoveLineDown()
  call MoveLineOrVisualDown(".", "")
endfunction

function! MoveVisualUp()
  call MoveLineOrVisualUp("'<", "'<,'>")
  normal gv
endfunction

function! MoveVisualDown()
  call MoveLineOrVisualDown("'>", "'<,'>")
  normal gv
endfunction

function! MoveLineOrVisualUp(line_getter, range)
  let l_num = line(a:line_getter)
  if l_num - v:count1 - 1 < 0
    let move_arg = "0"
  else
    let move_arg = a:line_getter." -".(v:count1 + 1)
  endif
  call MoveLineOrVisualUpOrDown(a:range."move ".move_arg)
endfunction

function! MoveLineOrVisualDown(line_getter, range)
  let l_num = line(a:line_getter)
  if l_num + v:count1 > line("$")
    let move_arg = "$"
  else
    let move_arg = a:line_getter." +".v:count1
  endif
  call MoveLineOrVisualUpOrDown(a:range."move ".move_arg)
endfunction

function! MoveLineOrVisualUpOrDown(move_arg)
  let col_num = virtcol(".")
  execute "silent! ".a:move_arg
  execute "normal! ".col_num."|"
endfunction

nnoremap <silent> <C-k> :<C-u>call MoveLineUp()<CR>
nnoremap <silent> <C-j> :<C-u>call MoveLineDown()<CR>

function! FindProjectName()
  let s:name = getcwd()
  if !isdirectory(".git")
    let s:name = substitute(finddir(".git", ".;"), "/.git", "", "")
  end
  if s:name != ""
    let s:name = matchstr(s:name, ".*", strridx(s:name, "/") + 1)
  end
  return s:name
endfunction

" Sessions only restored if we start Vim without args.
function! RestoreSession(name)
  if a:name != ""
    if filereadable($HOME . "/.vim/sessions/" . a:name)
      execute ':silent source ' . $HOME . "/.vim/sessions/" . a:name
    end
  end
endfunction

" Sessions only saved if we start Vim without args.
function! SaveSession(name)
    if a:name != ""
        execute 'mksession! ' . $HOME . '/.vim/sessions/' . a:name
    end
endfunction

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()


" Restore and save sessions.
" if argc() == 0
"     autocmd GUIEnter * call RestoreSession(FindProjectName())
" end
" 
" autocmd BufEnter * call SaveSession(FindProjectName())

let g:airline_section_a = ''
let g:airline_section_b = ''
let g:airline_section_y = ''
let g:airline_section_x = ''
let g:airline_section_z = ''

"" PERFORMANCE
" No column cursor
set nocursorline
set norelativenumber

" Limit syntax highliting to reduce slowness
" set synmaxcol=200

" Old regex engine because rb syntax highliting is slow with new
set re=1

" Spelling mistakes
iab alida aliada
iab pry binding.pry

" Color scheme
color Papercolor

" Ensure vim does not spit an error on some ymls with base64 stuff
set maxmempattern=2000000

" Create directory path when adding a new file if it does not exists
if has("autocmd")
  autocmd BufWritePre * :silent! call mkdir(expand('%:p:h'), 'p')
end
