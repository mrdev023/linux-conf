# Author

Github: jnettlet


# Source Url:

99-asus-falchion.hwdb : [GITHUB](https://gist.github.com/jnettlet/afb20a048b8720f3b4eb8506d8b05643)

40-libinput.conf : [Ask Ubuntu](https://askubuntu.com/questions/1351203/how-do-i-stop-my-rog-falchion-wireless-keyboard-from-rebooting-ubuntu)

# Installation

## X11

Append the following config to /usr/share/X11/xorg.conf.d/40-libinput.conf or use this and add it in startup script see `example_script.sh`

```bash
xinput disable XX # XX being the device id related to 'ASUSTeK ROG FALCHION System Control'
```