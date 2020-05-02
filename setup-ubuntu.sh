# UPGRADE
sudo apt update -y
sudo apt upgrade -y

# EDITOR
sudo apt install -y neovim python3-neovim

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

# GITCONFIG
git config --global user.name "Daniel Rodriguez Gil"
git config --global user.email "daniel@dpstudios.es"

# TOOLS
sudo apt install -y zip bat silversearcher-ag

# JAVA
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java 13.0.2.hs-adpt
sdk install maven
sdk install gradle

# NVM
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

# DOTFILES
git clone git@github.com:danybmx/dotfiles-workspace.git ~/.dotfiles
sh ~/.dotfiles/install.sh

