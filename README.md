# presstek2258's hyprland config

---

## install instructions

- install arch linux
- chroot post install packages:
```bash
pacman -S neovim git networkmanager
```
- reboot and login into arch

## update and install requirements

```bash
yay -Syu
```

```bash
yay -S ly kitty dunst hyprland hyprpaper xdg-desktop-portal-hyprland qt5-wayland qt6-wayland waybar wofi starship zsh zsh-syntax-highlighting zsh-autosuggestions zoxide neovim tmux pcloud-drive brave-bin htop ttf-jetbrains-mono ttf-font-awesome ttf-nerd-fonts-symbols ripgrep blueman jdk libreoffice-still neofetch npm xarchiver base-devel firewalld galculator ollama-rocm tailscale thunar tldr unrar unzip zip wget nwg-look network-manager-applet blueberry xboxdrv xpadneo-dkms ncdu wl-clipboard
```

## clone repo directly to your .config / .local

> WARNING: THIS WILL REPLACE FILES!!!

```bash
git clone https://github.com/presstek2258/presstek2258-hyprland-dotfiles.git ~/temp-config
rm -rf ~/temp-config/.git
sudo cp -r ~/temp-config/. ~/
rm -rf ~/temp-config
```

## change shell

```bash
chsh -s /bin/zsh
```

> RE-LOG: relog to apply the changes

## change gtk programs theme

> OPEN: GTK-settings (nwg-look) and change the theme

## brightness keys

> choose xbacklight or brightnessctl if not working

```bash
yay -S brightnessctl
```

```shell
brightness_up)
	# Increases brightness and displays the notification
	brightnessctl set +10%
	show_brightness_notif
	;;

brightness_down)
	# Decreases brightness and displays the notification
	brightnessctl set 10%-
	show_brightness_notif
	;;
```

## Fix opening links with "gx" in neovim

add the following lines to `mimeapps.list`

```
text/html=google-chrome.desktop
x-scheme-handler/http=google-chrome.desktop
x-scheme-handler/https=google-chrome.desktop
```

use these for brave instead of google chrome

```
text/html=brave.desktop
x-scheme-handler/http=brave.desktop
x-scheme-handler/https=brave.desktop
```

## Immersed meta quest 3 setup

download the agent to the `Immersed/` folder:

```
https://immersed.com/download
```
> App Image file and run_immersed.sh need execute permissions

## Virtual Box setup

uncheck "Auto capture keyboard" in:   
	input -> keyboard -> keyboard settings -> (input section)
run/install the following:

```
yay -S virtualbox-host-modules-arch virtualbox
```

```
sudo modprobe vboxdrv
sudo modprobe vboxnetflt
sudo modprobe vboxnetadp
sudo vboxreload
```
> RE-LOG: Might require a reboot to take affect

## Virtual Box configuration

Clipboard configuration:
1. unmount the iso file (not needed after installation)
   devices -> optical devices -> remove disk from virtual drive
2. install the guest additions cd
   `sudo sh VBoxLinusAdditions.run`
3. set clipboard setting to "bidirectional"
   settings -> general -> advanced -> Shared clipboard
4. unmount the guest additions cd and reboot

IP configuration:
> Allows IP to show as a 192.168 host
1. set attached to, to "Bridged Adapter"
   settings -> network -> Adapter 1 -> Attached to

