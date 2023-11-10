# Arguments
# 1 REPO_OWNER
# 2 REPO_URL
# 3 SERVER_NAME
# 4 USER_EMAIL

# Run Command
# ssh -i id_rsa root@host "bash -s" < init.sh REPO_OWNER REPO_URL SERVER_NAME USER_EMAIL

if test -f ~/deploy.sh; then
    echo "deploy.sh found"
    exit 0
fi
echo "deploy.sh not found"

sudo apt-get -y update

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion" # This loads nvm bash_completion
nvm install 18 && nvm use 18

sudo apt-get install -y npm
sudo apt install git
sudo apt-get install -y nginx
sudo npm install -g pm2

git clone $2 repo

sudo rm /etc/nginx/sites-enabled/default

cd ~/repo

servername=$3
sed "s/SERVER_NAME_HERE/${servername}/g" < nginx.conf > site.nginx.conf

sudo ln -s ~/repo/site.nginx.conf /etc/nginx/sites-enabled/site.nginx.conf

sudo service nginx restart

sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot

sudo certbot --noninteractive --nginx --agree-tos --cert-name certbot_cert -d $3 -m $4

npm install

pm2 start server.mjs
pm2 startup
pm2 save
