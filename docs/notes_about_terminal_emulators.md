# Notes about terminal emulators

The following is an effort to standardize the keyboard shortcuts of the terminal emulators I used in Linux and Windows. Setup notes for Terminator and Windows terminal. 

## Setup

To set up a new terminal you need to update the keyboard shortcuts and install fonts.

### Windows instructions
1) Download fonts.
2) right click on the fonts and then select install
3) Select the font in WindowsTerminal in `settings->specific_profile-> appearance fonts` 

**Additional settings in VIM**
* Vim visual mode does not look good by default in Windows terminal

https://stackoverflow.com/questions/31950035/changing-text-selection-color-in-visual-mode-in-vim

```
set background=dark
```
Take a look at `:help 'background'`

**Notes:**
New Hack nerd fonts only work with the latest version of nnn.

## List keyboard shortcuts

**Pane navigation shortcuts**

| Action                 | Shorcut         |
|------------------------|-----------------|
| Move focus up          | alt+k           |
| Move focus down        | alt+j           |
| Move focus left        | alt+h           |
| Move focus right       | alt+l           |
| resize up              | alt+shift+k     |
| resize down            | alt+shift+j     |
| resize left            | alt+shift+h     |
| resize right           | alt+shift+l     |
| zoom (maximize) toggle | ctrl+shift+x    |
| increase font          | ctrl+shift+plus |
| decrease font          | crtl+minus      |
| Split horizontally     | ctrl+shift+o    |
| split vertically       | crtl+shift+e    |
| close pane             | ctrl+shift+w    |
|------------------------|-----------------|

**tab navigation shortcuts**
TODO
