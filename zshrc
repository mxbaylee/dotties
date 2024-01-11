ZSH_THEME="avit"
export PATH="$HOME/.bin:$PATH"
export ZSH=~/.oh-my-zsh

function setnvm() {
  if [ -e "$PWD/.nvmrc" ]; then
    nvm use
  elif [ -e "$PWD/.node-version" ]; then
    nvm use $(cat $PWD/.node-version)
  fi
}

function window_name() {
  if git rev-parse --is-inside-work-tree &>/dev/null; then
    root_dir=$(git rev-parse --show-toplevel)
  else
    root_dir="$PWD"
  fi

  basename "$root_dir"
}

function cd () {
  # real functionality
  builtin cd "$@"

  # nvm
  setnvm

  # tmux rename
  if [ -n "$TMUX" ]; then
    tmux rename-window $(window_name)
  fi
}

plugins=(rbenv nvm autojump)

source $ZSH/oh-my-zsh.sh

[[ -f ~/.zshrc.env ]] && source ~/.zshrc.env
[[ -f /usr/local/bin/virtualenvwrapper.sh ]] && source /usr/local/bin/virtualenvwrapper.sh

# Link neovim
#ln -sf ~/.vim ~/.config/nvim
#ln -sf ~/.vimrc ~/.vim/init.vim
#alias vim="nvim"
