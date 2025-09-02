# EpiConf

EpiConf is a configuration for EPITA's school, we have personalised :
 - i3
 - vim
 - the taskbar
 - UI
 - command prompt
 
## How to install it

For install it, write this in your shell :
`curl -L epiconfs.github.io | sh -s`

The setup will ask you a password, don't worry this password is not your session password, it's just a security to go in your `.confs` directory (cf. last part). This password is not necessary the same as your session password, but don't forget it.

## I3 configuration 

The new I3 configuration contain 2 parts. The first one consists of automatics start, and the second one consists of users shortcuts.

### Automatic
The new I3 configuration automatically starts a new prompt and Firefox in your EPITA's account. It also changes the wallpaper all 5 minutes.

### Shortcuts
With this configuration, you can do :
- `Win + i` for i3lock
- `Ctrl + Shift + L` for matrix i3lock
- `Win + Tab` for switch to the next desktop

## Vim configuration
We have also personalised the vim configuration, now you have multiple packages and shortcuts in vim.

### Packages
We have 3 packages :
- `vim-airline` for colours and theme
- `nerdtree` for having a tree with directories and files
- `syntastic` which verify syntax and errors

### Shortcuts
First, we have added the click of the mouse in vim. After, when you open a file on vim, you are automatically in insert mode. Finally we have different shortcuts :
- `Ctrl + x` for save and exit
- `Crtl + q` for exit without save
- `Ctrl + s` for save
- `Ctrl + z` for undo
- `Ctrl + y` for redo
- `Ctrl + c` for copy
- `Ctrl + v` for paste (need to be in selection mode)
- `Ctrl + t` to hide or show the tree
- You can type `{`, `(`, `[`, `"` or `'` to write `{}`, `()`, `[]`, `""` or `''`
- `@for` to have the `for` syntax
- `@jfor` and `@kfor` to have the `for` syntax with `j` and `k`
- `@while` for having the `while` syntax
- `@if` for the `if` syntax
- `@elif` for the `else if` syntax
- `@else` for the `else` syntax

## The taskbar

The taskbar, is a new taskbar at the top of the screen with the used desktop, the clock, the used space in your `afs`, the RAM utilisation and the CPU utilisation.

## The new UI

Now, the unused app is a little bit transparent, the corners are rounded, and you have a little animation when your desktop change.

## The command prompt
This new command prompt is reimagined and have new commands.

### The visual
For this shell, we were inspired by Kali Linux shell. You have :
- your name
- your emplacement in the pc
- the git branch and the number of different files compared to the repository

### The new commands
- `gtg` to do a basic `.gitignore`
- `ath` to do the `AUTHORS` file
- `rdm` to do a basic `README`
- `mkarchi` to do `gtg`, `ath` and `rdm` in one command
- `lunar` to play minecraft
- `osu` to play OSU
- `nix-clear` to delete removed libraries
- `bluetooth` to start a Bluetooth manager
We also add a password when a people tried to do something in your `.confs` directory.