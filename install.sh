#!/bin/bash

# Function to display error messages and exit
error_exit() {
    echo "$1" 1>&2
    exit 1
}

# Check if running on Arch-based system
[ -f /etc/arch-release ] || error_exit "This script requires an Arch-based system."

# Check if yay is installed
if ! command -v yay &> /dev/null; then
    read -rp "yay aur helper is required but not found. Do you want to install it? (y/n): " response
    if [[ "$response" =~ ^[Yy]$ ]]; then
        if ! command -v pacman &> /dev/null; then
            error_exit "Pacman is required for installation but not found."
        fi
        echo "Installing yay..."
        cd /tmp || error_exit "Failed to change directory to /tmp."
        git clone https://aur.archlinux.org/yay-git.git || error_exit "Failed to clone yay-git repository."
        cd yay-git || error_exit "Failed to change directory to yay-git."
        makepkg -si || error_exit "Failed to install yay."
        cd "$HOME" || error_exit "Failed to change directory back to home directory."
    else
        error_exit "yay aur helper is required. Please install it first."
    fi
fi

# Adding user to correct groups
sudo usermod -aG input ${USER}
sudo usermod -aG video ${USER}

# Delete existing .config if exists
rm -rf $HOME/.config

# Clone repository as .config
cd $HOME && git clone https://github.com/Lynder063/dotfiles.git .config

# Installation of basic packages
yay -S hyprland kitty grim slurp wofi waybar neovim ttf-hack-nerd ttf-font-awesome noto-fonts-emoji network-manager-applet blueman-applet dunst hyprpaper swaylock-effects catppuccino-gtk-theme-mocha-gnome hyprshot polk ly nwg-look neofetch nautilus ocs-url wget curl xdg-desktop-portal-hyprland tela-icon-theme

# Set dark theme for gnome applications
gsettings set org.gnome.desktop.interface color scheme 'prefer-dark'

# Install zsh and related plugins
yay -S zsh zsh-autosuggestions zsh-syntax-highlighting zsh-theme-powerlevel10k

# Set up zsh with Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo 'source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> $HOME/.zshrc
echo 'source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh' >> $HOME/.zshrc
echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >> $HOME/.zshrc
echo 'ZSH_AUTOSUGGEST_STRATEGY=( complete history )' >> $HOME/.zshrc
echo '[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitty ssh"' >> $HOME/.zshrc
echo 'neofetch' >> $HOME/.zshrc

# Install the terminal addon in nautilus
yay -S nautilus-open-any-terminal

# Add support for kitty terminal
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal kitty

# Enable settings to show hidden files in Nautilus
gsettings set org.gnome.nautilus.preferences show-hidden-files true

# Download the Grub installation script
wget -P /tmp https://github.com/shvchk/fallout-grub-theme/raw/master/install.sh

# Launch Grub installation
bash /tmp/install.sh

# Start ly daemon
sudo systemctl enable ly --now

echo "Installation complete."

