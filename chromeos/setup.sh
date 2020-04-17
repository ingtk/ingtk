brew bundle

rm -rf ~/.fonts
ln -s /home/linuxbrew/.linuxbrew/share/fonts ~/.fonts
fc-cache -fv
