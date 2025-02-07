#!/bin/bash

install_homebrew_fedora() {
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

OS="$(uname -s)"
case "${OS}" in
  Linux*)
    if [ -f /etc/fedora-release ]; then
      install_homebrew_fedora
    else
      echo "Unsupported Linux distribution"
      exit 1
    fi
    ;;
  *)
    echo "Unsupported operating system: ${OS}"
    exit 1
    ;;
esac

echo "Homebrew installation complete."
