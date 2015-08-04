ln -sf ~/dotfiles/.vimrc ~/.vimrc
mkdir -p ~/.vim
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > /tmp/install.sh
sh /tmp/install.sh
