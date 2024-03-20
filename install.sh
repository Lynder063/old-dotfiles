#!/bin/bash

# Function to display error messages and exit
error_exit() {
    echo "$1" 1>&2
    exit 1
}

# Check if running on Arch-based system
if [ ! -f /etc/arch-release ]; then
    error_exit "This script requires an Arch-based system."
fi

# Check if yay is installed
if ! command -v yay &> /dev/null; then
    error_exit "yay aur helper is required. Please install it first."
fi

# Remove existing .config directory
rm -rf "$HOME/.config" || error_exit "Failed to remove existing .config directory."

# Clone dotfiles repository
cd "$HOME" || error_exit "Failed to change directory to home directory."
git clone https://github.com/Lynder063/dotfiles.git .config || error_exit "Failed to clone dotfiles repository."

# Install basic packages
yay -S hyprland kitty grim slupr wofi waybar neovim ttf-hack-nerd ttf-font-awesome noto-fonts-emoji network-manager-applet blueman-applet dunst hyprpaper swaylock-effects catppuccin-gtk-theme-mocha hyprshot polkit-gnome gnome-keyring ly nwg-look neofetch nautilus || error_exit "Failed to install basic packages."

# Set dark theme for Gnome applications
gsettings set org.gnome.desktop.interface color-scheme prefer-dark || error_exit "Failed to set dark theme for Gnome applications."

# Install and configure zsh
yay -S zsh zsh-autosuggestions zsh-syntax-highlighting zsh-theme-powerlevel10k || error_exit "Failed to install zsh and related plugins."
zsh -c "exit 0" || error_exit "Failed to start zsh shell."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || error_exit "Failed to install oh-my-zsh."
echo "source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "$HOME/.zshrc"
echo "source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> "$HOME/.zshrc"
echo "source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme" >> "$HOME/.zshrc"
echo "ZSH_AUTOSUGGEST_STRATEGY=( history completion )" >> "$HOME/.zshrc"
echo "neofetch" >> "$HOME/.zshrc" || error_exit "Failed to configure zsh."

# Download and set neofetch theme
mkdir -p /tmp || error_exit "Failed to create temporary directory."
cd /tmp || error_exit "Failed to change directory to /tmp."
wget https://raw.githubusercontent.com/Chick2D/neofetch-themes/main/normal/onrefetch.conf || error_exit "Failed to download neofetch theme."
cp onrefetch.conf "$HOME/.config/neofetch/config.conf" || error_exit "Failed to set neofetch theme."

# Set up Nautilus
nautilus -q || error_exit "Failed to quit Nautilus."
yay -S nautilus-open-any-terminal || error_exit "Failed to install nautilus-open-any-terminal addon."
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal kitty || error_exit "Failed to set terminal for nautilus-open-any-terminal."

# Install Grub theme
wget -P /tmp https://github.com/shvchk/fallout-grub-theme/raw/master/install.sh || error_exit "Failed to download Grub theme installation script."
bash /tmp/install.sh || error_exit "Failed to install Grub theme."

# Start ly daemon
sudo systemctl enable ly --now || error_exit "Failed to start ly daemon."

echo "Installation completed successfully."

