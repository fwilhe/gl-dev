#!/bin/bash
set -eux -o pipefail

git config --global user.name "Florian Wilhelm"
git config --global user.email 2292245+fwilhe@users.noreply.github.com

sudo update-alternatives --set editor /usr/bin/vim.basic

mkdir -p ~/.bin
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh --output ~/.bin/git-prompt.sh

echo "

export PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]user@dev\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

if [ -f ~/git-prompt.sh ]; then
	. ~/.bin/git-prompt.sh
	export GIT_PS1_SHOWDIRTYSTATE=1
	export PS1='\w$(__git_ps1 " (%s)")\$ '
fi

if command -v nala &> /dev/null; then
  alias i='sudo nala install'
  alias I='sudo nala install --assume-yes'
  alias up='sudo nala upgrade'
  alias se='nala search'
  alias sho='nala show'
  alias re='sudo nala remove'
  alias cl='sudo nala autoremove'
else
  alias i='sudo apt install'
  alias I='sudo apt install --assume-yes'
  alias up='sudo apt update && sudo apt upgrade'
  alias se='apt search'
  alias sho='apt show'
  alias re='sudo apt remove'
  alias cl='sudo apt autoremove'
fi

alias ls='ls --group-directories-first --time-style=+\"%Y-%m-%d %H:%M\" --color=auto --classify'
alias ll='ls -lh'
alias la='ls -lah'
alias lh=la

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Git aliases - based on http://www.catonmat.net/blog/git-aliases/
alias g=git
alias ga='git add'
alias gp='git push'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gm='git commit'
alias gb='git branch'
alias gc='git checkout'
alias gci='git commit'
alias gcl='git clone'" >> ~/.bashrc

git config --global init.defaultBranch main
git config --global --add --bool push.autoSetupRemote true
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.rb rebase
git config --global alias.ci commit
git config --global alias.br branch
git config --global alias.cp cherry-pick
git config --global alias.fa 'fetch --all'
git config --global alias.lg 'log --graph --decorate --pretty=oneline --abbrev-commit'
git config --global alias.ls 'log --decorate --pretty=oneline --abbrev-commit'
git config --global credential.helper store
