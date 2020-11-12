# Neo-Vim-Starter-Pack
![Neovim version](https://img.shields.io/badge/NVIM-v0.4.4-blue)
![Linux Kernel version](https://img.shields.io/badge/Linux-5.8.18-blue)
>A guided configuration  to setup your neo-vim as a fully featured IDE
>![Project Banner](./Images/Repo-Banner.png)

<br>

* ##  ✏️  Create a config file for your neo-vim

```html
  mkdir ~/.config/nvim
  touch ~/.config/nvim/init.vim
```

> *  All configurations will be stored in the  **nvim** folder created within your .config folder. 
> * The  **init.vim** file  will be responsible for all your neovim configuration.

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
> *  This will **source** all your **plugin configuration** to init.vim which will instruct neovim about the plugins.
> *  Its best practice to create such seperate directories and store configurations and later sourcing them instead of messing up our init.vim file.

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

> *  All settings will be stored in the  **general** folder created within your nvim folder. 
> * The  **settings.vim** file  will be responsible for all your neovim settings.

Now install the following dependencies :

```html
sudo pacman -S xsel 
pip install pynvim
npm i -g neovim
```

> * **xsel** will be our **clipboard manager** which will allow us to copy and paste as declared to be declared in our **settings.vim**.
> * Use your default package manager instead of pacman  if you dont use a arch based distribution.
> * **pynvim** will add python support to neo-vim and neovim adds nodejs support to neo-vim. 

Copy this into your **settings.vim** file. 

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

Finally source your settings in the **init.vim** file.

```html
source $HOME/.config/nvim/general/settings.vim
```
Use the following command in nvim to **source** it **without** saving and **restarting** neovim.

```html
:source $MYVIMRC
```
> * By default when you **source** something in your init.vim it is **applied** when neo-vim is **restarted**.
> * :source $MYVIMRC allows us to **apply** it **without restarting**.
> * In our settings.vim we have set to **apply :source $MYVIMRC automatically** when we **source** something  this is better than  using commands or restarting.

<br>

* ##  👨‍⚕️  Get healthy


```html
:checkhealth
```
> * This command will check wether all your **plugins** are **installed correctly**.
> * You will also be notified if there are any **missing dependencies**. 

<br>

* ## ⌨️  Setup Keybindings for neo-vim

```html
mkdir ~/.config/nvim/keys
touch ~/.config/nvim/keys/mappings.vim
```

> *  All settings will be stored in the  **keys** folder created within your nvim folder. 
> * The  **mappings.vim** file  will be responsible for all your neovim settings.

Now copy the following in your **mappings.vim** file.

```html
" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" Entering j&k will work same as Esc now 
inoremap jk <Esc>
inoremap kj <Esc>

" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Alternate way to save
nnoremap <C-s> :w<CR>
" Alternate way to quit
nnoremap <C-Q> :wq!<CR>
" Use control-c instead of escape
nnoremap <C-c> <Esc>
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da
```
> * These will be our keybindings for neo-vim. These bindings will enable
> * **Better navigation** for omnicomplete.
> * Allow to quick **enter and exit** *Insert mode* with keys **j&k** rapidly pressed after one another.
> * **Alt** key  can now be used to resize windows.
> * Press **Ctrl+U** over a word to capatilise it.
> * **Tab** key can now be used to **switch** between **buffers** and for **completion**.
> * **Ctrl+S** will now save your file and **Ctrl+Q** will now **save and exit** neovim. 
> * **Better tabbing , window navigation** will now be **enabled**. 

Finally source your mappings in the **init.vim** file.

```html
source $HOME/.config/nvim/keys/mappings.vim
```
<br>

* ## 🎴 Setting up a theme for neo-vim.

<p>Now that you have made your neo-vim much like an IDE. Lets themify it!<p/>
<p> Configuring anything is a usually long proscess one might loose their interest midway. Having a visually appealing theme might keep u interested in further customization.<p/>
<p>Theme to be used in this config is Onedark. <p/>

```html
mkdir ~/.config/nvim/themes
touch ~/.config/nvim/themes/onedark.vim
```
> *  All theme configurations will be stored in the  **themes** folder created within your nvim folder. 
> * The  **onedark.vim** file  will be responsible for the onedark theme's configuration used in neo-vim.

Now add the following to your **onedark.vim** file.

```html
" onedark.vim override: Don't set a background color when running in a terminal;
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

hi Comment cterm=italic
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
let g:onedark_termcolors=256

syntax on
colorscheme onedark


" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
```

Add the following in your **plugins.vim** file.

```html
Plug 'joshdick/onedark.vim'
```
> * The onedark theme will be installed via our plugin manager i.e **vim-plug**. 
> * Hence this has to be **added** to your **plugins.vim** file.


Source your theme in the **init.vim** file.


```html
source $HOME/.config/nvim/themes/onedark.vim
```
Finally run this command in neo-vim to install your theme.

```html
:PlugInstall
```
> * This should **install** your theme . 
> * If the theme does **not** apply then **restart** neo-vim.
> * You can find several **other themes** [here.](https://vimcolorschemes.com/) 
> * Installation **procedure** is **same** as the one used in this configuration.

<br>

* ## 🌈 Setting up a clorizer for neo-vim

```html
mkdir ~/.config/nvim/lua
touch ~/.config/nvim/lua/plug-colorizer.lua
```
> *  This will create an **lua** inside your nvim folder .
> *  The lua foler will contain **plug-colorizer.lua** file which will be responsible for our colorizer plugin's config.

Add this to your **plugins.vim** file

```html
Plug 'norcalli/nvim-colorizer.lua'
```
> * This will install our colorizer for neo-vim
> * The colorizer will be installed via **vim-plug**,hence this has to be added to the **plugins.vim** file.

Now add this to our  **plug-colorizer.lua** 

```html
require'colorizer'.setup(
  {'*';},
  {
    RGB      = true;         -- #RGB hex codes
	  RRGGBB   = true;         -- #RRGGBB hex codes
	  names    = true;         -- "Name" codes like Blue
	  RRGGBBAA = true;         -- #RRGGBBAA hex codes
	  rgb_fn   = true;         -- CSS rgb() and rgba() functions
	  hsl_fn   = true;         -- CSS hsl() and hsla() functions
	  css      = true;         -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
	  css_fn   = true;         -- Enable all CSS *functions*: rgb_fn, hsl_fn
  })
```
> * This will enable our colorizer to highlight colors with their respective colors.

Finally **source** our config to **init.vim**.

```html
lua require'plug-colorizer'
```
<br>

* ## 📏 Install a status line for neo-vim
### Setup Dependencies

<p>
Make sure you have [nerd fonts](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack) installed.
<p/>

Then add the following in your **plugins.vim** file.
```html
Plug 'ryanoasis/vim-devicons'
```

