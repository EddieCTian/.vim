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
git submodule add git@mygithost .
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
