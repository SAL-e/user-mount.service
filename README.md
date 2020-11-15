# user-mount.service
My systemd service to manage user's shares by the user or admin.

## Install

```
cd /opt
sudo git clone --depth 1 https://github.com/SAL-e/user-mount.service.git
cd /etc/sudoers.d
sudo ln -s /opt/user-mount.service/sudoers.d/user-mount_service
cd /etc/systemd/user
sudo ln -s /opt/user-mount.service/user-mount@.service
cd ~
```
## Configure

```
cd ~/.config
mkdir -p user-mount.service/credentials
cd user-mount.service/credentials
```

Create one or more credentials files. See: https://wiki.ubuntu.com/MountWindowsSharesPermanently#Use_of_tilde_in_pathnames_such_as_.22credentials.3D.2BAH4-.2F.smbcredentials.22

```
cd ..
```

Create one or more instance list of shares to mount. Using /opt/user-mount.service/username as template.

To test the config:

```
cd ~
systemctl --user start user-mount@<instance>
systemctl --user status user-mount@<instance>
```

To enable automount every time user logs in:

```
systemctl --user enable user-mount@<instance>
```

To disable automount on user logs in:

```
systemctl --user disable user-mount@<instance>
```

To unmount the shares:

```
systemctl --user stop user-mount@<instance>
```


### Old project name: myNet
