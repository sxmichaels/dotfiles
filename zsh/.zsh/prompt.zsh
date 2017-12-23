BOXL="┤"
BOXR="├"
ENDR="╼"
ENDL="╾"
SEP="─"
function boxify {
	local text=$1
	local color=$2

	# Note: I intentionally don't reset the color at the end; this lets the
	# end char inherit the color if necessary
	echo "%{$fg[$color]%}${BOXL}${text}%{$fg[$color]%}${BOXR}"
}

PROMPT_EXIT_CODE="%(?..\
%{$fg_bold[red]%}%?%{$reset_color%} )"

PROMPT_ROOT_STATUS="%(!.\
%{$fg_bold[red]%}#%{$reset_color%} .)"

# See https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/git.zsh
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="" # TODO
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[red]%}+%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="*"
ZSH_THEME_GIT_PROMPT_RENAMED="↺"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_STASHED="" # TODO
ZSH_THEME_GIT_PROMPT_UNMERGED="" # TODO
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="↑"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="↓"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="⇅"
ZSH_THEME_GIT_PROMPT_EQUAL_REMOTE="="
ZSH_THEME_GIT_PROMPT_CLEAN=""

function prompt_dynamic_section {
	local git_status="$(git_prompt_info)$(git_remote_status)"
	local dprompt=""

	if [ ! -z "$git_status" ]; then
		dprompt+="$(boxify $git_status cyan)"
	fi
		
	# Add an extra separator if there is content available
	if [ "$dprompt" != "" ]; then
		dprompt="─$dprompt"
	fi

	# Always add the end character
	echo "$dprompt$ENDR"
}

function set_prompt {
    VIM_PROMPT="%{$fg_bold[blue]%}NORMAL%{$reset_color%} "

    # Can also use %(4~|.../%3~|%~) or %(5~|%-1~/…/%3~|%4~)
    ((PATH_LEN = `tput cols` - 40))
	PROMPT="\
%{$fg[blue]%}┌\
$(boxify "%n@%m" blue)\
─\
$(boxify "%${PATH_LEN}<..<%~%<<" yellow)\
$(prompt_dynamic_section)
%{$fg[blue]%}└╼%{$reset_color%} "

	RPROMPT="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$PROMPT_EXIT_CODE$PROMPT_ROOT_STATUS"
}

# Show the correct editor mode on the right hand side of the prompt
function zle-line-init zle-keymap-select {
	set_prompt
    #zle reset-prompt
}
set_prompt

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1
