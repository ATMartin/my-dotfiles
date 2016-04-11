gitsource="/usr/local/etc/bash_completion.d"
source $gitsource/git-completion.bash
source $gitsource/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1

export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad

function pick_a_fish { 
  aquarium=( "🐳 " "🐬 " "🐙 " "🐟 " "🐠 " "🐡 " "🐚 "  )
  echo "${aquarium[RANDOM%${#aquarium[*]}]}"
}

export PS1='\[\033[1;37m\]$( pick_a_fish )[\w]\[\033[0;32m\]$(__git_ps1 "(%s)")\[\033[1;37m\]$ \[\033[0m\]'

alias rm="rm -i"
alias tmux="tmux -2"
alias ssh="ssh -A"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
