### Installing your Vim environment on another machine
Once your vim configuration is under version control, it’s quite straightforward to import your settings to any machine that has git installed. If you followed the instructions above to put your vimrc and plugins in a *dotvim* directory, then you can follow these steps to synchronise them to another machine:
```
cd ~
git clone https://github.com/mtuktarov/vim.git
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
cd ~/.vim
git submodule update --init
```

### Upgrading a plugin bundle

At some point in the future, the fugitive plugin might be updated. To fetch the latest changes, go into the fugitive repository, and pull the latest version:

```
cd ~/.vim/bundle/fugitive
git pull origin master
```

### Upgrading all bundled plugins

You can use the *foreach* command to execute any shell script in from the root of all submodule directories. To update to the latest version of each plugin bundle, run the following:

```
git submodule foreach git pull origin master
```
