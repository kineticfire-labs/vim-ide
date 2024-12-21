" (c) Copyright 2022-2025 KineticFire. All rights reserved.

" Licensed under the Apache License, Version 2.0 (the "License");
" you may not use this file except in compliance with the License.
" You may obtain a copy of the License at
"
"    http://www.apache.org/licenses/LICENSE-2.0
"
" Unless required by applicable law or agreed to in writing, software
" distributed under the License is distributed on an "AS IS" BASIS,
" WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
" See the License for the specific language governing permissions and
" limitations under the License.



" vim-ide
"      KineticFire Labs: https://labs.kineticfire.com/
"          project site: https://github.com/kineticfire-labs/vim-ide/


" =====================================================
" =====================================================
" =====================================================
" Basic Settings


" Make vim incompatible with vi
set nocompatible
set modelines=0


set fileformat=unix
set encoding=utf-8
set fileencodings=utf-8


" Set leader key
let mapleader = " "


" Set escape key. Can type this in place of <Esc> to exit from insert mode.
inoremap jk <Esc>


" Enable syntax highlighting
syntax on


" Set delays
set timeoutlen=1000
set ttimeoutlen=50


" Tab settings
   " Set tab key to use three spaces instead of tab
set tabstop=3
set softtabstop=3
set expandtab
set shiftwidth=3
set smarttab

" Set no line wrap
set nowrap

" Set line wrap toggle
map <silent> <leader>lw :set wrap!<CR>


" Indent
set autoindent
set cindent



" Advance 8 lines instead of 1 when scrolling off screen
set scrolloff=8


set showmode
set showcmd
set hidden


" These lines disable sounds and screen flashing when an error occurs
set noerrorbells
set visualbell
set t_vb=


" The code in this block (from this line until the 'END-BLOCK-XMementoIT-Limited-2013') is Copyright
" (c) 2013 XMementoIT Limited and covered under MIT license.  The license can
" be found in 'licenses-for-included-code/XMementoIT-Limited-2013-MIT-LICENSE'.
"
" Enable wildmenu/mode for commandline completion
   " Use <tab> to trigger list of command options
   " from: https://github.com/DamZiobro/vim-ide/blob/master/vimrc
set wildmenu
set wildmode=list:longest
" Wildmenu completion
set wildmode=list:longest
set wildignore+=.hg,.git,.svn " version control
set wildignore+=*.aux,*.out,*.toc " latex indermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl " compiled spelling word list
set wildignore+=*.sw? " vim swap files
set wildignore+=*.DS_Store " OSX related
set wildignore+=*.luac " Lua byte code
set wildignore+=migrations " Django migrations
set wildignore+=*.pyc " Python object codes
set wildignore+=*.orig,*.rej " merge resolution files
" END-BLOCK-XMementoIT-Limited-2013


set history=1000
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set undolevels=10000
set clipboard=unnamed " Command+c clipboard same as vim 'y' and 'c' clipboard"


set ttyfast
set ruler
set backspace=indent,eol,start


" Enable line numbering
set numberwidth=3
set number
set relativenumber

" Toggle line numbering display
map <silent> <leader>ln :call LineNumberToggle()<CR>
function! LineNumberToggle()
   if &number == 1
      set nornu
      set nonumber
   else
      set number
      set relativenumber
   endif
endfunction


set signcolumn=no


set shell=/bin/bash
set lazyredraw
set matchtime=3


set dictionary=/usr/share/dict/words


" Press <shift> to copy and paste outside of vim, as if disabling 'mouse=a'
set mouse=a



" Searching

    " Show incremental match as search term is typed
    set incsearch

    " Highlight search result
    set hlsearch

    " Case sensitive searching, except case insensitive when search pattern is all lowercase
    set ignorecase
    set smartcase

    set showmatch

    " Clear current search highlight by double tapping //
    nmap <silent> // :nohlsearch<CR>


" Disable help keys
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>


" The code in this block (from this line until the 'END-BLOCK-XMementoIT-Limited-2013') is Copyright
" (c) 2013 XMementoIT Limited and covered under MIT license.  The license can
" be found in 'licenses-for-included-code/XMementoIT-Limited-2013-MIT-LICENSE'.
"
" Make sure that Vim returns to the same line when we reopen a file
   " from https://github.com/DamZiobro/vim-ide/blob/master/vimrc
