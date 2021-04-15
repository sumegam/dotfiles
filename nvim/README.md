First install NeoVim.

After installing NeoVim, install `vim-plug` plugin manager for NeoVim:

```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Then create symbolic link to `init.vim` file inside NeoVim configuration directory:

```
ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim
```
