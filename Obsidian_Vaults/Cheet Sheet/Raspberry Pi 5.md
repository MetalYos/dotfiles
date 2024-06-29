## Create user directories in Raspberry Pi OS Light
1. Download the `xdg-user-dirs` package using the following command:
```shell
sudo apt install xdg-user-dirs
```
2. Login as the relevant user and run 
```shell
xdg-user-dirs-update
```

## Install LightDM and i3 on Raspberry Pi OS Light
1. install `Xorg` using the following command: 
```shell
sudo apt install xorg
```
2. Install `LightDM` using the following command:
```shell
sudo apt install lightdm
```
3. Install any greeter you want, for example:
```shell
sudo apt install lightdm-gtk-greeter
```
4. Open the `LightDM` configuration file from:
```shell
/etc/lightdm/lightdm.conf
```
5. Uncomment the `greeter-session` option and enter the greeter you downloaded in step 3, for example:
```
greeter-session=lightdm-gtk-greeter
```
Note: you can also write your user in the `autologin-user` so the login will be for that user by default.
6. Enable the `LightDM` service so it will start at boot:
```shell
sudo systemctl enable lightdm.service
```
7. Install `i3` using the following command:
```shell
sudo apt install i3 dmenu suckless-tools
```
8. Change in `systemctl` the default target to be graphical, otherwise after boot it will open a tty instead of lightdm:
```shell
sudo systemctl set-default graphical.target
```
9. Install a terminal emulator, otherwise you won't be able to open a terminal in `i3`, for example:
```shell
sudo apt install sakura
```
10. Install a browser, for example
```shell
sudo apt install firefox
```
11. Install a file explorer, for example:
```shell
sudo apt install ranger
```
12. Install an archive manager, for example:
```shell
sudo apt install xarchiver
```

## Install latest Neovim version on Raspberri OS
1. Open terminal and clone the `Neovim` repository:
```shell
git clone https://github.com/neovim/neovim
cd neovim
```
2. Build `Neovim` with release configuration:
```shell
make CMAKE_BUILD_TYPE=Release
```
3. Create a Debian package from the build results and install it:
```shell
cd build && sudo cpack -G DEB && sudo dpkg -i nvim-linux64.deb
```

Later when you want to update `Neovim` do the following:
1. Go to the `Neovim` folder you cloned and pull if from `git`:
```shell
git pull
```
If you removed the repository, you need to clone it again (and then you don't need to pull it).
2. run the following command to clean the previous build (if needed):
```shell
sudo make distclean
```
3. Build `Neovim` as before:
```shell
make CMAKE_BUILD_TYPE=Release
```
4. Build the Debian package and install it as before:
```shell
cd build && sudo cpack -G DEB && sudo dpkg -i nvim-linux64.deb
```

Note:
Dependencies needed:
```shell
sudo apt install git
sudo apt install cmake
sudo apt install build-essential
sudo apt install gettext
sudo apt install npm
```
`npm` is needed for Mason.

## Change monitor input using terminal
1. Enable `I2C` in `raspi-config` by doing the following:
	1. Enter `raspi-config` by entering in the terminal `sudo raspi-config`.
	2. Go to `3. Interface Options`.
	3. Select `I4 I2C`.
	4. When asked if you would like to enable it, select Yes.
	5. Select `Finish` to close `raspi-config`.
	6. Reboot the machine.
2. Install `ddcutil` by entering the following command:
```shell
sudo apt install ddcutil
```
3. To see all of the input options, enter the following:
```shell
ddcutil vcpinfo 60 --verbose
```
4. To change input (for example, HDMI-1), enter the following:
```
ddcutil setvcp 60 0x11
```

## Find X11 Keycodes
In the terminal enter the `xev` command. After the command is executed, press on any key you want to find the keycode of, a printing with the relevant data will appear in the console.