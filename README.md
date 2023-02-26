# vim-ide
<img align="right" width="50%" alt="Screenshot of vim-ide editing Java" src="https://user-images.githubusercontent.com/60242848/179606812-0fe4032a-0a9d-4c13-9649-2c5634b3f843.png">
vim-ide provides a seemless IDE experience with vim, using an opinionated configuration that includes integration of carefully selected plugins for necessary functionality.

Focus on software engineering and not on setting up and debugging your IDE.

Why a vim-based IDE?
1. Buffers provide an extra dimension to quickly access and manipulate files, in addition to windows and tabs provided by most IDEs
2. Efficient use of screen space, thanks to a keyboard-based command paradigm (fewer menu bars) and dynamic windows
3. More quickly execute productive actions using keyboard command sequences
4. Leverage the same efficiency in muscle-memory between IDE and other file manipulation work
5. Small resource (CPU, memory, and storage) footprint
6. Fast startup time
7. Low-latency response from key press to action
8. Extensive documentation, tutorials, and help from a robust user community
9. Large assortment of plugins for new functionality
10. Highly configurable
11. Open source
12. No cost


# Table of Contents
1. [Purpose](#purpose)
2. [Key Capabilities](#key-capabilities)
3. [Screenshots](#screenshots)
4. [Installation](#installation)
   1. [IDE Installation](#ide-installation)
   2. [Portable (Non-IDE) Functionality](#portable-non-ide-installation)
5. [Updating](#updating)
   1. [IDE Update](#ide-update)
   2. [Portable (Non-IDE) Update](#portable-non-ide-update)
6. [Usage](#usage)
7. [Limitations](#limitations)
8. [License](#license)


# Purpose
vim-ide provides a unified IDE experience.  vim-ide takes an opinionated approach of defining shortcuts for frequently-used commands and adding only necessary functionality by curating and integrating vim plugins, all while working with native vim settings that you already know.  That means less time configuring your IDE, and more time toward productive software engineering.

Given that projects often include a heterogenous mix of tools, vim-ide offers source manipulation capabilities and IDE functionality to cover a variety of programming languages and file types (e.g., JavaScript, Python, PHP, bash, Docker build/compose/swarm files, Ansible playbooks, etc.).  vim-ide includes specific enhancements for Java (where much of my software development has focused) and Clojure (where much of my development is shifting).

vim-ide also allows for a portable configuration and consistent user experience on systems where IDE functionality isn't needed.

In summary, the purpose of vim-ide includes:
1. Use vim as an IDE for a variety of langauges with emphasis on Java and Clojure
2. Define a portable vim configuration for familiar vim interaction on environments where IDE functionality isn't necessary


# Key Capabilities
Key capabilities of vim-ide include:
1. File explorer
2. Syntax highlighting
3. Code autocompletion
4. Code minimap
5. Code tag menu
6. Comment handling
7. Enhanced status line
8. Clojure REPL integration
9. Clojure symbolic expression (S-expression) handling
10. Window, tab, and buffer motion shortcuts
11. Theme/colors
12. Plugin management


# Screenshots
<p align="center">
<img width="75%" alt="Screenshot of vim-ide editing Java" src="https://user-images.githubusercontent.com/60242848/179606812-0fe4032a-0a9d-4c13-9649-2c5634b3f843.png">
</p>
<p align="center">Figure 1 -- Java Code Editing</p>

<p align="center">
<img width="75%" alt="Screenshot of vim-ide editing Clojure" src="https://user-images.githubusercontent.com/60242848/179606850-002eb321-53dc-4e2e-aa6f-ca6d0c1a1327.png">
</p>
<p align="center">Figure 2 -- Clojure Code Editing</p>



# Installation
Installation can setup the full IDE functionality (see [IDE Installation](#ide-installation)) or portable e.g. non-IDE functionality (see [Portable (Non-IDE) Functionality](#portable-non-ide-installation)).

Some of the commands may be specific to Debian-based Linux distributions (inluding Ubuntu).  If you aren't using a Debian-based Linux distribution, then consult your distro's documentation.

## IDE Installation
The following instructions setup vim-ide with full IDE functionality, which requires downloading plugins.  WARNING:  before proceeding, backup your ~/.vimrc and ~/.vimrc-ide files if they exist and you made custom modifications.
1. Install (or update) vim. [neoclide/coc.nvim](https://github.com/neoclide/coc.nvim) requires vim 8.2.0750 or later (or Neovim 0.4.0 or later).
   1. sudo apt-get update
   2. sudo apt-get install vim
2. Install Node.js with one of the following options.  Node.js is required for code autocompletion provided by [neoclide/coc.nvim](https://github.com/neoclide/coc.nvim).  Note that Node.js 14.14 or greater is required; installing Node.js through your distro's package manager often installs a much older version than is current.  If you already have Node.js installed, then check the version of Node.js with 'node --version'.  For more details, see [neoclide/coc.nvim](https://github.com/neoclide/coc.nvim).
   1. OPTION 1 (RECOMMENDED):  Install Node.js with with [Node Version Manager (nvm)](https://github.com/nvm-sh/nvm).  nvm can install multiple versions of Node.js, and switch between the different versions. nvm is a great choice for development environments; do not use in production.
      1. Install nvm
         1. curl https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
      2. Install the latest version of Node.js with Long Term Support (LTS)
         1. nvm install --lts
      3. Check the current active version of Node.js.
         1. node --version
   2. OPTION 2: Install Node.js with a [script](https://github.com/vercel/install-node)
      1. Create a directory to hold the installation of Node.js, such as ~/.nodejs
         1. mkdir ~/.nodejs
      2. Run the script to install the latest LTS version of Node.js
         1. curl -sfLS install-node.vercel.app/lts | bash -s -- --prefix=~/.nodejs
      3. Add the path to the Node.js installation's "bin" directory to the path in ~/.bashrc
      4. Check the current active version of Node.js.
         1. node --version
   3. OPTION 3: Install Node.js manually
      1. Download Node.js from [Node.js](https://nodejs.org/en/download/)
      2. Create a directory to hold the installation of Node.js, such as ~/.nodejs
         1. mkdir ~/.nodejs
      3. Untar and unzip the Node.js downloaded file to the directory created above
         1. tar xvf <file> -C ~/.nodejs
      4. Add the path to the Node.js installation's "bin" directory to the path in ~/.bashrc
      5. Check the current active version of Node.js.
         1. node --version
3. Install code-minimap, which is required by [wfxr/minimap.vim](https://github.com/wfxr/minimap.vim).
   1. sudo apt install cargo
   2. cargo install --locked code-minimap
   3. Add the following code to the end of your ~/.bashrc
```
if [ -d "$HOME/.cargo/bin" ] ; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi
```
   3. source ~/.bashrc
   4. Verify that code-minimap is installed
      1. code-minimap --version 
4. Add the following to ~/.bashrc, which causes the terminal to pass CTRL-S to vim (which is used to save the file vs. causing the terminal to hang).
   1. stty -ixon
5. Download "vimrc" and "vimrc-ide", and move/rename as "\~/.vimrc" and "\~/.vimrc-ide".
6. Start vim.  Plugins will install automatically install.
   1. vi
7. Disregard the error message on startup (press "enter"), which occurs because a plugin isn't available (it will be installed).
8. Wait for the plugins to install.  Press "enter" to dismiss the error message and "q" to dismiss the installation window.
9. For Clojure REPL support, see 'Clojure REPL Support' in the [Usage](#usage) section.

If you encounter problems, first backup then remove directories under ~/.vim/ 'autoload', 'plugged' and try again.  If that failes, then force install by:
1. Start vim
   1. vi
2. Source the new vimrc file
   1. :so ~/.vimrc
3. Install plugins
   1. :IdeInit

## Portable (Non-IDE) Installation
The following instructions setup vim-ide without IDE functionality.  WARNING:  before proceeding, backup your ~/.vimrc file if it exists and you made custom modifications.
1. Install (or update) vim. [neoclide/coc.nvim](https://github.com/neoclide/coc.nvim) requires vim 8.1.1719 or later (or Neovim 0.4.0 or later).
   1. sudo apt-get update
   2. sudo apt-get install vim
2. Add the following to ~/.bashrc, which causes the terminal to pass CTRL-S to vim (which is used to save the file vs. causing the terminal to hang).
   1. stty -ixon
3. Download "vimrc", and move/rename as "~/.vimrc".
4. Start vim
   1. vi
5. Source the new vimrc file to ensure that vim is seeing the current configuration.
   1. :so ~/.vimrc


# Updating
Updates are different for full IDE functionality (see [IDE Update](#ide-update)) or portable e.g. non-IDE functionality (see [Portable (Non-IDE) Update](#portable-non-ide-update)).

## IDE Update
The following instructions update vim-ide.  WARNING:  before proceeding, backup your ~/.vimrc and ~/.vimrc-ide files if they exist and you made custom modifications.
1. Check if new versions of "vimrc" or "vimrc-ide" are available and, if so, download and move/rename as ~/.vimrc and ~/.vimrc-ide.
2. Start vim.
   1. vi
3. Run the update command.  Follow the directions at the bottom of the screen.
   1. :IdeUpdate


## Portable (Non-IDE) Update
The following instructions update vim-ide without IDE functionality.  WARNING:  before proceeding, backup your ~/.vimrc file if it exists and you made custom modifications.
1. Check if a new versions of "vimrc" is available and, if so, download and move/rename  as ~/.vimrc.
2. Start vim
   1. vi
3. Source the new vimrc file to ensure that vim is seeing the current configuration.
   1. :so ~/.vimrc


# Usage

This section provides key command mappings for using vim-ide.  Command mappings for vim-ide shouldn't interfere with vim's default command mappings; the vim commands you know will still work.  This section is by no means intended to be an exhaustive listing of vim command mappings--just those key and useful for vim-ide--so you are encouraged to seek out additional vim commands suited to your workflow.

vim (and thus vim-ide) has a fundamental difference from other text editors and IDEs, and understanding and leveraging that difference is key to the efficiency that vim can provide over those other tools.  While most editors use windows and tabs (like vim), vim also adds buffers which provide an additional dimension for accessing and manipulating files.  Learning how to use vim buffers can enhance your productivity in vim.  See also the specific buffer command shortcuts in *Opening buffers*, *Listing buffers*, and *Navigating buffers*.


**Settings**
1. The leader key is \<space\>
2. Tab uses three spaces vs. an actual tab character
3. Window splits occur to the right for a vertical split or bottom for a horizontal split, which are more natural
4. Mouse functionality is enabled.  Use \<Shift\> and mouse press and drag to highlight and copy.


**General**

| Command | vim Default | Available in Portable | Description |
| --- | --- | --- | --- |
| jk | no | yes | Exit insert mode and go to command mode, e.g. \<ESC\> |
| \<leader\>ln | no | yes | Toggle line numbering |
| \<space\>ic | no | yes | Toggle indicator for invisible characters |
| \<space\>lw | no | yes | Toggle line wrap |
| \<space\>il | no | no | Toggle indent line indicators |
| \\\ | no | yes | Clear search |
| gf | yes | yes | Jump to file under cursor, opening in same window |
| \<Ctrl-w\>f | yes | yes | Jump to file under cursor, opening in a new window  |
| \<Ctrl-w\>gf | yes | yes | Jump to file under cursor, opening in a new tab  |
| u | yes | yes | Undo  |
| \<space\>fe | no | yes | Open file explorer |


**Opening buffers**

| Command | vim Default | Available in Portable | Description |
| --- | --- | --- | --- |
| \<space\>be | no | yes | Open buffer and hide current one; new buffer if no filename given |
| \<space\>bh | no | yes | Open buffer in current window using horizontal split; new buffer if no filename given |
| \<space\>bv | no | yes | Open buffer in current window using vertical split; new buffer if no filename given |
| gf | yes | yes | Jump to file under cursor, opening in same window |
| \<Ctrl-w\>f | yes | yes | Jump to file under cursor, opening in a new window  |


**Listing buffers**

| Command | vim Default | Available in Portable | Description |
| --- | --- | --- | --- |
| \<space\>bl | no | yes | List buffers |
| \<space\>bs | no | yes | List and select buffers |


**Navigating buffers**

| Command | vim Default | Available in Portable | Description |
| --- | --- | --- | --- |
| :bnext | yes | yes | Go to next buffer |
| :b \<name\> | yes | yes | Go to that buffer name |
| :b{N} | yes | yes | Go to buffer # N |
| \<space\>bb | no | yes | Jump to last buffer |
| \<space\>bd | no | yes | Close buffer |
| \<space\>bk | no | yes | Kill buffer |


**Splitting windows**

| Command | vim Default | Available in Portable | Description |
| --- | --- | --- | --- |
| \<Ctrl-w\>s | yes | yes | Horizontal split current window |
| \<Ctrl-w\>v | yes | yes | Vertical split current window |
| \<Ctrl-w\>R | yes | yes | Swap top/bottom left/right windows |


**Navigating windows**

| Command | vim Default | Available in Portable | Description |
| --- | --- | --- | --- |
| \<Ctrl-h\> | no | yes | Move cursor left a window |
| \<Ctrl-j\> | no | yes | Move cursor down a window |
| \<Ctrl-k\> | no | yes | Move cursor up a window |
| \<Ctrl-l\> | no | yes | Move cursor right a window |


**Sizing windows**

| Command | vim Default | Available in Portable | Description |
| --- | --- | --- | --- |
| \<Ctrl-Right\> | no | yes | Increase window width |
| \<Ctrl-Left\> | no | yes | Decrease window width |
| \<Ctrl-Up\> | no | yes | Increase window height |
| \<Ctrl-Down\> | no | yes | Decrease window height |
| \<Ctrl-w\>e | no | yes | Set window to max height |
| \<Ctrl-w\>w | no | yes | Set window to max width |
| \<Ctrl-w\>m | no | yes | Set window to max height and width |
| \<Ctrl-w\>b | no | yes | Balance all windows height and width |
| \<Ctrl-w\>o | yes | yes | Close all windows but the current one |


**Opening tabs**

| Command | vim Default | Available in Portable | Description |
| --- | --- | --- | --- |
| \<Ctrl-w\>t | no | yes | Open current window in a tab (retains window in original tab) |
| \<Ctrl-w\>T | yes | yes | Move current window to a tab (does not retain window in original tab) |
| \<space\>to | no | yes | Open new tab |
| \<Ctrl-w\>gf | yes | yes | Jump to file under cursor, opening in a new tab  |


**Navigating tabs**

| Command | vim Default | Available in Portable | Description |
| --- | --- | --- | --- |
| {N}gT | yes | yes | Go to tab number N |
| \<space\>tn | no | yes | Go to next tab |
| \<space\>tp | no | yes | Go to prevous tab |


**Positioning tabs**

| Command | vim Default | Available in Portable | Description |
| --- | --- | --- | --- |
| \<space\>tmf | no | yes | Position tab as first tab |
| \<space\>tmp | no | yes | Position tab left one tab |
| \<space\>tmn | no | yes | Position tab right one tab |
| \<space\>tml | no | yes | Position tab as last tab |


**Saving**

| Command | vim Default | Available in Portable | Description |
| --- | --- | --- | --- |
| :w | yes | yes | Save current buffer |
| \<Ctrl-s\> | no | yes | Save current buffer |
| :wa | yes | yes | Save all buffers |
| \<Ctrl-a\> | no | yes | Save all buffers |
| \<F12\> | no | yes | Save all buffers, and save session (default "~/Session.vim").  Resume from bash: "vi -S Session.vim" |


**Coding**

| Command | vim Default | Available in Portable | Description |
| --- | --- | --- | --- |
| \<space\>fe | no | yes | Open file explorer |
| \<space\>tt | no | no | Toggle tag bar |
| \<space\>mt | no | no | Toggle minimap |
| \<space\>mr | no | no | Refresh minimap |
| gcc | no | no | Un/comment a line |
| gc | no | no | Un/comment a visual selection |
| gc5k | no | no | Un/comment 5 lines up |
| gc5j | no | no | Un/comment 5 lines down |
| \<Enter\> | no | no | Select first autocomplete option |
| \<Esc\> | no | no | Clear autocomplete menu |
| \<Tab\> | no | no | Next item in autocomplete menu |
| \<Up\> | no | no | Next item in autocomplete menu |
| \<Shift-Tab\> | no | no | Previous item in autocomplete menu |
| \<Right\> | no | no | Previous item in autocomplete menu |


**Clojure specific**

Clojure REPL support:
1. Include the cider-nrepl library '[cider/cider-nrepl "0.27.3"]' in the 'dependencies' vector in your 'project.clj' file.  The 'dependencies' vector may look like:  ':dependencies \[\[org.clojure/clojure "1.10.0"][cider/cider-nrepl "0.27.3"]]'.
   1. For more details, see [tpope/vim-fireplace](https://github.com/tpope/vim-fireplace) and [cider-nrepl](https://docs.cider.mx/cider-nrepl/usage.html).
   2. NOTE:  The cider-nrepl documentation says to declare the cider-nrepl library as a plugin e.g. ':plugins [[cider/cider-nrepl "0.27.3"]]', however this method failed.  Defining the cider-nrepl library in the 'dependencies' vector as above worked.
2. REPL-related commands require a running REPL **prior** to opening a Clojure file; the REPL may be started with a command such as "lein repl" from a Clojure project directory.


| Command | vim Default | Available in Portable | Description |
| --- | --- | --- | --- |
| \<leader\>pe | no | no | Toggle paredit on and off |
| cpp | no | no | Evaluate expression under cursor in REPL |
| cqq | no | no | Bring up command line window with innermost form at cursor populated, ready to evaluate in REPL |
| cqc | no | no | Bring up command line window with innermost form at cursor populated with a blank line in insert mode, ready to evaluate in REPL |
| :Eval | no | no | Evaluate form under cursor in REPL, same as 'cpp' but accepts a range |
| :%Eval | no | no | Evaluates whole file in REPL, same as 'cpp' but accepts a range |
| :Require! | no | no | Reloads all namespaces for REPL evaluation |
| K | no | no | Look-up symbol under cursor with 'doc' |
| :Javadoc | no | no | Open Java docs for the class under cursor in browser |


# Limitations
Limitations include:
1. Linux/Unix systems only

# License
- This project is released under [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0) and includes code under [MIT License](https://opensource.org/licenses/MIT) as described in the NOTICE.
- Vim is under [Vim License](https://github.com/vim/vim/blob/master/LICENSE)
