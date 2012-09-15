# Source

This is largely inspired by https://github.com/technomanticore/.vim 

Many thanks!


## Installation of Vim Configuration Files

If you would like to use these Vim settings, first check to see if you have a .vim folder in your
home directory. If you do have one, either delete it or copy it to another location for safe-keeping
(i.e. you could rename it to something such as .vim-old). Then, after you have performed these
actions or if you do not have a .vim folder, type the following into a terminal:

    cd ~
    git clone git@github.com:bencaron/.vim.git

## Plugin Git Submodules 

[Pathogen](https://github.com/tpope/vim-pathogen) is an awesome plugin manager for Vim that makes 
it very easy to install and organize plugins. I have placed all of the plugins that I use, including
Pathogen, in the ```~/.vim/bundle``` directory. In addition, I have installed all of these plugins 
as git submodules. Submodules for plugins can be created using the following terminal code (as an
example):

    cd ~/.vim
    mkdir ~/.vim/bundle
    git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
    git add .
    git commit -m "Install Fugitive.vim bundle as a submodule."

*Note: These examples were borrowed from the [Vimcast](http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/)
on Pathogen and git submodules.*

To update an individual plugin, use the following (using the [fugitive](https://github.com/tpope/vim-fugitive) plugin as an example):

    cd ~/.vim/bundle/fugitive
    git pull origin master

To update all of the Vim plugins, you simply need to use the following terminal command:

    git submodule foreach git pull origin master

When using version control for your ~/.vim directory, make sure to move and link the ~/.vimrc and ~/.gvimrc
files to ~/.vim if you have not already done so:

    mv .vimrc ~/.vim/vimrc
    mv .gvimrc ~/.vim/gvimrc

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

If you wish to import this Vim configuration to a different machine, use the following:

    cd ~
    git clone git@github.com:technomanticore/.vim.git
    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc
    cd ~/.vim
    git submodule init
    git submodule update

