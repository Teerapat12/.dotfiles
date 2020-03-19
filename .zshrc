# If you come from bash you might have to change your $PATH
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/tchaiwachira/.oh-my-zsh"
export MYVIMRC="/Users/tchaiwachira/.vimrc"
export MYTMUXRC="Users/tchaiwachira/.tmux.conf"

export PATH=/Users/tchaiwachira/Downloads/apache-maven-3.6.1/bin:$PATH
export PATH=/usr/local/Cellar/node/11.0.0/lib/node_modules:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=/Users/tchaiwachira/Library/Python/2.7/bin:$PATH
export NVM_DIR="$HOME/.nvm"
# source ~/.bashrc

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
plugins=(
  git 
  alias-tips
  zsh-autosuggestions
  poetry
  zsh-syntax-highlighting
)

# Disable TMUX auto title
DISABLE_AUTO_TITLE="true"

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vim'
 fi

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Stored all my functions (At Agoda)
source ~/.hotfunction.sh

# Stored all my aliases
source ~/.aliases.sh

# -------------------------------------------------- #
#                    VIM STATUS                      # 
# -------------------------------------------------- #
# # Prepare a vimrc file in ~/.config/nvim folder

# vi mode
bindkey -v
export KEYTIMEOUT=1
# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# export PS1="\w \$ "
source /Users/tchaiwachira/lab/tmp/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
