# How private information are protected

Sensitive and private data, such as 2FA backup codes, SSH private keys, access tokens, licence keys, etc. are all password-encrypted using [`ansible-vault`](https://docs.ansible.com/ansible/latest/vault_guide/index.html).

SSH key pairs are safely stored under the [`/ssh-keys`](/ssh-keys/) directory. The private keys are stored encrypted, while the public ones are stored in clear form.

2FA codes, keys, and tokens for apps/services are stored encrypted in a `*.codes`, `*.key`, `*.token` file respectively, under the [`/private`](/private/) directory.

I've also integrated [`gitleaks`](https://github.com/zricethezav/gitleaks) to run as a pre-commit git hook, to scan for potential secrets being committed.
