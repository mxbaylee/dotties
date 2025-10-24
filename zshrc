# zshrc 🐚
# ZSH configuration with oh-my-zsh setup

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 1
ZSH_THEME="avit"
export PATH="$HOME/.bin:$PATH"
export ZSH=~/.oh-my-zsh

# Auto-switches node version based on project files 🔄
# Checks for:
#   → .nvmrc file
#   → .node-version file
function setnvm() {
  if [ -e "$PWD/.nvmrc" ]; then
    nvm use
  elif [ -e "$PWD/.node-version" ]; then
    nvm use $(cat $PWD/.node-version)
  fi
}

# Gets current project name for tmux window 📝
# Uses:
#   → Git root directory if in repo
#   → Current directory if not in git
function window_name() {
  if git rev-parse --is-inside-work-tree &>/dev/null; then
    root_dir=$(git rev-parse --show-toplevel)
  else
    root_dir="$PWD"
  fi

  basename "$root_dir"
}

# Enhanced cd command with extra features 📂
# Does:
#   → Normal directory change
#   → Updates node version
#   → Updates tmux window name
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


# 🐳 Wrapper for the Docker CLI that auto-starts Docker Desktop on macOS if it’s not already
# running. This prevents the classic “Cannot connect to the Docker daemon” error when you
# forget to launch Docker Desktop first.
docker() {
  if ! test -S /var/run/docker.sock; then
    echo "Starting Docker Desktop..."
    open -a Docker
    # Wait until Docker socket exists *and* Docker responds
    while ! test -S /var/run/docker.sock || ! docker info >/dev/null 2>&1; do
      sleep 1
    done
    echo "Docker is ready."
  fi
  command docker "$@"
}

# Oh-my-zsh plugins 🔌
plugins=(nvm autojump)

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Load local environment if exists 🌍
[[ -f ~/.zshrc.env ]] && source ~/.zshrc.env
