#!/bin/bash

error_exit() {
	echo "$1" 1>&2
	exit 1
}

# Check if running on Arch-based system
[ -f /etc/arch-release ] || error_exit "This script requires an Arch-based system."

# Check if yay is installed
if ! command -v yay &>/dev/null; then
	read -rp "yay aur helper is required but not found. Do you want to install it? (y/n): " response
	if [[ "$response" =~ ^[Yy]$ ]]; then
		if ! command -v pacman &>/dev/null; then
			error_exit "Pacman is required for installation but not found."
		fi
		echo "Installing yay..."
		cd /tmp || error_exit "Failed to change directory to /tmp."
		git clone https://aur.archlinux.org/yay-git.git || error_exit "Failed to clone yay-git repository."
		cd yay-git || error_exit "Failed to change directory to yay-git."
		makepkg -si --noconfirm || error_exit "Failed to install yay."
		cd "$HOME" || error_exit "Failed to change directory back to home directory."
	else
		error_exit "yay aur helper is required. Please install it first."
	fi
fi

# Adding user to correct groups
sudo usermod -aG input ${USER}
sudo usermod -aG video ${USER}

# Clone repository as .config
rm -rf $HOME/.config
cd $HOME && git clone https://github.com/Lynder063/dotfiles.git .config || error_exit "Fa iled to clone dotfiles repository."

# Installation of basic packages
yay -S --noconfirm --needed hyprland kitty grim slurp wofi waybar neovim zathura ttf-hack-nerd ttf-font-awesome noto-fonts-emoji network-manager-applet blueman dunst hyprpaper catppuccin-gtk-theme-mocha hyprshot polk ly nwg-look neofetch nautilus ocs-url wget curl xdg-desktop-portal-hyprland tela-icon-theme-purple-git hyprland-autoname-workspaces-git hyprlock hypridle nautilus-open-any-terminal kvantum wl-clipboard wtype lsd

# Set dark theme for gnome applications
gsettings set org.gnome.desktop.interface color scheme 'prefer-dark'

# Set up zsh
yay -S --noconfirm --needed zsh zsh-autosuggestions zsh-syntax-highlighting zsh-theme-powerlevel10k
cp $HOME/.config/.zshrc $HOME/ || error_exit "Failed to copy ZSH config to $HOME"

# Add support for kitty terminal in nautilus
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal kitty

# Enable settings to show hidden files in Nautilus
gsettings set org.gnome.nautilus.preferences show-hidden-files true

# Download the Grub installation script
wget -P /tmp https://github.com/shvchk/fallout-grub-theme/raw/master/install.sh || error_exit "Failed to download Grub installation script."
yay-git
# Launch Grub installation
bash /tmp/install.sh || error_exit "Failed to launch Grub installation."

# Start ly daemon
sudo systemctl enable ly --now || error_exit "Failed to start ly daemon."
