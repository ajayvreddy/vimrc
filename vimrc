filetype on
filetype plugin on
let $VIMRUNTIME="/home/ajareddy/.vim"
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'Valloric/YouCompleteMe'
Plugin 'itchyny/lightline.vim'
Plugin 'preservim/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'nlknguyen/papercolor-theme'
Plugin 'altercation/vim-colors-solarized'
Plugin 'preservim/nerdtree'
" Plugin 'xolox/vim-notes'
" Plugin 'xolox/vim-misc'
" Plugin 'dhruvasagar/vim-table-mode'
call vundle#end()

set guioptions -=m
set guioptions -=T
set guioptions -=r
set guioptions -=L
set guioptions -=e
" set guioptions -=i  "; removes the vim logo(icon)

set background=light
colorscheme solarized
" colorscheme papercolor
set lines=44 columns=999
set guifont=DejaVu\ Sans\ Mono\ 13

nnoremap <silent> <F5> :!py %<CR>
nnoremap <silent> <F8> :TagbarToggle<CR>

inoremap <silent> <C-s> <esc>:w!<cr>
noremap  <silent> <C-s> <esc>:w!<cr>
noremap  <silent> <C-w> <esc>:q!<cr>

" page up/down
map <space> <C-f>
map <S-space> <C-b>

"switch b/w tabs
inoremap <silent> <C-Tab>   <Esc>gt
noremap  <silent> <C-Tab>        gt
inoremap <silent> <C-S-Tab> <Esc>gT
noremap  <silent> <C-S-Tab>      gT

"switch b/w windows
nnoremap  <C-a>     <C-w>

"open new tab
vnoremap <C-t>  <Esc>:tabe <c-r>=expand("%:p:h") .'/' <cr>
vnoremap E      <Esc>:e    <c-r>=expand("%:p:h") .'/' <cr>
nnoremap <C-t>       :tabe 
inoremap <C-t>  <esc>:tabe 

filetype indent on
nnoremap <silent><leader>m :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
nnoremap <silent><leader>t :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
set guitablabel=\[%N\]\ %f\ %M

nnoremap ;  :
nnoremap ;; :!
:set define=^\\s*sub
set splitright
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif


set history=500 " Sets how many lines of history VIM has to remember
set autoread    " Set to auto read when a file is changed from the outside
set wildmenu    " Turn on the WiLd menu
set so=1        " Set 1 lines to the cursor - when moving vertically using j/k
set ruler       " Always show current position
set cmdheight=1 " Height of the command bar
set hid         " A buffer becomes hidden when it is abandoned

set backspace=eol,start,indent " Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l

set ignorecase
set smartcase
set hlsearch   " highlight Search guibg=Red
set incsearch 
set magic
set lazyredraw  " Don't redraw while executing macros (good performance config)
set sidescroll=1

set showmatch  " Show matching brackets when text indicator is over them
set mat=1      " How many tenths of a second to blink when matching brackets

set timeoutlen=500
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

set t_Co=256 " Enable 256 colors palette in Gnome Terminal
syntax enable
let g:solarized_termcolors=256
" Use Unix as the standard file type
set encoding=utf8    
set ffs=unix,dos,mac

