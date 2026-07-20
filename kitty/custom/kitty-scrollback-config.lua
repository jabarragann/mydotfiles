vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- add kitty-scrollback.nvim to the runtimepath to allow us to require the kitty-scrollback module
-- pick a runtimepath that corresponds with your package manager, if you are not sure leave them all it will not cause any issues
vim.opt.runtimepath:append(vim.fn.stdpath('data') .. '/lazy/kitty-scrollback.nvim') -- lazy.nvim

require('kitty-scrollback').setup({
  -- put your kitty-scrollback.nvim configurations here
})

-- jk as <Esc> in the paste window (insert mode)
vim.keymap.set('i', 'jk', '<Esc>')

-- Visual `y` copies straight to the system clipboard and returns to kitty,
-- bypassing the paste window. (The plugin's TextYankPost hook sees register `+`
-- and quits nvim for you.) The plugin's own <leader>y / <leader>Y still work.
vim.keymap.set('v', 'y', '"+y')

-- <leader>p does a plain yank into the unnamed register, which is the
-- `paste_window.yank_register` -- so the selection lands in the paste window
-- instead of the clipboard. (noremap, so this is the builtin `y`, not the map above.)
vim.keymap.set('v', '<leader>p', 'y')

-- Optional: stop *any* yank (e.g. normal-mode yy) from opening the paste window.
-- require('kitty-scrollback').setup({ paste_window = { yank_register_enabled = false } })
