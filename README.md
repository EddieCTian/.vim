# .vim

All plugins and personalizations for vim in one easy to clone repository

### To clone:

```
git clone --recurse-submodules https://github.com/EddieCTian/.vim.git
```

On Unix, change \_vimrc to .vimrc

### To update repository:

```
git remote add origin https://github.com/EddieCTian/.vim.git
git pull -u origin master
```

### To update submodules:

```
git submodule update --init --recursive
```

### To add new plugins:
```
cd [where the plugin goes]
git submodule add git@mygithost
```

#### Structure:
```
$HOME/.vim/pack/my-plugins/
    start/
        foo/
            plugin/
                foo.vim
            syntax/
                some.vim
        bar/
            plugin/
                bar.vim
    opt/
        buzz/
            plugin/
                buzz.vim
```

## Remapping the CapsLock Key

### On Windows:

[CapsUnlocked](https://github.com/kshenoy/CapsUnlocked/releases)

### On OSX:

[Karabiner-Elements](https://karabiner-elements.pqrs.org/)

### On Linux:

Use the GNOME Tweaks utility. Under Keyboard & Mouse go to Additional Layout Options and modify the caps lock key. More instructions [here](https://www.emacswiki.org/emacs/MovingTheCtrlKey#h5o-3)

Alternatively, try for more remapping: 
[xcape](https://github.com/alols/xcape)

### On ECF:

This script I found on reddit:

[Remap Caps Lock](https://www.reddit.com/r/vim/comments/4xr6t5/mapping_capslock_as_escape_when_tapped_and_as/)

(I haven't tried it yet)

