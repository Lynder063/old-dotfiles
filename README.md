## Dotfiles

### Requirements
You need:
 - [Arch](https://wiki.archlinux.org/title/Arch-based_distributions) based system
 - [yay](https://github.com/Jguer/yay) aur helper

### Installation

- Smažeme existující `.config`

```bash
rm -r .config
```

- Clonování repositáře
```bash
cd $HOME &
git clone https://github.com/Lynder063/dotfiles.git .config
```

- Instalace základních balíčků

```bash
yay -S hyprland kitty grim slupr wofi waybar neovim ttf-hack-nerd ttf-font-awesome noto-fonts-emoji network-manager-applet blueman-applet dunst hyprpaper swaylock-effects catppuccin-gtk-theme-mocha hyprshot polkit-gnome gnome-keyring ly nwg-look neofetch nautilus
```

- Nastavíme dark theme pro Gnome aplikace

```bash
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
```

- Instalace a nastavení zsh

```bash
yay -S zsh zsh-autosuggestions zsh-syntax-highlighting zsh-theme-powerlevel10k 
```

- Pustíme `zsh` a dáme **0** 

- Nainstalujeme [ohmyzsh](https://ohmyz.sh/#install)

> [!WARNING]
> Je potřeba mít nainstalovný balíček `curl`

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

- A vložíme do souboru `.zshrc` toto
```bash
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
ZSH_AUTOSUGGEST_STRATEGY=( history completion )
neofetch
```

### Nastavení neofetch

- Stáhneme theme 

```bash
cd tmp/
https://raw.githubusercontent.com/Chick2D/neofetch-themes/main/normal/onrefetch.conf
```

- A přepíšeme originální neofetch config 

```bash
cp /tmp/onrefetch.conf config.conf
```

## Nastavíme neutilus
 
```bash
nautilus -q
```

- Nainstalujeme addon pro terminal do nautilusu

```bash
yay -S nautilus-open-any-terminal
```

- Propíšeme konfiguraci

```bash
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal kitty
```

# Grub theme
[Thanks, shvchk](https://github.com/shvchk/fallout-grub-theme?tab=readme-ov-file)


- Stáhneme instalační script

```bash
wget -P /tmp https://github.com/shvchk/fallout-grub-theme/raw/master/install.sh
```

- Spustíme
```bash
bash /tmp/install.sh
```

- Spustíme deamona pro ly 
```bash
sudo systemctl enable ly --now
```
