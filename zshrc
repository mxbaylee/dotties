ZSH_THEME="avit"
export ZSH=~/.oh-my-zsh
export PATH="$HOME/.bin:~/.rbenv/bin:$PATH"

setnvm() {
 if [ "$PWD" != "$MYOLDPWD" ]; then
   MYOLDPWD="$PWD";
   if [ -e "$PWD/.nvmrc" ]; then
     nvm use
   fi
 fi
}
function cd () { builtin cd "$@" && setnvm; }

source $ZSH/oh-my-zsh.sh

eval "$(rbenv init -)"

alias serve="python -m SimpleHTTPServer 8000"

export NVM_DIR="~/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh