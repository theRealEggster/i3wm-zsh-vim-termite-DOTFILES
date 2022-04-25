#!/bin/bash

cd ~/BACKUP/BACKUP_DOTFILES
sudo cp usr/share/conky/* /usr/share/conky/
sudo cp systemd/* /etc/systemd/user/
systemctl --user enable power.service
systemctl --user enable power.timer
systemctl --user enable pulseaudio.service
systemctl --user start pulseaudio.service
systemctl --user start pulseaudio.socket
systemctl --user enable pulseaudio.socket
systemctl --user start pulseaudio.socket
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
p -r CERT ~/
cp -r Pictures ~/
cp -r work ~/
cp -r .config/* ~/.config/
rm -rf ~/.i3/config 
cp .gitconfig ~/
cp -r .oh-my-zsh ~/
cp .ssh/* ~/.ssh
chmod go-rw ~/.ssh/*
cp -r .vim ~/
cp .vimrc ~/
echo "Reloading i3 config: $(i3-msg reload)"
echo "Restarting i3 $(i3-msg restart)"
cp -r .zsh_custom ~/
cp .zsh_history ~/
cp .zshrc ~/
chmod +x .local/bin/*
mkdir .local/bin
cp .local/bin/* ~/.local/bin/
chsh -s /bin/zsh
