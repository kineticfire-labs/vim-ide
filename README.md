# vim-ide
Use vim as an IDE!

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

![screenshot-java](https://user-images.githubusercontent.com/60242848/179606812-0fe4032a-0a9d-4c13-9649-2c5634b3f843.png)
Figure 1 -- Java Code Editing

![screenshot-clojure](https://user-images.githubusercontent.com/60242848/179606850-002eb321-53dc-4e2e-aa6f-ca6d0c1a1327.png)
Figure 2 -- Clojure Code Editing


# Installation
Installation can setup the full IDE functionality (see [IDE Installation](#ide-installation)) or portable e.g. non-IDE functionality (see [Portable (Non-IDE) Functionality](#portable-non-ide-installation)).

## IDE Installation
The following instructions setup vim-ide with full IDE functionality, which requires downloading plugins.  WARNING:  before proceeding, backup your ~/.vimrc and ~/.vimrc-ide files if they exist and you made custom modifications.
1. Install Node.js.  Required for code autocompletion provided by [neoclide/coc.nvim](https://github.com/neoclide/coc.nvim).  Note that Node.js 12.12 or greater is required.  If you already have Node.js installed (check the version of Node.js with 'node --version') and if less than version 12.12, see [Node.js](https://nodejs.org/en/download/) for installing a more current version.  For more details, see [neoclide/coc.nvim](https://github.com/neoclide/coc.nvim)
   1. curl -sL install-node.vercel.app/lts | bash
2. Add the following to ~/.bashrc, which causes the terminal to pass CTRL-S to vim (which is used to save the file vs. causing the terminal to hang).
   1. stty -ixon
3. Download "vimrc" and "vimrc-ide", and move/rename as "\~/.vimrc" and "\~/.vimrc-ide".
4. Install vim (or otherwise be sure that vim installed).  For Debian-based Linux distributions (including Ubuntu), use the commands that follow else consult your distro's documentation.
   1. sudo apt-get update
   2. sudo apt-get install vim
5. Start vim.  Plugins will install automatically install.
   1. vi
6. Disregard the error message on startup (press "enter"), which occurs because a plugin isn't available (it will be installed).
7. Wait for the plugins to install.  Press "enter" to dismiss the error message and "q" to dismiss the installation window.
8. For Clojure REPL suport, see 

If you encounter problems, then force install by:
1. Start vim
   1. vi
2. Source the new vimrc file
   1. :so ~/.vimrc
3. Install plugins
   1. :IdeInit


## Portable (Non-IDE) Installation
The following instructions setup vim-ide without IDE functionality.  WARNING:  before proceeding, backup your ~/.vimrc file if it exists and you made custom modifications.
1. Add the following to ~/.bashrc, which causes the terminal to pass CTRL-S to vim (which is used to save the file vs. causing the terminal to hang).
   1. stty -ixon
2. Download "vimrc", and move/rename as "~/.vimrc".
3. Install vim (or otherwise be sure that vim installed).  For Debian-based Linux distributions (including Ubuntu), use the commands that follow else consult your distro's documentation.
   1. sudo apt-get update
   2. sudo apt-get install vim
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
3. Window splits occur to the right for a vertical split or bottom for a horizontal split, which is more natural
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


**Clojure specific**

Clojure REPL support:
1. Include the cider-nrepl library '[cider/cider-nrepl "0.27.3"]' in the 'dependencies' vector in your 'project.clj' file.  The 'dependencies' vector may look like:  ':dependencies \[\[org.clojure/clojure "1.10.0"][cider/cider-nrepl "0.27.3"]]'.
   1. For more details, see [tpope/vim-fireplace](https://github.com/tpope/vim-fireplace) and [cider-nrepl](https://docs.cider.mx/cider-nrepl/usage.html).
   2. NOTE:  The cider-nrepl documentation says to declare the cider-nrepl library as a plugin e.g. ':plugins [[cider/cider-nrepl "0.27.3"]]', however this method failed.  Defining the cider-nrepl library in the 'dependencies' vector as above worked.
2. REPL-related commands require a running REPL prior to opening a Clojure file; the REPL may be started with a command such as "lein repl" from a Clojure project directory.


| Command | vim Default | Available in Portable | Description |
| --- | --- | --- | --- |
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

