# Pacman Package Manager commands
Pacman is the package manager for Linux distributions based on Arch linux.

## Install package
```bash
sudo pacman -S <package_name>
```

## Remove package
```bash
sudo pacman -R <package_name>
```

## Search for a package
```bash
pacman -Ss <package_name>
```
```bash
pacman -Ss <keyword>
```

## Update and upgrade packages
```bash
sudo pacman -Syu
```

## Find orphaned (unused) packages
```bash
pacman -Qtdq
```

## Remove orphaned (unused) packages
```bash
sudo pacman -Rsn $(pacman -Qdtq)
```
