# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
source /Users/spencerw/miniconda3/etc/profile.d/conda.sh

# Path to your oh-my-zsh installation.
export ZSH="/Users/spencerw/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" "avit")

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
         brew
         osx
         web-search
         zsh-autosuggestions
         zsh-syntax-highlighting
         vi-mode)

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases


PYPANDOC_PANDOC='/usr/local/bin/pandoc'


# ZSH_WEB_SEARCH_ENGINES=(
#     <context> <URL>
#     <context> <URL>
# )

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR=$(which vim)

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# VS Code
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Haskell
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"
PATH=$PATH:.local/bin

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

fts(){
  find $1 -type f -print | grep $2 | xargs rg $3
}

LD_LIBRARY_PATH=/usr/local/Cellar/

# PATH=/usr/local/bin:$PATH
PYTHONPATH="$PYTHONPATH:/usr/bin/python"
# PATH="$PATH:~/bin"
# PATH=$PATH:$GOPATH/bin

export LSCOLORS=Fxfxcxdxbxegedabagacad

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}


STARTFGCOLOR="\e[0;37m";
STARTBGCOLOR="\e[45m"
ENDCOLOR="\e[0m"
# export PS1="$STARTFGCOLOR$STARTBGCOLOR \t \u@\h\$(parse_git_branch) \W $ENDCOLOR\n>\[$(tput sgr0)\]"

# history
HISTSIZE=5000
HISTFILESIZE=10000
# shopt -s histappend

# set bash tab title in iterm2
# function title {
#     echo -ne "\033]0;"$*"\007"
# }

# show PWD in iterm tab title
# export PROMPT_COMMAND='echo -ne "\033];${PWD}\007"'

#### CTRL ####
export MPLBACKEND=AGG

# export PATH="/Users/spencerw/miniconda3/bin:$PATH"  # commented out by conda initialize
# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/Users/spencerw/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/Users/spencerw/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/Users/spencerw/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/Users/spencerw/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<

# Mono Setting (for C#)
export MONO_GAC_PREFIX="/usr/local"
# export PATH=/Library/Frameworks/Mono.framework/Versions/Current/bin/:${PATH}

function wiki {
    pm2 delete $1-wiki # in case it was already running
    cd ~/wikis/$1 # path to where files are stored
    pm2 start --name $1-wiki /usr/local/bin/tiddlywiki -- --server $2
    echo "Starting Wiki... (Browser will open automatically)"
    sleep .9
    open http://localhost:$2
}

# test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash" || true

export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="$HOME/.gem/ruby/3.0.0/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# export PATH="/usr/local/sbin:$PATH"
