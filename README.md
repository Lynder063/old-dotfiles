# Arch Linux Rice Setup

Welcome to my customized Arch Linux environment designed for enhanced productivity and aesthetics.

## Screenshots

![Screenshot 1](pics/pic1.png)
*Screenshot 1: Overview of the desktop environment*

![Screenshot 2](pics/pic2.png)
*Screenshot 2: Terminal setup with Kitty and Zsh*

![Screenshot 3](pics/pic3.png)
*Screenshot 3: Nautilus file manager and Waybar*

## Introduction

This setup is handcrafted configuration to provide a seamless and visually appealing user experience based on my liking. It includes a curated selection of applications and customizations to optimize your workflow on Arch Linux with Hyprland and other apps.

## 📝 TODO
- [ ] Add kvantum into script and README.md
- [x] Redo WOFI protože Jakub je debil @jktech 
- [ ] Redo README.md to by more redeable
- [x] Reconfigure WOFI theming 
- [x] Fix `install.sh` file
- [x] Fix swaylock or move to hyprland alternative
- [x] Update rice screenshots
- [x] Correct waybar colors
- [x] [Hyprland autotag naming](https://github.com/hyprland-community/hyprland-autoname-workspaces)


## Installation

### Automatic Installation

To automate the setup process, run the provided installation script:

```bash
./install.sh
```
This script has been tested om `archlinux-2024.03.01` with kernal `6.8.2`

### Manual installation
#### Initial setup
1. Adding user to correct groups
```bash
sudo usermod -aG input ${USER}
```
```bash
sudo usermod -aG video ${USER}
```

2. Delete the existing `.config`

``` bash
rm -r .config
```

4. Clone repository as `.config`
``` bash
cd $HOME &
git clone https://gitlab.com/Lynder063/dotfiles.git .config
```

4. Copying scripts for wofi to `/usr/local/bin`

```bash
cp $HOME/.config/wofi/emoji.sh $HOME/.config/hypr/gamemode.sh $HOME/.config/wofi/screenshot.sh /usr/local/bin
```

5. 📦 Installation of basic packages

``` bash
yay -S hyprland kitty grim slupr wofi waybar neovim ttf-hack-nerd ttf-font-awesome noto-fonts-emoji network-manager-applet blueman-applet dunst hyprpaper catppuccin-gtk-theme-mocha-gnome hyprshot polkit gnome-keyring ly nwg-look neofetch nautilus ocs-url wget curl xdg-desktop-portal-hyprland tela-icon-theme-purple-git hyprland-autoname-workspaces-git hyprlock hypridle wtype wl-clipboard kvantum
```

6. Set a dark theme for the **gnome** applications

``` bash
gsettings set org.gnome.desktop.interface color scheme prefer-dark
```
#### 🖥️ Zsh
1. Installing `zsh` necessery packages
``` bash
yay -S zsh zsh-autosuggestions zsh-syntax-highlighting zsh-theme-powerlevel10k
```

2. Let's run `zsh` and type **0**

3.  We will install [ohmyzsh](https://ohmyz.sh/#install)

You need to have the `curl` and `wget` packages installed
``` bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

4. And we this in `.zshrc` file
``` bash
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
ZSH_AUTOSUGGEST_STRATEGY=( complete history )
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitty ssh"
neofetch
```

#### 📂 Nautilus
 1. Reload nautilus config
``` bash
nautilus -q
```
2. We will install the terminal addon in `nautilus`

``` bash
yay -S nautilus-open-any-terminal
```
3. Add support for kitty terminal

``` bash
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal kitty
```

4.  Enable settings to show hidden files


```bash
gsettings set org.gnome.nautilus.preferences show-hidden-files true
```

#### 🔐 Grub

1. Download the installation script

``` bash
wget -P /tmp https://github.com/shvchk/fallout-grub-theme/raw/master/install.sh
```
2. Let's launch
``` bash
bash /tmp/install.sh
```
3. Choose language
#### 🏁 Ly

1. We start the daemon for ly
``` bash
sudo systemctl enable ly --now
```

### Credits
Thank you [shvchk](https://github.com/shvchk) for awesome GRUB theme and [JKech](https://gitlab.com/jktech) for help with debugging ❤️

