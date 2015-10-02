#!/bin/bash
set -e

echo "1. Linking dotfiles..."
$SETUP_SCRIPTS_DIR/link.sh

echo "2. Setting up Homebrew..."
/bin/bash $SETUP_SCRIPTS_DIR/brew/install.sh

echo "3. Changing shell to zsh..."
if [ -f /usr/local/bin/zsh ]; then
    chsh -s /usr/local/bin/zsh
else
    echo "/usr/local/bin/zsh not found!"
    exit 1
fi

echo "4. Modifying keymap..."
/bin/bash $SETUP_SCRIPTS_DIR/osx/keymap.sh

echo "5. Setting sane defaults for OSX..."
/bin/bash $SETUP_SCRIPTS_DIR/osx/defaults.sh

exit 0
