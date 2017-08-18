# Ansible

## Preparation

Following steps are needed before run Ansible!

- enable passwordless sudo
- add user to user group wheel

```shell
# edit the sudoers file
$ visudo
...
## Allows people in group wheel to run all commands
# %wheel        ALL=(ALL)       ALL

## Same thing without a password
%wheel  ALL=(ALL)       NOPASSWD: ALL
...

# modify user group
$ usermod -G wheel lupin
```

Furthermore, the SSH public key must be available to the user lupin.

## Check fail2ban status

```shell
# check fail2ban status
$ fail2ban-client status

# check fail2ban sshd status
$ fail2ban-client status sshd
```
