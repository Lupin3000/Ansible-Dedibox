# Ansible-Dedibox

## Preparation

Following steps are needed before run Ansible!

- enable passwordless sudo
- add for ansible user to group wheel

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
$ usermod -G wheel <username>
```

Furthermore, the SSH public key must be available to the user.

## Check SSHD configuration

```shell
# run extended test mode
$ sshd -T
```

## Check fail2ban status

```shell
# check fail2ban status
$ fail2ban-client status

# check fail2ban sshd status
$ fail2ban-client status sshd
```

# check firewalld settings
```shell
$ firewall-cmd --list-all
```

# check kernel version
```shell
$ uname r
```
