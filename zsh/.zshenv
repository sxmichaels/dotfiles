export EDITOR=nvim

# Set up the usual paths (including Homebrew), plus TeX paths
# Manpath must be set before path_helper
export MANPATH="/usr/local/man:$MANPATH"
eval `/usr/libexec/path_helper -s`

# ADB
export PATH="$HOME/devtools/android-sdks/platform-tools:$PATH"

# Brewed Mac Emacs
export PATH="/usr/local/opt/emacs-mac/bin:$PATH"

# Neovim runtime
export VIMRUNTIME="/usr/local/opt/neovim/share/nvim/runtime"

# The current version of gpg-agent causes errors in ssh-agent, so the following
# is disabled for now. See https://bugzilla.redhat.com/show_bug.cgi?id=1274245.
# On Mac, load GPG agent information into env vars
#if [[ $(uname) == Darwin ]]; then
#    if [ -f "${HOME}/.gpg-agent-info" ]; then
#        . "${HOME}/.gpg-agent-info"
#        export GPG_AGENT_INFO
#        export SSH_AUTH_SOCK
#    fi
#fi

# Tell pinentry where to prompt for the password
#export GPG_TTY=$(tty)
