# Terminal configuration files 

## TODO:
1. Easy way to setup my github ssh access
2. Add shebangs to my scripts
3. Automatically compile NNN without sudo 
   1. Without sudo you need to compile and then manually add to path. 
4. Add compiled nnn to path
5. Add way of cleaning/removing all software

# Local configurations
Add all local configurations in `~/.bashrc.local`. This file is loaded by default if it exists.
# Installation steps 
1. Enable github ssh
2. Enable fonts in terminal

**Installation script**
```bash
./install.sh
```
**NNN installation**

```bash
# Without sudo access
make O_NERD=1
# With sudo access
sudo make O_NERD=1 strip install
```
