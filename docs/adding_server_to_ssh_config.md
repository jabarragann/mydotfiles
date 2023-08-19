# Adding servers to ssh config

Create keys and shared them with server
```bash
# Create new pair of keys
ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_ed25519
# Send public key to server
cat .ssh/id_ed25519.pub | ssh foobar@remote 'cat >> ~/.ssh/authorized_keys'

```

Add server to `.ssh/config`

## TODO

Learn about best practices with ssh-agent. In ubuntu this is not a problem, however in windows WSL is not as automated.

* https://rabexc.org/posts/using-ssh-agent




