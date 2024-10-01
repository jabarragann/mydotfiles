

"""""""""""""
" General Vim
"""""""""""""

" let mapleader="\\"
let mapleader=" "

"Remapping of Esc key
imap jk <Esc>

"Mapping to turn of search matches quickly
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

"Smart identation
"keep visual mode after indent
vnoremap > >gv
vnoremap < <gv

" MOVE LINES UP AND DOWN
" Taken from: https://vimtricks.com/p/vimtrick-moving-lines/
nnoremap <c-j> :m .+1<CR>==
nnoremap <c-k> :m .-2<CR>==
inoremap <c-j> <Esc>:m .+1<CR>==gi
inoremap <c-k> <Esc>:m .-2<CR>==gi
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv

" Source vimrc
:nnoremap <leader>sv :source $MYVIMRC<cr>

" Run last macro  
:nnoremap <leader>q @@

" Testing
nnoremap <leader>! :echo "hello world!"<CR> 

"For debuggin
"echo "source key maps" 


"""""
" FZF
"""""

nnoremap <C-p> :Files <CR> 
nnoremap <leader>g :GFiles <CR>
nnoremap <leader>b :Buffers <CR>

""""""""""""""""""
" Markdown editing
""""""""""""""""""

" surround word with ticks
" This needs to be a recursive mapping.
nmap <leader>` ysiw`

" Surround visual selection with markdown code block
" gv in normal mode selects last visual selection
" o in visual line mode moves you up and down the block visual block
vnoremap <leader>` <Esc>O```<Esc>gvo<Esc>o```<Esc>