augroup line_return
    au!
    au BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \ execute 'normal! g`"zvzz' |
                \ endif
augroup END
" END-BLOCK-XMementoIT-Limited-2013



" Toggle check spelling
nmap <leader>cs :set spell!<CR>


" Use as hex editor
map <leader>hon :%!xxd<CR>
map <leader>hof :%!xxd -r<CR>



" Configure the statusline (at bottom of buffer).  If the .vimrc-ide file is
" availbale and loads, then the status line is handled by a plugin.
   " F full path
   " m modified flag
   " r read only flag
   " l,v = line #, virtual column #
   " o = character position
   " p = % of file by line for cursor position
set statusline=%F%m%r\ (%l,%v)\ [%p%%]
set laststatus=2 " enable even if multiple buffers open


" Cursor higlighting

   " Highlight the line the cursor is on
   set cursorline

   " Highlight the row the cursor is on
      " turn underline row off by setting cterm=none; remove to underline row
      " change background color with 'ctermbg'; remove to stop using background color
   highlight CursorLine cterm=none ctermbg=darkgray

   " Highlight the column the cursor is on.
   "set cursorcolumn
   " Change background color with 'ctermbg'; remove to stop using background color
   "highlight CursorColumn ctermbg=darkgray


" Enable setting title of shell
set title
" Set title of shell to 'vi:<path to file>'
set titlestring=vi:\ %-25.55F\ %a%r%m titlelen=70


" Buffers

   " Opening Buffers

      " open buffer and hide current one; new buffer if no filename given
      ":e |<name>
      noremap <leader>be :e

      " open buffer in current window, horizontal split; new buffer if no filename given
      "<C-w>n
      noremap <leader>bh :new

      " open buffer in current window, vertical split; new buffer if no filename given
      noremap <leader>bv :vnew


   " Listing Buffers

      " list buffers
      noremap <silent> <leader>bl :ls<CR>

      " list and select buffers
      set wildcharm=<tab>
      noremap <leader>bs :buffers<CR><CR>:buffer<space><tab>


   " Navigating Buffers

      ":bnext          ... go to next buffer
      ":b <name>       ... type name to go that buffer
      ":bN             ... go to that buffer number N
      "<C-o> and <C-i> ... jump between last buffer positions; not buffer-specific

      " jump to last buffer
      noremap <silent> <leader>bb <C-^>

      " close buffer
      nnoremap <silent> <leader>bd :bd<CR>

      " kill buffer
      nnoremap <silent> <leader>bk :bd!<CR>


" Windows

   " Splitting Windows

      " Set split windows to occur at right or below, which feels more natural
      set splitbelow
      set splitright

      "<C-w>s ... horizontal split of current window
      "<C-w>v ... vertical split of current window
      "<C-w>R ... swap top/bottom left/right windows


   " Navigating Windows

      "<C-w>h ... move to window left
      "<C-w>j ... move to window down
      "<C-w>k ... move to window up
      "<C-w>l ... move to window right
      map <C-h> <C-w>h
      map <C-j> <C-w>j
      map <C-k> <C-w>k
      map <C-l> <C-w>l


   " Sizing Windows

      " resize windows with arrow keys
      map <C-Right> 5<C-w>>
      map <C-Left>  5<C-w><
      map <C-Up>    5<C-w>+
      map <C-Down>  5<C-w>-

      " max height
      map <C-w>e <C-w>_

      " max width
      map <C-w>w <C-w>|

      " max height and width
      map <C-w>m <C-w>_<C-w><bar>

      " balance all windows
      map <C-w>b <C-w>=
   

   " Window and Tabs

      " Open current window in tab (retains window in current tab)
      map <C-w>t :tab split<CR>

      " Move current window to tab (window not retained in current tab)
      "<C-w>T


   "<C-w>o  ... close all windows but current one



