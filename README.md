# Neo-Vim-Starter-Pack

>A guided configuration  to setup your neo-vim as a fully featured IDE
>![Project Banner](./Images/Repo-Banner.png)

<br>

* ##  ✏️  Create a config file for your neo-vim

```html
  mkdir ~/.config/nvim
  touch ~/.config/nvim/init.vim
```

> *  All configurations will be stored in the  **nvim** folder created within your .config folder 
> * The  **init.vim** file  will be responsible for all your neovim configuration

<br>

* ##  🔌  Install Vim-Plug to manage plugins for neo-vim

```html
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
> *  This will create an **autoload directory** inside your nvim folder and install **vim-plug** there.
> *  The autoload directory is necessaary as it instructs everything in it, here vim-plug  to **automatically load** when neovim starts up.
> *  [Referr here](https://github.com/junegunn/vim-plug) for more information.

<br>

* ##  💡  Setup plugins for neo-vim

```html
mkdir ~/.config/nvim/vim-plug
touch ~/.config/nvim/vim-plug/plugins.vim
```
> *  All plugin configurations will be stored in the  **vim-plug** folder created within your nvim folder. 
> * The  **plugins.vim** file  will be responsible for all your plugins configuration.

<br>

Copy this into your **plugins.vim** and save it

```html
" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support

    Plug 'sheerun/vim-polyglot'

    " File Explorer
    Plug 'scrooloose/NERDTree'

    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'

call plug#end()
```

> *  This will make sure that all your plugins are installed within the autoload directory and starts up properly everytime you load neovim.
> *  For getting started we have added some very basic plugins like **autopairs** for brackets, **vim-polygot** for better syntax hilighting and **nerd tree** to navigate directories.

<br>

Now add this to your **init.vim** 

```html
source $HOME/.config/nvim/vim-plug/plugins.vim
```
> *  This will **source** all your **plugin configuration** to init.vim which will instruct neovim about the plugins
> *  Its best practice to create such seperate directories and store configurations and later sourcing them instead of messing up our init.vim file

<br>

* ##  📥  Install your plugins

Open up neo-vim and run :

```html
:PlugInstall
```
> * This would **install** all the plugins we added in our **plugins.vim** file.




Here are some other useful commands pertaining to plugins
| Command                        | Action                                                               |  
| :----------------------------: | :-----------------------------------------------------------------:  |                                     
| :PlugStatus                    |   Check wether all plugins are insalled **correctly.**               | 
| :PlugClean                     |   Remove plugins which are no longer defined in **plugins.vim.**     |
| :PlugUpdate                    |   **Update** all your plugins.                                       |
| :PlugUpgrade                   |   Update **vim-plug.**                                               |

<br>

* ## ⚙️  Neo-vim settings for easy of use

```html
mkdir ~/.config/nvim/general
touch ~/.config/nvim/general/settings.vim
```

> *  All settings will be stored in the  **general** folder created within your nvim folder 
> * The  **settings.vim** file  will be responsible for all your neovim settings.

Now install the following dependencies :

```html
sudo pacman -S xsel 
pip install pynvim
npm i -g neovim
```

> * **xsel** will be our **clipboard manager** which will allow us to copy and paste as declared to be declared in our **settings.vim**.
> * Use your default package manager instead of pacman  if you dont use a arch based distribution.
> * **pynvim** will add python support to neo-vim and neovim adds nodejs support to neo-vim 

Copy this into your **settings.vim** file 

```html
" set leader key
let g:mapleader = "\<Space>"

syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			            " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=0                        " Always display the status line
set number                              " Line numbers
"set cursorline                          " Enable highlighting of the current line (uncomment if u need it)
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
"set autochdir                           " Your working directory will always be the same as your working directory (uncomment if u need it)

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

```

> * These will be our general settings for neo-vim.
> * These settings will try to replicate an ide as much as possible.
> * Settings like **copy/paste** , **syntax highlighting**, **mouse clicking** to move cursor and more  will be enabled. 

Finally source your settings in the **init.vim** file

```html
source $HOME/.config/nvim/general/settings.vim
```
Use the following command in nvim to source it without saving and restarting neovim

```html
:source $MYVIMRC
```
> * By default when you **source** something in your init.vim it is **applied** when neo-vim is **restarted**.
> * :source $MYVIMRC allows us to **apply** it **without restarting**.
> * In our settings.vim we have set to **apply :source $MYVIMRC automatically** when we **source** something  this is better than  using commands or restarting.


* ##  👨‍⚕️  Grt healthy