nnoremap <A-a> <C-a>
nnoremap <A-x> <C-x>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowritebackup
set noswapfile
set nowrap
set noshowmode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ai   "Auto indent
set si   "Smart indent
set relativenumber
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set lbr
set textwidth=5000
" set textwidth=0
" highlight ColorColumn guibg=LightYellow
" :hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
autocmd BufEnter *.\(inc\|asm\)          :setlocal filetype=nasm
autocmd BufEnter,BufRead *.lst           :setlocal filetype=asm
autocmd BufEnter,BufRead *.\(log\|klog\) :setlocal filetype=log
autocmd BufEnter,BufRead *.\(py\)        :setlocal colorcolumn=99

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> *  y/\V<C-R>=escape(@",'/\')<CR><CR>

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Close all buffers
map <leader>bd :bufdo bd!<cr>
" python breakpoint shortcut
map <leader>b obreakpoint()<esc>

" Switch CWD to the directory of the open buffer
map <silent> <leader>cd :cd %:p:h<cr>
map <silent>;wd :echo expand('%:p')<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Always show the status line
set laststatus=2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <silent> <C-S-Down>  mz:m+<cr>`z
nmap <silent> <C-S-Up>    mz:m-2<cr>`z
vmap <silent> <C-S-Down> :m'>+<cr>`<my`>mzgv`yo`z
vmap <silent> <C-S-Up>   :m'<-2<cr>`>my`<mzgv`yo`z
" vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

:nnoremap <Leader>c :set cursorline! <CR>
set cursorline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Preserve external compatibility options, then enable full vim compatibility...
let s:save_cpo = &cpo
set cpo&vim

nmap <silent> dm  :call ForAllMatches('delete', {})<CR>
nmap <silent> dM  :call ForAllMatches('delete', {'inverse':1})<CR>
nmap <silent> ym  :call ForAllMatches('yank',   {})<CR>
nmap <silent> yM  :call ForAllMatches('yank',   {'inverse':1})<CR>

function! ForAllMatches (command, options)
    " Remember where we parked...
    let orig_pos = getpos('.')
    " Work out the implied range of lines to consider...
    let in_visual = get(a:options, 'visual', 0)
    let start_line = in_visual ? getpos("'<'")[1] : 1
    let end_line   = in_visual ? getpos("'>'")[1] : line('$')

    " Are we inverting the selection???
    let inverted = get(a:options, 'inverse', 0)

    " Are we modifying the buffer???
    let deleting = a:command == 'delete'

    " Honour smartcase (which :lvimgrep doesn't, by default)
    let sensitive = &ignorecase && &smartcase && @/ =~ '\u' ? '\C' : ''

    " Identify the lines to be operated on...
    exec 'silent lvimgrep /' . sensitive . @/ . '/j %'
    let matched_line_nums
    \ = reverse(filter(map(getloclist(0), 'v:val.lnum'), 'start_line <= v:val && v:val <= end_line'))

    " Invert the list of lines, if requested...
    if inverted
        let inverted_line_nums = range(start_line, end_line)
        for line_num in matched_line_nums
            call remove(inverted_line_nums, line_num-start_line)
        endfor
        let matched_line_nums = reverse(inverted_line_nums)
    endif

    " Filter the original lines...
    let yanked = ""
    for line_num in matched_line_nums
        " Remember yanks or deletions...
        let yanked = getline(line_num) . "\n" . yanked

        " Delete buffer lines if necessary...
        if deleting
            exec line_num . 'delete'
        endif
    endfor

    " Make yanked lines available for putting...
    " previously just let @" = yanked
    if !exists('g:YankMatches#ClipboardRegister')
        let l:clipboard_flags = split(&clipboard, ',')
        if index(l:clipboard_flags, 'unnamedplus') >= 0
            let g:YankMatches#ClipboardRegister='+'
        elseif index(l:clipboard_flags, 'unnamed') >= 0
            let g:YankMatches#ClipboardRegister='*'
        else
            let g:YankMatches#ClipboardRegister='"'
        endif
    endif
    let l:command = ':let @' . g:YankMatches#ClipboardRegister . ' = yanked'
    execute 'normal! ' . l:command . "\<cr>"

    " Return to original position...
    call setpos('.', orig_pos)

    " Report results...
    redraw
    let match_count = len(matched_line_nums)
    if match_count == 0
        unsilent echo 'Nothing to ' . a:command . ' (no matches found)'
    elseif deleting
        unsilent echo match_count . (match_count > 1 ? ' fewer lines' : ' less line')
    else
        unsilent echo match_count . ' line' . (match_count > 1 ? 's' : '') . ' yanked'
    endif
endfunction

"set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
let g:lightline = {
      \ 'component_function': { 
      \  'filename' : 'LightlineFilename'
      \ },
      \ 'component': {
      \   'lineinfo': "%{line('.') . ':' . line('$')} Col:%{col('.')}",
      \ },
      \ }

function! LightlineFilename()
  let a = getcwd()        " vim's current working directory
  let b = expand('%:p:h') " complete path of the file
  let c = expand('%:h')   " relative path to current directory
  let d = expand('%:n')   " relative path to current directory with filename
  let e = expand('%:t')   " just file name
  let ret = ""            " start with empty string
  if a == b
    return ret
  elseif c !~ "^\/"
      return ret.'/'.c
  else
      let a = substitute(a,'\/proj\/','', 'g')
      let a = substitute(a,'\/home\/ajareddy','~', 'g')
      let a = substitute(a,'verif_release_ro\/','', 'g')
      let a = substitute(a,'shell_dev\/users\/ajareddy\/','shell_dev\/', 'g')
      let c = substitute(c,'\/proj\/','', 'g')
      let c = substitute(c,'\/home\/ajareddy','~', 'g')
      let c = substitute(c,'verif_release_ro\/','', 'g')
      let c = substitute(c,'shell_dev\/users\/ajareddy\/','shell_dev\/', 'g')
      return ret.a."||". c
  endif
endfunction

noremap  <C-h>      :echom Hex_to_binary(expand('<cword>')) <CR>
vnoremap <C-h> <esc>:echom V_Hex_to_binary() <CR>

function V_Hex_to_binary()
    "when in little endian format, such as in klog, '00 7F 8A 12 34 FF AA 18' 
    " select all the bytes and then press <C-h>
    let foo = getreg("*")
    let result = split(foo)
    let reverse_res = reverse(result)
    let hex = join(reverse_res,'')
    return Hex_to_binary(hex)
endfunc

function Hex_to_binary(num)  "Hex to binary only (Not decimals)
    let str = a:num
    let actual_nr = "0x".str
    let str = substitute(str,'^0x\|^0\+\|h$\|_','','g')
    let reversed_string_list = reverse(split(str, '\w\zs'))
    let stringlen = len(reversed_string_list)
    let start_index = 0
    let last_index = 0
    let loop_times = 0
    let result = ''
    while (last_index < stringlen)
        let start_pos = 64 * loop_times
        let loop_times = loop_times + 1
        
        let last_index  = last_index + 16
        if (last_index > stringlen)
            let last_index = stringlen
        endif
        let string = reversed_string_list[start_index : (last_index-1)]
        let string = join(reverse(string),'')
        let result = Hex_64bit_binary(string, start_pos) . ' ' . start_pos . ' ' . result
        let start_index = last_index
    endwhile
    return result . ': ' . actual_nr
endfunc

function Hex_64bit_binary(num, start_pos)
    let str = a:num
    let start_pos = a:start_pos
    let msb = 0  " Bit 63- is considered a sign, so calculate it separately
    if strlen(str) == 16
        let msb_val = "0x".str[0]
        if msb_val >= 8  
            let msb = 1
            let str = substitute(str,'^.',(msb_val-8),'')
        endif
    endif
    let num = "0x".str
    let bin = ""  " holds binary representation
    let x = start_pos
    let last_pos = x + 63
    while num
      let x = x + 1  
      if x % 4 == 0
        let bin =  " ".x ." ".'01'[num % 2] . bin
      else
        let bin = '01'[num % 2] . bin
      endif
      let num = num / 2
    endwhile
    if msb == 1
        let bin =   msb .' '. last_pos .' ' . bin
    endif
    return bin . ''
endfunc
" NerdCommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
map <silent> <C-c>  \c<space>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPBuffer'
let g:perforce_prompt_on_open = 0
let g:notes_unicode_enabled = 0
let g:notes_suffix = '.txt'
