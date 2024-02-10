#/bin/bash/
yay -S kitty grim wofi waybar neovim ttf-font-awesome noto-fonts-enoji thunar thunar-volman gvfs network-manager-applet dunst hyprpaper swaylock-effects ranger flameshot-gui ttf-hack-nerd &&  

# Git cloning repository to .config folder
# Can make problems when already created .config folder
# Usually i run rm -r .config but i dont recommend that
  git clone https://github.com/Lynder063/dotfile.git ~/.config/
