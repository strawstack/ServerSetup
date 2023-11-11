# ServerSetup Action

Github Action to Setup a Server from New Ubuntu 22 LTS Install to Node Server, and Push New Code automatically on Commit.

## Inputs

  server-username:  # id of input
    description: ''
    required: false
    default: 'root'
  server-host:  # id of input
    description: ''
    required: true
  user-email:  # id of input
    description: ''
    required: true
  ssh-key:  # id of input
    description: ''

## `server-username`

The username used to connect to the server. Default is "root".

## `server-host`

**Required** The domain name of the server to setup. Example: name.rch.app (this domain should point to the server IP). 
- See: https://help.hover.com/hc/en-us/articles/217282457-Managing-DNS-records-

## `user-email`

**Required** An email used to request an https certificate using certbot.
- See: https://certbot.eff.org/

## `ssh-key`

**Required** Private ssh key. Public ssh key should be placed on the server.
- See: https://www.digitalocean.com/community/tutorials/how-to-configure-ssh-key-based-authentication-on-a-linux-server

## Example usage

```yaml
name: SSH Deploy
on: [push]
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Deploy Server Step
        uses: strawstack/ssh-node-server-setup@main
        with:
          server-host: ${{ secrets.SERVER_HOST }}
          user-email: ${{ secrets.USER_EMAIL }}
          ssh-key: ${{ secrets.SSH_KEY }}
```

# Add Release Tag
- git tag -a -m "My first action release" v1
- git push --follow-tags
