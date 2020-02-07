# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit

# Load Git prompt
source ~/.zsh/git-prompt.zsh
GIT_PS1_SHOWDIRTYSTATE=1

export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad


pick_a_fish () {
  aquarium=( "🐳 " "🐬 " "🐙 " "🐟 " "🐠 " "🐡 " "🐚 "  )
  echo "${aquarium[RANDOM%${#aquarium[*]}+1]}"
}


# Prompt setup
function precmd {
  # I'm not sure why, but we need to re-run this function
  # on every prompt expansion via precmd - the selected
  # fish is cached otherwise. :(
  pick_a_fish > /dev/null
}
setopt PROMPT_SUBST
PS1='$(pick_a_fish)%F{white}[%~]%F{green}$(__git_ps1 "(%s)")%F{white}$ '


alias rm="rm -i"
alias tmux="tmux -2"
alias ssh="ssh -A"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Load NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Kick off rbenv configuration
eval "$(rbenv init -)"
