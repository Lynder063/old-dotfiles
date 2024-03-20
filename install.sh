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

# Define options for yay and pacman
YAY_OPTS="--noconfirm --needed"
PACMAN_OPTS="--noconfirm --needed"

# Update system
echo "Updating system..."
yay -Syu $YAY_OPTS || error_exit "Failed to update system."

# Remove existing .config directory and clone dotfiles repository
echo "Cloning dotfiles repository..."
rm -rf "$HOME/.config" && git clone https://github.com/Lynder063/dotfiles.git "$HOME/.config" || error_exit "Failed to remove existing .config directory or clone dotfiles repository."

# Install basic packages
echo "Installing basic packages..."
yay -S $YAY_OPTS hyprland kitty grim slupr wofi waybar neovim ttf-hack-nerd ttf-font-awesome noto-fonts-emoji network-manager-applet blueman-applet dunst hyprpaper swaylock-effects catppuccin-gtk-theme-mocha hyprshot polkit-gnome gnome-keyring ly nwg-look neofetch nautilus wget curl || error_exit "Failed to install basic packages."

# Set dark theme for Gnome applications
echo "Setting dark theme for Gnome applications..."
gsettings set org.gnome.desktop.interface color-scheme prefer-dark || error_exit "Failed to set dark theme for Gnome applications."

# Install and configure zsh
echo "Installing and configuring zsh..."
yay -S $YAY_OPTS zsh zsh-autosuggestions zsh-syntax-highlighting zsh-theme-powerlevel10k && \
zsh -c "exit 0" && \
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
echo "source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "$HOME/.zshrc" && \
echo "source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> "$HOME/.zshrc" && \
echo "source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme" >> "$HOME/.zshrc" && \
echo "ZSH_AUTOSUGGEST_STRATEGY=( history completion )" >> "$HOME/.zshrc" && \
echo "neofetch" >> "$HOME/.zshrc" || error_exit "Failed to install and configure zsh."

# Download and set neofetch theme
echo "Downloading and setting neofetch theme..."
mkdir -p /tmp && \
cd /tmp && \
wget https://raw.githubusercontent.com/Chick2D/neofetch-themes/main/normal/onrefetch.conf && \
cp onrefetch.conf "$HOME/.config/neofetch/config.conf" || error_exit "Failed to download or set neofetch theme."

# Set up Nautilus
echo "Setting up Nautilus..."
yay -S $YAY_OPTS nautilus-open-any-terminal && \
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal kitty || error_exit "Failed to set up Nautilus."

# Install Grub theme
echo "Installing Grub theme..."
wget -P /tmp https://github.com/shvchk/fallout-grub-theme/raw/master/install.sh && \
bash /tmp/install.sh || error_exit "Failed to install Grub theme."

# Start ly daemon
echo "Starting ly daemon..."
sudo systemctl enable ly --now || error_exit "Failed to start ly daemon."

echo "Installation completed successfully."

