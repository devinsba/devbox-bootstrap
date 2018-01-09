#!/usr/bin/env bash

function macos_prepare_for_installs() {
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

function linux_prepare_for_installs() {
    sudo apt-get update
    sudo apt-get upgrade -y
}

function linux_install_deps() {
    sudo apt-get install git -y
}

sudo -v

case $(uname) in
Darwin)
    macos_prepare_for_installs
    ;;
Linux)
    linux_prepare_for_installs
    linux_install_deps
    ;;
esac

git clone https://github.com/devinsba/devbox-bootstrap /tmp/bootstrap