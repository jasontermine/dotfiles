#!/bin/bash

echo "[main]" | sudo tee -a /etc/dnf/dnf.conf
echo "gpgcheck=True" | sudo tee -a /etc/dnf/dnf.conf
echo "installonly_limit=3" | sudo tee -a /etc/dnf/dnf.conf
echo "clean_requirements_on_remove=True" | sudo tee -a /etc/dnf/dnf.conf
echo "best=False" | sudo tee -a /etc/dnf/dnf.conf
echo "skip_if_unavailable=True" | sudo tee -a /etc/dnf/dnf.conf
echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf

sudo dnf install -y \
  git \
  htop \
  firefox \
  neovim \
  micro \
  gh \
  gcc \
  ripgrep \
  zsh \
  zoxide \
  fzf \
  make \
  bzip2 \
  bzip2-devel \
  thunderbird \
  luarocks

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo >> /home/jason/.zshrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/jason/.zshrc

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

sudo chsh -s /bin/zsh $USER

echo "Packages have been installed, Homebrew is set up, and default shell has been changed to /bin/zsh."
