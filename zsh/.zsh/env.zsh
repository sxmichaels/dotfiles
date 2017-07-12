# Set neovim runtime from Homebrew
export EDITOR=nvim
export VIMRUNTIME="/usr/local/opt/neovim/share/nvim/runtime"

# Setup Homebrew man paths, plus TeX paths
# NOTE: Manpath must be set before calling path_helper
export MANPATH="/usr/local/man:$MANPATH"
eval `/usr/libexec/path_helper -s`

# ADB
export PATH="$HOME/devtools/android-sdks/platform-tools:$PATH"

# Brewed Mac Emacs
# export PATH="/usr/local/opt/emacs-mac/bin:$PATH"

# Disable homebrew beer mug
export HOMEBREW_NO_EMOJI=1

# Expected by last-working-dir
# TODO: Not automatically created. Should I do so here?
export ZSH_CACHE_DIR="$ZSH/cache"