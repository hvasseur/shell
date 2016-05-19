" File: .vimrc
"
" Author: Hoël Vasseur <hoel.vasseur@smile.fr>
"
" Vim configuration
"

" Gotta be first
set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" ----- Making Vim look good ------------------------------------------
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'powerline/powerline'

" ----- Vim as a programmer's text editor -----------------------------
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/syntastic'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/a.vim'

" ----- Working with Git ----------------------------------------------
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" ----- Other text editing features -----------------------------------
Plugin 'Raimondi/delimitMate'

" ----- man pages, tmux -----------------------------------------------
Plugin 'jez/vim-superman'
Plugin 'christoomey/vim-tmux-navigator'

" ----- Syntax plugins ------------------------------------------------
Plugin 'jez/vim-c0'
Plugin 'jez/vim-ispc'
Plugin 'kchmck/vim-coffee-script'

" ----- Echo the function declaration ---------------------------------
Plugin 'mbbil/echofunc.vim'

" ----- Omnicomplete --------------------------------------------------
Plugin 'omnicppcomplete'

" ----- Taglist -------------------------------------------------------
Plugin 'vim-scripts/taglist.vim'

" ----- CSapprox -------------------------------------------------------
"  It should make VIM terminal look like VIM GUI (convert GUI colorscheme
"  to terminal colorscheme)
Plugin 'godlygeek/csapprox'

" ----- LightLine -------------------------------------------------------
"  to have a beautifull status line 
" Plugin 'itchyny/lightline.vim'

" ---- Extras/Advanced plugins ----------------------------------------
" Highlight and strip trailing whitespace
Plugin 'ntpeters/vim-better-whitespace'
" Easily surround chunks of text
"Plugin 'tpope/vim-surround'
" Align CSV files at commas, align Markdown tables, and more
"Plugin 'godlygeek/tabular'
" Automaticall insert the closing HTML tag
"Plugin 'HTML-AutoCloseTag'
" Make tmux look like vim-airline (read README for extra instructions)
"Plugin 'edkolev/tmuxline.vim'
" All the other syntax plugins I use
"Plugin 'ekalinin/Dockerfile.vim'
"Plugin 'digitaltoad/vim-jade'
"Plugin 'tpope/vim-liquid'
"Plugin 'cakebaker/scss-syntax.vim'

call vundle#end()

filetype plugin indent on

" --- General settings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch
set nocp
filetype plugin on
syntax on

set mouse=a

" ----- Plugin-Specific Settings --------------------------------------

" ----- altercation/vim-colors-solarized settings -----
" Toggle this to "light" for light colorscheme
set background=dark

let g:solarized_termcolors=16
" Set the colorscheme
 if has("gui_running")
"""-- solarized color scheme for GUI vim interface (Gvim)
	colorscheme solarized
 else
""" -- a color scheme name noctu for terminal-mode vim (that as only 16 colors)
	colorscheme noctu
 endif
"
" --- Highlight cursor line
set cursorline

" ----- bling/vim-airline settings -----
" Always show statusbar
set laststatus=2

" Fancy arrow symbols, requires a patched font
" To install a patched font, run over to
"     https://github.com/abertsch/Menlo-for-Powerline
" download all the .ttf files, double-click on them and click "Install"
" Finally, uncomment the next line
let g:airline_powerline_fonts = 1

" Show PASTE if in paste mode
let g:airline_detect_paste=1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled=1

" Set airline (statusline) theme
let g:airline_theme='solarized'

" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 0


" ----- scrooloose/syntastic settings -----
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END

" ----- xolox/vim-easytags settings -----
" Where to look for tags files

" Sensible defaults
"let g:easytags_events = ['BufReadPost', 'BufWritePost']
"let g:easytags_async = 1
"let g:easytags_dynamic_files = 2
"let g:easytags_resolve_links = 1
"let g:easytags_suppress_ctags_warning = 1

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent>  <F8> :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
" autocmd BufEnter * nested :call tagbar#autoopen(0)


" ----- airblade/vim-gitgutter settings -----
" Required after having changed the colorscheme
hi clear SignColumn
" show git diff lines after 250 ms
set updatetime=250
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1


" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END


" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt-=preview
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif


