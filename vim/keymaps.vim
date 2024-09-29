
"For debuggin
"echo "source key maps" 

let mapleader="\\"

" Testing
nnoremap <leader>! :echo "hello world!"<CR> 

"""""""""""""""""
"Markdown editing
"""""""""""""""""

" surround word with ticks
" This needs to be a recursive mapping.
nmap <leader>` ysiw`

" Surround visual selection with markdown code block
" gv in normal mode selects last visual selection
" o in visual line mode moves you up and down the block visual block
vnoremap <leader>` <Esc>O```<Esc>gvo<Esc>o```<Esc>

