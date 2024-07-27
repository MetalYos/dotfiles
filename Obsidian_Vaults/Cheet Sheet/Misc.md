## From M3U8 to MP4
```bash
ffmpeg -protocol_whitelist file,http,https,tcp,tls -allowed_extensions ALL -i VodRecovery_danistem_41706332075.m3u8 -bsf:a aac_adtstoasc -c copy VodRecovery_danistem_41706332075.mp4
```

## Change dmenu in i3 to use desktop files
This change can be done in your i3 config file: in the hotkey definition for dmenu (Super+d in a standard i3 installation), replace oiginal binding to run `i3-dmenu-desktop`.
## Python VodRecovery arguments
```bash
python RecoverVod.py -d -u -v -s https://streamscharts.com/channels/danistem/streams/42181423963

python RecoverVod.py -d -u -v -l vods_list.txt
```

## Find command examples
1. If you need to know how to find a file in Linux called thisfile.txt, it will look for it in current and sub-directories.
```bash
find . -name thisfile.txt
```

2. Look for all .jpg files in the /home and directories below it.
```bash
find /home -name *.jpg
```

3. Look for an empty file inside the current directory.
```bash
find . -type f -empty
```

4. Look for all .db files (ignoring text case) that have been changed in the preceding 6 days by a user called _randomperson_.
```bash
find /home -user randomperson-mtime 6 -iname ".db"
```

## Create clangd compiler_commands.json file
1. Download `bear`, for example, in Arch Linux:
```bash
sudo pacman -S bear
```

2. Navigate to the folder where the main `Makefile` is located.
3. Clean the build folder, either manually, or by running `make clean`
4. Run the following command:
```bash
bear -- make
```
compiler_commands.json files will be created where needed.

## GIT - use SSH key
### Generating new SSH key
1. Open terminal.
2. Enter the following command to create the key: 
```shell
ssh-keygen -t ed25519 -C "your_email@example.com"
```
You can change the key location if you want, just remember the location and name.

### Add the SSH key to the SSH-Agent
1. Start the ssh-agent in the background.
	```shell
	eval "$(ssh-agent -s)"
```
2.  Add your SSH private key to to the SSH-Agent:
	```shell
	ssh-add ~/.ssh/id_ed25519
```

### Add the SSH public key to Github
1. Copy the SSH public key to the clipboard.
```shell
cat ~/.ssh/id_ed25519.pub
# Then select and copy the contents of the id_ed25519.pub file
# displayed in the terminal to your clipboard
```
Note: If you have `xclip` installed, you can copy the file content into the system clipboard by executing:
```bash
xclip -sel clip ~/.ssh/id_ed25519.pub
```
2. Open a web browser and enter `github.com` and sign in.
3. In the upper-right corner of any page, click your profile photo, then click Settings.
4. In the "Access" section of the sidebar, click **SSH and GPG keys**.
5. Click **New SSH key** or **Add SSH key**.
6. In the "Title" field, add a descriptive label for the new key. For example, if you're using a personal laptop, you might call this key "Personal laptop".
7. Select the type of key, either authentication or signing.
8. In the "Key" field, paste your public key.
9. Click **Add SSH key**.
10. If prompted, confirm access to your account on GitHub.

## GIT - Switching remote URLs from HTTPS to SSH
1. Open Terminal.
2. Change the current working directory to your local project.
3. List your existing remotes in order to get the name of the remote you want to change.
```shell
git remote -v
> origin  https://github.com/OWNER/REPOSITORY.git (fetch)
> origin  https://github.com/OWNER/REPOSITORY.git (push)
```
4. Change your remote's URL from HTTPS to SSH with the `git remote set-url` command.
```shell
git remote set-url origin git@github.com:OWNER/REPOSITORY.git
```
6. Verify that the remote URL has changed.
```shell
git remote -v
# Verify new remote URL
> origin  git@github.com:OWNER/REPOSITORY.git (fetch)
> origin  git@github.com:OWNER/REPOSITORY.git (push)
```


## GIT - discard changes at working directory
```bash
git checkout -- filename
```

## List all fonts in the system
Open the terminal application. To list all font faces, run:
```bash
fc-list
```

Use the `more` command as pager or `grep` to search for fonts:
```bash
fc-list | more
fc-list | grep -i "word"
fc-list | grep -i UbuntuMono
```

## Delete word in terminal
To delete a word in the terminal press on `Ctrl+w`.

## Change GTK3 to dark theme
If the file `~/.config/gtk-3.0/settings.ini` does not exist, create it. In the file add:
```
[Settings]
gtk-application-prefer-dark-theme = true
```

## Automount SMB shared folder using fstab
1. Install cifs-utils if it is not installed, for example:
```shell
sudo pacman -S cifs-utils
```
2. Backup your `/etc/fstab` file just in case something breaks.
3. Create a new file with your credentials, for example: `/etc/samba/credentials/smb_share`
4. In the credentials file add:
```shell
username=USERNAME
password=PASSWORD
workgroup=WORKGROUP
```
Where USERNAME is the your SMB shared folder username, PASSWORD is your SMB shared folder username and WORKGROUP (optional) is your SMB shared folder workgroup.
5. Add the following line to the **end** of the `/etc/fstab` file:
```shell
//servername/sharename /path/to/mount cifs x-systemd.automount,x-systemd.idle-timeout=1min,rw,uid=yourusername,gid=yourgroupname,credentials=/etc/samba/private/sharename.cred,iocharset=utf8,vers=2.0 0 0
```
6. To check that it works, enter the following command:
```shell
sudo systemctl daemon-reload
sudo mount -av
```
The first line makes sure that systemd will use the updated fstab file.
Make sure there are no errors. Go to the `/path/to/mount` folder and make sure that it was mounted.
