# SSH configuration of servers

* Read more about SSH config files: https://linux.die.net/man/5/ssh_config

## Security note
NOT safe to have ssh config on a public repo.

## Steps to add keys

```
1. Copy public key to ~/.ssh/authorized_keys 
2. ssh -i private_key user@hostname
3. Create an entry in the config. The identity file is the private key that will be used.
```
