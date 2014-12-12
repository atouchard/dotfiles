" http://tutoriel.io/9-plugins-indispensables-pour-vim/
"
" Theme
if $THEME == "dark"
  set background=dark
else
  set background=light
end

" 256 color terminal
set t_Co=256

colorscheme distinguished
"colorscheme solarized
"let g:solarized_termcolors=256
"colorscheme gruvbox

" statusline
set laststatus=2
set statusline=%t\ %y%m

" wildmode
set wildmode=longest,list
" temp and backup files
set wildignore+=*.swp,*~,._*
" OSX bullshit
set wildignore+=*.DS_Store

execute pathogen#infect()
filetype plugin indent on

" ctrlp plugin connfig
let g:ctrlp_custom_ignore = {'scm': '\v[\/]\.(git|hg|svn)$','dir': '\v[\/](node_modules|dist|bower_components|vendors|build)$',}

" delimitMate plugin config
let g:delimitMate_autoclose = 1
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1
let delimitMate_expand_inside_quotes = 1 
let g:delimitMate_smart_quotes = 1
let g:delimitMate_jump_expansion = 1
let g:delimitMate_matchpairs = "(:),[:],{:},<:>"

" Airline plugin config
let g:airline#extensions#tabline#enabled = 1 
let g:airline_powerline_fonts = 1

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Activate mouse (NERDTree)
set mouse=a

" Attempt to determine the type of a file based on its name and possibly its
" contents.  Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax on

" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit without
" saving, and swap files will keep you safe if your computer crashes.
set hidden

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Incremental search
set incsearch

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Display line numbers on the left
set number

"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set tabstop=2                   " tab is two spaces
set softtabstop=2               " softtab is two spaces
set shiftwidth=2                " autoindent is two spaces
set expandtab                   " convert tabs to spaces

noremap w <C-w>
noremap W <C-w><C-w>

cmap w!! %!sudo tee > dev/null %

" Toggle Vexplore with Ctrl-E
"function! ToggleVExplorer()
""  if exists("t:expl_buf_num")
""      let expl_win_num = bufwinnr(t:expl_buf_num)
""      if expl_win_num != -1
""          let cur_win_nr = winnr()
""          exec expl_win_num . 'wincmd w'
""          close
""          exec cur_win_nr . 'wincmd w'
""          unlet t:expl_buf_num
""      else
""          unlet t:expl_buf_num
""      endif
""  else
""      exec '1wincmd w'
""      Vexplore
""      let t:expl_buf_num = bufnr("%")
""  endif
"endfunction

"map <silent> <C-E> :call ToggleVExplorer()<CR>

" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_browse_split = 4
let g:netrw_altv = 1

" Default to tree mode
let g:netrw_liststyle=3

" Change directory to the current buffer when opening files.
set autochdir

" NERDTree plugin config
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeShowHidden=1
map <F2> :NERDTreeToggle<CR>

