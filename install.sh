#/bin/bash/
yay -S hyprland kitty grim wofi waybar neovim ttf-font-awesome noto-fonts-emoji thunar thunar-volman gvfs network-manager-applet dunst hyprpaper swaylock-effects ranger ttf-hack-nerd catppuccin-gtk-theme-mocha &&  
echo "All packages installed :)"
chmod +x $HOME/.config/wofi/screenshot.sh &&
sudo cp $HOME/.config/wofi/screenshot.sh /usr/local/bin/
