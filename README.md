# My Arch Linux rice

![Screenshot 1](pics/pic_1.png) 
![Screenshot 1](pics/pic_2.png) 
![Screenshot 1](pics/pic_3.png) 
![Screenshot 1](pics/pic_4.png) 

## TODO
- [ ] Add icons to `install.sh`
- [ ] Add icons to `README.md` guide
- [x] Redo `README.md`
- [ ] Added stuff for streaming
- [ ] Add keymap to `README.md`

## Instalace

### Základní nastavení

- Smažeme existující `.config`

```bash
rm -r .config
```

- Naklonování repositáře jako `.config`
```bash
cd $HOME &
git clone https://github.com/Lynder063/dotfiles.git .config
```

- Instalace základních balíčků

```bash
yay -S hyprland kitty grim slupr wofi waybar neovim ttf-hack-nerd ttf-font-awesome noto-fonts-emoji network-manager-applet blueman-applet dunst hyprpaper swaylock-effects catppuccin-gtk-theme-mocha hyprshot polkit-gnome gnome-keyring ly nwg-look neofetch nautilus ocs-url wget curl xdg-desktop-portal-hyprland tela-icon-theme
```

- Nastavíme dark theme pro **gnome** aplikace

```bash
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
```
### Zsh

```bash
yay -S zsh zsh-autosuggestions zsh-syntax-highlighting zsh-theme-powerlevel10k 
```

- Pustíme `zsh` a dáme **0** 

- Nainstalujeme [ohmyzsh](https://ohmyz.sh/#install)

> [!WARNING]
> Je potřeba mít nainstalovný balíček `curl` a `wget`


```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

- A vložíme do souboru `.zshrc` toto
```bash
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
ZSH_AUTOSUGGEST_STRATEGY=( history completion )
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"
neofetch
```

### Nautilus
 
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

# Grub 
[Thanks, shvchk <3](https://github.com/shvchk/fallout-grub-theme?tab=readme-ov-file)

- Stáhneme instalační script

```bash
wget -P /tmp https://github.com/shvchk/fallout-grub-theme/raw/master/install.sh
```

- Spustíme
```bash
bash /tmp/install.sh
```

### Ly

- Spustíme deamona pro ly 
```bash
sudo systemctl enable ly --now
```
