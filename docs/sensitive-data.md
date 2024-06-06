# Sensitive Data

Sensitive data are protected by encryption, using [`ansible-vault`](https://docs.ansible.com/ansible/latest/vault_guide/index.html).

```sh
# it will prompt to create a password...
ansible-vault encrypt <sensitive-data>

# it will prompt for the password used for encryption...
ansible-vault decrypt <sensitive-data>
```

## SSH keys

SSH key pairs are stored under the [`/ssh-keys`](/ssh-keys/) directory. The private keys are stored encrypted, while the public ones are stored as is.

## Backup codes

Backup codes for apps/services are stored encrypted in a `*.codes` file under the [`/backup-codes`](/backup-codes/) directory.
