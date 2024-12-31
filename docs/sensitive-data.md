# Private Data

Sensitive data are encrypted using [`ansible-vault`](https://docs.ansible.com/ansible/latest/vault_guide/index.html).

```sh
# it will prompt to create a password...
ansible-vault encrypt <file-to-encrypt>

# it will prompt for the password used for encryption...
ansible-vault decrypt <encrypted-file>
```

## SSH keys

SSH key pairs are stored under the [`/ssh-keys`](/ssh-keys/) directory. The private keys are stored encrypted, while the public ones are stored as is.

## 2FA backup codes, keys, and tokens

2FA codes, keys, and tokens for apps/services are stored encrypted in a `*.codes`, `*.key`, `*.token` file respectively, under the [`/private`](/private/) directory.
