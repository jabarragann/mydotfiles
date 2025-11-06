# NVIM setup notes

<!--toc:start-->
- [NVIM setup notes](#nvim-setup-notes)
  - [Shortcuts and usage.](#shortcuts-and-usage)
  - [NVIM install](#nvim-install)
  - [LSP servers and configurations](#lsp-servers-and-configurations)
    - [Marksman - Markdown](#marksman-markdown)
    - [Pyright - Python](#pyright-python)
<!--toc:end-->


## Shortcuts and usage.
* F4: Activate code actions (Generates table of content in markdown file with Marksman LSP)

## NVIM install

```
sudo apt install xclip
wget https://github.com/neovim/neovim/releases/download/v0.10.3/nvim-linux64.tar.gz
tar -xf nvim-linux64.tar.gz nvim-linux64/
ln -s /home/juan95/programs/nvim-linux64/bin/nvim /home/juan95/.local/bin/
```

## LSP servers and configurations

### Marksman - Markdown
```
wget https://github.com/artempyanykh/marksman/releases/download/2024-12-18/marksman-linux-x64
mv marksman-linux-x64 marksman
chmod +x marksman 
mv marksman ~/.local/bin/
```

### Pyright - Python
```
pip install pyright
```