" Tabs

   " Opening Tabs

      " open new tab
      nnoremap <silent> <leader>to :tabnew<CR>


   " Navigating Tabs

      " tab by number
      "{#}gt
      
      " tab next
      "gt
      nnoremap <silent> <leader>tn :tabn<CR>

      " tab previous
      "gT
      nnoremap <silent> <leader>tp :tabp<CR>


   " Positioning Tabs

      " tab move first
      nnoremap <silent> <leader>tmf :tabm 0<CR>

      " tab move left
      nnoremap <silent> <leader>tmp :tabm -1<CR>

      " tab move right
      nnoremap <silent> <leader>tmn :tabm +1<CR>

      " tab move last
      nnoremap <silent> <leader>tml :tabm<CR>


" Saving

   " Current window
   nmap <c-a> :w<CR>

   " All
   map <c-a>a :wa<CR>

   " Session
     " Resume session from bash with:  vim -S <session filename>
   set sessionoptions-=buffers
   set sessionoptions-=globals
   set sessionoptions+=winsize
   set sessionoptions+=winpos


   function! DoSessionSave()
      :wa
      exec "mksession! " . v:this_session
   endfunction

   " saves all files and saves session
   nmap <silent> <F12> :call DoSessionSave()<CR>



   " Map ctrl-s to save
      " For these commands to work, need to disable how the terminal interprets ctrl-s, such as add "stty -ixon" in ~/.bashrc
   nnoremap <silent><c-s> :<c-u>update<cr>
   vnoremap <silent><c-s> <c-c>:update<cr>gv
   inoremap <silent><c-s> <c-o>:update<cr>


" Jump to file
map gf <C-w><C-f><C-w>T  " Open file in tab
map wgf <C-w><C-f>       " Open file in top horizontal split



" Toggle the indicators for invisible characters
map <leader>ic :set list!<CR>
set listchars=eol:.,tab:>-,trail:~,extends:>,precedes:<


" Set working directory for window
map <c-r> :lcd %:h<CR>


" Folding.  Setup but turn off.
set foldmethod=syntax
set foldlevel=1
"set foldenable
set nofoldenable



" Toggle for paste/nopaste to enable/disable indent, braces completion, etc.
map <leader>sp :set paste<CR>
map <leader>sn :set nopaste<CR>



" =====================================================
" Additional keywords to highlight
:match Todo /\(todo\|fixme\|DEBUG\|debug\)/



" =====================================================
" =====================================================
" =====================================================
" Scripts 


" =====================================================
" Rename tabs to show tab number
   " From http://superuser.com/questions/331272/vim-show-the-index-of-tabs-in-the-tabline
   " Which is based on: http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function

if exists("+showtabline")

    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1

        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')
            let s .= '%#TabNum#'
            let s .= i
            " let s .= '%*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')

            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif

            if file == ''
                let file = '[No Name]'
            endif

            let s .= ' ' . file . ' '
            let i = i + 1
        endwhile

        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')

        return s
    endfunction

    set stal=2
    set tabline=%!MyTabLine()

    set showtabline=1
    highlight link TabNum Special
endif



" =====================================================
" =====================================================
" =====================================================
" Plugins normally built into vim


" File explorer
   " Uses 'netrw' plugin normally built into vim
   " Key mappings:  https://gist.github.com/danidiaz/37a69305e2ed3319bfff9631175c5d0f
map <silent> <leader>fe :Vexplore<CR>
let g:netrw_banner=0         " Remove banner
let g:netrw_liststyle=4      " Listing style as tree
let g:netrw_browse_split=2   " Open files in new vertical split
let g:netrw_altv=1           " Open in right vertical split
let g:netrw_winsize=25       " Fixes width of directory explorer to 25% of page

" The following two code blocks prevent 'netrw' plugin from overwriting the
" window movement mapping.
" https://github.com/christoomey/vim-tmux-navigator/issues/189
augroup netrw_mapping
   autocmd!
   autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
   nnoremap <buffer> <c-l> :wincmd l<cr>
endfunction



" =====================================================
" =====================================================
" =====================================================
" source '~/.vimrc-ide' if it exists

if filereadable( expand( '~/.vimrc-ide' ) )
   source ~/.vimrc-ide
endif
