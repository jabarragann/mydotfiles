Configuration for Jopling vimrc using <https://github.com/personalizedrefrigerator/joplin-plugin-codemirror-vimrc>

> [!IMPORTANT]
> Make sure to activate the vim keyboard in `options`->`general`->`advance_options`->`keyboard`.

```
" A .vimrc-like file. At present, very little is supported.
" You can use the commands:
"   inoremap, vnoremap, nnoremap
"   imap, nmap, vmap
"   unmap
" Because commands are passed directly to CodeMirror's VIM API,
" insert-mode mappings seem to be unable to insert text.
"

" Examples:

" Allow copying/pasting with ctrl+c and ctrl+v when in insert mode.
unmap <C-c>
unmap <C-v>

" Map jk to Escape in insert mode:
imap jk <Esc>

" Adapt up and down navigation
nmap j gj
nmap k gk
```
