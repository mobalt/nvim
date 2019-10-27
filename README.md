nvim
==================================================

coc.vim
-------------------------
* `<C_Space>` - trigger completion
* diagnostics
    * `[c`/`]c` - previous/next
* Go to
    * `K` - documentation (in preview window)
    * `gd` - definition
    * `gy` - type defintion
    * `gi` - implementation
    * `gr` - references
* Actions
    * `rn` - rename
    * `<L>f` - format
    * `<L>a` - code action on selected region
        * example`<L>aap` - for current paragraph
    * `<L>ac` - action on current line
    * `<L>qf` - autofix problem on current line
    * Additional Commands
        * `:Format` - format current buffer
        * `:Fold` - fold current buffer
        * `:OR` - organize import of current buffer
* List `<L>l`
    * To learn more about default mappings `:h coc-list-mappings`
    * `< >` - Resume latest List
    * `l` - Available lists
    * Vim
        * `:` - vimcommands: Commands
        * `;` - cmdhistory: Command History
        * `h` - helptags: help tags of vim
        * `/` - searchhistory: search history
        * `~` - colors: color schemes
        * `k` - maps: key mappings
        * `~` - filetypes: set as filetype
    * coc.nvim
        * `~` - extensions: Manage extensions
        * `~` - Services
        * `~` - output: output channels
        * `~` - sources: completion sources
        * `d` - diagnostics: of current workspace
        * `n` - Show commands
    * Search `<L>f`
        * `/` - grep: grep text by rg
        * `f` - files: from cwd
        * `d` - folders: from current workspace
        * `s` - outline: symbols of current document
    * Git
        * `~` - issues: on github
        * `~` - gstatus: git status of current project
        * `~` - branches: git branches
        * `~` - commits: of current project
        * `~` - bcommits: commits of current file
        * `~` - gfiles: view files on different branches (or commits, or tags)
    * Items `<L>l`
        * `w` - windows: windows list
        * `b` - buffers
        * `s` -  sessions: session list
        * `m` - marks: marks list
        * `~` - snippets
        * `p` - yank: list of yank history
    * Apply
        * `~` - actions: code actions on selected range
        * `~` - quickfix
    * Go to
        * `~` - links: in current buffer
        * `~` - tags: search from tags
        * `~` - locationlist of current window
        * `~` - location: last jump locations
        * `~` - mru: most recent used files
        * `~` - words: word matches of current buffer
        * `<L>s` - symbols: search workspace symbols
    * `<L>j` - Do default action for next item
    * `<L>k` - Do default action for previous item
    * `<L>a` - Manage extensions
* Snippets
    * `<C-k>` - Jump to previous placeholder
    * `<C-j>` *(prioritized)*
        * *(visual mode)* Use select text for visual placeholder of snippet
        * Expand snippet
        * Jump to next placeholder
    * `<C-l>` - expand snippet
    * `<C-j>` - Jump to next placeholder
    * `<Tab>` - next snippet

## Wiki `<L>w`
* Go to
    * `w` - Nth Wiki (default 1)
    * `t` - open Nth wiki in new tab (default 1)
    * `s` - wiki select GUI
    * `i` - N diary
    * `<L>w` - today's entry
    * `<L>t` - today's entry in a new tab
    * `<L>y` - yesterday's entry
    * `<L>m` - tomorrow's entry

Edit config
--------------------------------------------------
common prefix: `gs` - Go to source
* vim config `gsv` or `grc`
* tmux config `gst`
* ultisnips config `gsu`


Movement
--------------------------------------------------
* Zoom into runner `<leader>vz`
* Focus into window (also works in Tmux)
    * `c_\` - last visited
    * `<C-[hjkl]>` - directional
* NerdTree
    * `<F3>` - Toggle
    * `<F2>` - Locate current file
* Toggle
    * `<L>/` - search highlighting
* Under cursor
    * `<L>r` - Rename
    * `<C-space>` - autocomplete
    * Go to
        * `<S>k` - documentation
        * `<L>d` - definition
        * `<L>g` - assignment
        * `<L>n` - usages
* Session `<L>s`
    * `o` - open
    * `s` - save
    * `d` - delete
    * `q` - quit
* Buffer `<L>b`
    * `b`   - List *(default)*
    * `p`/`n` - Previous/Next
    * `q`   - Quit
* Window `<L>p`
	* Common
        * `q` - quit
        * `o` - only this, quit all others
        * `t` - move to new tab
        * `p` or `<space>` - List window panes
    * Split Buffer into direction
		* `h/j/k/l` - current buffer
		* `H/J/K/L` - new empty buffer
	* Move `;` or `# <L>P`
		* `;` - swap with next Pane
		* `h/j/k/l` - in that direction
		* `r/R` - rotate (↘) / (↖)
		* `t` - to new Tab
    * Resizing `p`
        * `p/=` - equilibrate
        * Width
            * `|` - set to N (default max)
            * `h/l` - add/subtract N (default 1)
        * Height
            * `-` - set to N (default max)
            * `j/k` - add/subtract N (default 1)
* Tab `<L>t...`
    * Common:
        * `t` - List *(default)*
        * `tn` or `# <C-n>`  - New
        * `q` - quit
        * `e` - edit
    * Focus
        * `h/l` - Leftmost/Rightmost
        * `j/k` - Right/Left
        * `# [N]gt` - go to Nth tab
    * Move current tab
        * `H/L` - Leftmost/Rightmost
        * `J/K` - Right/Left
* Git `<L>g`
    * `a` - Add
    * `c` - Checkout
    * `m` - Commit
    * `r` - Rename
    * `Q`/`X` - Remove file from repo, close buffer
    * `s` - status
    * `b` - blame
    * `d` - diff
    * `i` - pull In
    * `o` - push Out
* Characters `<L>i` or `<L>a` (depending on position)
    * Arrows `a`
        * North `k`
            * `k` - North   ↑
            * `h` - ..West  ↖
            * `l` - ..East  ↗
            * `j` - Up-Down ⇅
                * Note: don't confuse ⇅ with ⇵ (down-up)
        * etc. `h/j/k/l`


Actions on File
--------------------------------------------------
* Jump to file `<L>e`
* Autoformat `<F1>`
* Run tester `<F12>`
* Compile

* Runner `<L>v`
    * `-/\` - Open runner Horizontally/Vertically
    * `q` - Close runner
    * `a` - Attach runner
    * `z` or `<space>` - Focus (Zoom-in) runner
    * `.` - Set working directory to current file
    * `p` - Prompt for new command to send
    * `v` - Run command (again?)
    * `h` or `# <F12>` - Run hackerrank.py
    * `# <C-f>` - Send Lines
    * Send Keys `s`
        * `q` - q
        * `d` - ^D
        * `l` - ^L
        * `c` - ^C

Snippets
    * `gsu` - Go to UltiSnipsEdit
    *
Installation
-----------------
Install Yarn
Install Vim-Plug:
```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
