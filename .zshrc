#!/bin/zsh

export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export LC_TIME='en_US.UTF-8'
export LC_MESSAGES='en_US.UTF-8'


# PATH
export PATH=/usr/bin:/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH


# History
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=100000
setopt extended_history
setopt share_history         
setopt hist_verify
setopt hist_ignore_dups
zstyle ':completion:*' history-size $HISTSIZE
zstyle ':completion:*' save-history $SAVEHIST


# Color settings
export TERM=xterm-256color
export LSCOLORS=ExFxCxdxBxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export ZLS_COLORS=$LS_COLORS

## Color for completion
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'
zstyle ':completion::complete:*' use-cache true

## Color for prompts
autoload -U colors; colors


## Prompr view
function {
  # Show hosts and dir
  PROMPT="%{${fg[green]}%}%n@%m %{${fg[yellow]}%}%3~%{${reset_color}%} "
  # Show more cmd
  PROMPT2="%{${fg[green]}%}%_%%%{${reset_color}%} "
  # Fix spell miss
  SPROMPT="%{${fg[green]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
  # Show host when connect remote
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
  RPROMPT='`check_git_status`'
}
setopt prompt_subst


## Git branch name and status
function check_git_status {
  local name st color

  # Skip in .git
  if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
    return 0
  fi

  # Branch name
  name=$(git symbolic-ref HEAD 2> /dev/null | sed 's!refs/heads/!!')

  # Skip branch name is empty
  if [[ -z $name ]]; then
    return 0
  fi

  # status
  st=$(git status --short 2> /dev/null)

  # Color for status
  case "$st" in
    "") color=${fg[green]} ;;           # Status clean
    *"\?\? "* ) color=${fg[yellow]} ;;  # Untracked
    *"\ M "* ) color=${fg[red]} ;;      # Modified
    * ) color=${fg[cyan]} ;;            # Added to commit
  esac

  echo "[%{$color%}$name%{$reset_color%}]"
}


# Completion
autoload -U compinit promptinit; compinit
setopt correct
setopt auto_menu

setopt auto_list
setopt list_packed

setopt list_types
setopt noautoremoveslash
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

setopt auto_param_keys
setopt magic_equal_subst
unsetopt promptcr

setopt extended_glob

setopt numeric_glob_sort

setopt print_eight_bit

setopt nobeep
