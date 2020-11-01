# Neo-Vim-Starter-Pack

>A guided configuration  to setup your neo-vim as a fully featured IDE
>![Project Banner](./Images/Repo-Banner.png)

<br>

* ##  Create a config file for your neovim

> *  All configurations will be stored in the  **nvim** folder created within your .config folder 
> * The  **init.vim** file  will be responsible for all your neovim configuration

```html
  mkdir ~/.config/nvim
  touch ~/.config/nvim/init.vim
```
* ##  Install and setup Vim-Plug to manage plugins for vim


```html
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
