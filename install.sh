DIR=$PWD
git submodule update --init --recursive
cd .vim/bundle/YouCompleteMe
./install.sh --clang-completer
if [-f ~/.vimrc]; then
    mv ~/.vimrc ~/.vimrc-old-`date +"%Y%m%d"`
fi;
if [-f ~/.ycm_extra_conf.py]; then
    mv ~/.ycm_extra_conf.py ~/.ycm_extra_conf.py-old-`date +"%Y%m%d"`
fi
ln -s $DIR/.vimrc ~
ln -s $DIR/.ycm_extra_conf.py ~