" ----- omnicppcomplete -----
"autocmd FileType c set omnifunc=ccomplete#Complete
"let OmniCpp_ShowAccess = 0
"let OmniCpp_LocalSearchDecl=1
"let OmniCpp_MayCompleteDot = 1
"let OmniCpp_MayCompleteArrow = 1
"set completeopt=longest,menuone
"set completeopt+=preview
"" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"
"
"
" ----- Use Cscop -----
" if compiled with --enable-cscope
if has("cscope")
    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag
    " use ctags before cscope
    set csto=1
    " add any cscope database in current directory
    if filereadable("cscope.out")
        cscope add cscope.out
    " else add the database pointed by environment variable
    elseif $CSCOPE_DB != ""
        cscope add $CSCOPE_DB
    endif
    " show message when any other cscope db added
    set cscopeverbose
endif

" build tags database with shift+F8 or alt+F8 to ignore /usr/include
command! CtagsBuild
    \ :!echo 'building ctags database...' ;
    \   ctags --fields=+iaS --extra=+q --totals --sort=yes -R &&
    \   echo 'adding system headers...' ;
    \   find -exec gcc -M '{}' \; 2>&- | tr '[:space:]' '\n' | grep '^/.*' | sort -u |
    \   ctags --c-kinds=+px --c++-kinds=+px --fields=+iaS --extra=+q -aL-
command! CtagsKernelBuild
    \ :!echo 'building ctags database in kernel mode...' ;
    \   ctags --fields=+iaS --extra=+q --totals -R
command! CscopeBuild
    \ :!echo 'building cscope database...' ;
    \   cscope -bR
command! CscopeKernelBuild
    \ :!echo 'building cscope database in kernel mode...' ;
    \   cscope -bkR
if has("cscope")
    map <S-F8> :CtagsBuild<CR><CR>:CscopeBuild<CR><CR>:cscope reset<CR><CR>
    map <M-F8> :CtagsKernelBuild<CR><CR>:CscopeKernelBuild<CR><CR>:cscope reset<CR><CR>
else
    map <S-F8> :CtagsBuild<CR><CR>
    map <M-F8> :CtagsKernelBuild<CR><CR>
endif

" ----- Use taglist to view tags into a split -----
"let Tlist_Process_File_Always = 1
"let Tlist_Exit_OnlyWindow = 1
"let Tlist_Auto_Highlight_Tag = 1
""let Tlist_Display_Prototype = 1
"let Tlist_Display_Tag_Scope = 0
"let Tlist_Show_One_File = 1
""let Tlist_Compact_Format = 1
"let Tlist_Enable_Fold_Column = 0
"let Tlist_Inc_Winwidth = 0
"let Tlist_Use_Right_Window = 1
""let Tlist_GainFocus_On_ToggleOpen = 1
"let Tlist_Close_On_Select = 1
" open/close tag list window with F8
map <silent> <F8> :TlistToggle<CR>

" ----- echofunc.vim settings -----
" Avoid echoing message in command line
"let g:EchoFuncShowOnStatus = 1

" ----- status line settings ----i
set statusline=%{EchoFuncGetStatusLine()}%([%{Tlist_Get_Tagname_By_Line()}]%)                                                                                 
set ballooneval

" ----- using tags for autocomplete -----
set tags=./tags,tags
" ----- omnicppcomplete -
" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/c
set tags+=~/.vim/tags/gst1.0
set tags+=~/.vim/tags/gst0.10
set tags+=~/.vim/tags/glib
set tags+=~/.vim/tags/snmp
set tags+=~/.vim/tags/arpa
set tags+=~/.vim/tags/string
" build tags of your own project with Ctrl-F12
"map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"
" ----- personal settings -----

" show matching brackets
set showmatch
" highlight search
set hlsearch
" unhighlight current search
map <silent> <F11> :nohlsearch<CR>
imap <F11> <ESC><F11>a
"-----  highlight search while typing -----
set incsearch

" ----- jump to last known position when reopening a file -----
if has("autocmd")
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   execute "normal! g`\"" |
        \ endif
    " begin commit message at first line
    autocmd BufRead,BufNewFile COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
    autocmd BufRead,BufNewFile svn-commit.tmp call setpos('.', [0, 1, 1, 0])
endif

" ----- paste with reindent with Esc prefix -----
nnoremap <Esc>P P'[v']=
nnoremap <Esc>p p'[v']=

" show bad white spaces
let c_space_errors = 1
let python_space_error_highlight = 1
highlight link cSpaceError SpaceError
highlight link pythonSpaceError SpaceError
highlight SpaceError ctermfg=235 cterm=reverse

" tab=4
set tabstop=4
set shiftwidth=4
" real tabs
set noexpandtab
" use tabs at the start of a line, spaces elsewhere
set smarttab

" ----Light Line -------------------------------
"let g:lightline = {
"      \ 'colorscheme': 'solarized',
"      \ }
