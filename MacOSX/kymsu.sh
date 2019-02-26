#!/bin/bash

echo "#######"
echo "## Homebrew"
echo "#######"
echo "## update"
brew update

echo "## upgrade"
brew upgrade

echo "## cleanup"
brew cleanup -s

echo "## diagnosis"
brew doctor
brew missing

echo
echo "#######"
echo "## Mac App Store"
echo "#######"
echo "## Applications to update :"
mas outdated

echo "## updade "
mas upgrade
