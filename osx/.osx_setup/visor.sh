#!/bin/bash
# Sets up a second iTerm application that can be run

# Ensure paths are setup first
set -e


BID="com.googlecode.iterm2"

ITERM="$(mdfind kMDItemCFBundleIdentifier = "$BID")"
VISOR="$HOME/Applications/iTermVisor.app"

if [ -d "$VISOR" ]; then
    echo '- Found older version, deleting.'
    rm -r "$VISOR"
fi
echo '- Copying current iTerm.'
cp -r "$ITERM" "$VISOR"

echo '- Modifying plist.'
PLIST="$VISOR/Contents/Info.plist"
/usr/libexec/PlistBuddy -c "Set :CFBundleIdentifier ${BID}visor" "$PLIST"
/usr/libexec/PlistBuddy -c "Set :CFBundleName iTerm2Visor" "$PLIST"
/usr/libexec/PlistBuddy -c "Add :LSUIElement string 1" "$PLIST"

echo '- Setting defaults.'
defaults write com.googlecode.iterm2visor PrefsCustomFolder \
    "${DOTFILES_ROOT_DIR}/osx/iterm2"
