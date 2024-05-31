# i3 configuration notes

## Installation
1. In Arch linux run the command `sudo pacman -S i3`
2. Configuration file is located at `~/.config/i3/config`.

### Configuration changes
1. Use h,j,k,l vim keybindings for focus switching and moving windows (in addition to arrow keys).
2. Use `$mod+z` to change split mode to horizontal.
3. Use `$mod+x` to change split mode to vertical.
4. In order to open ranger terminal file explorer using i3, you need to open a terminal for it to live in. For example, using Alacritty:
```
bindsym $mod+F3 exec alacritty -e ranger
```

### Background images
1. We use `feh` to handle background images. To download it in arch run `sudo pacman -S feh`.
2. We start feh at i3 startup.
3. The configuration we used for feh is:
```
feh --randomize --slideshow-delay 3600 --bg-center ~/Pictures/*
```
This means that each i3 startup a random image from `~/Pictures` will be shown as the background with center scaling, and it will change the image every 3600 seconds (an hour).
4. The full configuration line in `i3` is:
```
exec_always --no-startup-id "feh --slideshow-delay 3600 --bg-center --randomize ~/Pictures/*"
```

### Automatically staring applications on i3 startup
By using the `exec` keyword outside a keybinding, you can configure which commands will be performed by i3 on initial startup. `exec` commands will not run when restarting i3, if you need a command to run also when restarting i3 you should use the `exec_always` keyword. These commands will be run in order.

The `--no-startup-id` parameter disables startup-notification support for this particular exec command. With startup-notification, i3 can make sure that a window appears on the workspace on which you used the exec command. Also, it will change the X11 cursor to watch (a clock) while the application is launching. So, if an application is not startup-notification aware (most GTK and Qt using applications seem to be, though), you will end up with a watch cursor for 60 seconds.

### Start a compositor (picom in our case)
1. Install `picom`, in arch linux run `sudo pacman -S picom`.
2. Copy the default configuration file from `/etc/xdg/picom.conf` to `~/.config/picom/picom.conf` or to `~/.config/picom.conf`.
3. Change any parameters you'd like.
4. In the i3 configuration file add the following line:
```
exec --no-startup-id picom --config ~/.config/picom/picom.conf -b
```
Note: the `-b` option will let picom run as a daemon process.

### Alacritty configuration
1. Create the file `~/.config/alacritty/alacritty.toml`.
2. To add `catppuccin` themes, go to [Catpuccin for Alacritty Github Page(https://github.com/catppuccin/alacritty).
3. For the full configuration documentation , go to:
[Alacritty Config Documentation](https://alacritty.org/config-alacritty.html).

### i3 locking screen
We will use `i3lock-color` instead of the regular `i3lock` screen, to make it more friendly to the eyes.
1. The first thing we need to do is remove the regular `i3lock` package as it will conflict with the color one. Run `sudo pacmna -R i3lock`.
2. Install `i3lock-color` from the AUR using `yay i3lock-color`.
3. Create a new directory to hold out scripts in particulary the `i3lock-color` script `mkdir -p ~/.config/scripts`.
4. Create a new file that will be the lock screen script `touch ~/.config/scripts/lock`.
5. In that file enter the `i3lock color` script you want to run (there are plenty of examples on the internet).
6. Make the file executable: `sudo chmod +x ~/.config/scripts/lock`.
7. In the `i3` configuration file add a key binding to lock the screen, for example:
```
# Shortcut for Lockscreen
bindsym $mod+x exec /home/$USER/.config/scripts/lock
```

optional dependencies for ranger
    atool: for previews of archives
    elinks: for previews of html pages
    ffmpegthumbnailer: for video previews
    highlight: for syntax highlighting of code
    imagemagick: auto-rotate image previews based on EXIF data
    libcaca: for ASCII-art image previews
    lynx: for previews of html pages
    mediainfo: for viewing information about media files
    odt2txt: for OpenDocument texts
    perl-image-exiftool: for viewing information about media files
    poppler: for pdf previews
    python-chardet: in case of encoding detection problems
    python-pillow: for in-terminal preview of images in Kitty
    sudo: to use the "run as root"-feature [installed]
    transmission-cli: for viewing bittorrent information
    ueberzug: for previews of images
    w3m: for previews of images and html pages

tldr

sudo pacman -S ttf-cascadia-code-nerd ttf-cascadia-mono-nerd

### Install arm-none-eabi-gcc on Raspberry Pi 5 with ArchLinux Arm
1. Download the latest arm-none-eabi toolchain for aarch64 from:
[Arm GNU Toolchain](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/downloads).
2. Extract the content of the tarball that was downloaded to /opt/ with the command:
```
sudo tar xvf ~/Downloads/gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf.tar.xz -C /opt/
```
In the example case the file that was downloaded was `gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf.tar.xz`.
3.Open the `~/.bashrc` file in a text editor and add the `bin` directory in what was moved to `opt` to the `PATH`:
```
export PATH="/opt/gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf/bin:$PATH"
```
4. Restart the terminal.
