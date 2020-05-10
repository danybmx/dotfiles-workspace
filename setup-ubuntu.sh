# UPGRADE
sudo apt update -y
sudo apt upgrade -y

# EDITOR
sudo apt install -y neovim python3-neovim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 61
sudo update-alternatives --set vi /usr/bin/nvim
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --set vim /usr/bin/nvim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --set editor /usr/bin/nvim

# DOCKER
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   bionic \
   stable"
sudo apt update -y
sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER
sudo curl -L \
  "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname-s)-$(uname -m)" \
  -o /usr/local/bin/docker-compose
sudo chmod a+x /usr/local/bin/docker-compose

# GITCONFIG
git config --global user.name "Daniel Rodriguez Gil"
git config --global user.email "daniel@dpstudios.es"

# TOOLS
sudo apt install -y zip bat silversearcher-ag direnv tmuxinator

# Java
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java 13.0.2.hs-adpt
sdk install maven
sdk install gradle

# Node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install 12
npm install -g prettier \
  eslint \
  eslint-config-airbnb \
  intelephense \
  javascript-typescript-langserver \
  typescript \
  typescript-language-server \
  vls

# Go
sudo apt install golang

# PHP
sudo apt install -y php php-soap php-mysql php-gd php-xdebug php-xml php-curl composer

# DOTFILES
git clone git@github.com:danybmx/dotfiles-workspace.git ~/.dotfiles
sh ~/.dotfiles/install.sh

