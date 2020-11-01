# Neo-Vim-Starter-Pack

>A guided configuration  to setup your neo-vim as a fully featured IDE
>![Project Banner](./Images/Repo-Banner.png)

<br>

* ##  Create a config file for your neo-vim

```html
  mkdir ~/.config/nvim
  touch ~/.config/nvim/init.vim
```

> *  All configurations will be stored in the  **nvim** folder created within your .config folder 
> * The  **init.vim** file  will be responsible for all your neovim configuration

* ##  Install Vim-Plug to manage plugins for neo-vim

```html
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
> *  This will create an **autoload directory** inside your nvim folder and install **vim-plug** there.
> *  The autoload directory is necessaary as it instructs everything in it, here vim-plug  to **automatically load** when neovim starts up.
> *  [Referr here](https://github.com/junegunn/vim-plug) for more information.
