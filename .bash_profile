# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/spencerw/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/spencerw/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/spencerw/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/spencerw/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <

# Haskell
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"
PATH=$PATH:.local/bin

if [ -f ~/.aliases ]; then
   source ~/.aliases
fi

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

if [ -f ~/.inputrc ]; then
   source ~/.inputrc
fi

# set up fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

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

PATH=/usr/local/bin:$PATH
PYTHONPATH="$PYTHONPATH:/usr/bin/python"
PATH="$PATH:~/bin"
PATH=$PATH:$GOPATH/bin

export LSCOLORS=Fxfxcxdxbxegedabagacad

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}


STARTFGCOLOR="\e[0;37m";
STARTBGCOLOR="\e[45m"
ENDCOLOR="\e[0m"
export PS1="$STARTFGCOLOR$STARTBGCOLOR \t \u@\h\$(parse_git_branch) \W $ENDCOLOR\n>\[$(tput sgr0)\]"

# history
HISTSIZE=5000
HISTFILESIZE=10000
shopt -s histappend

# set bash tab title in iterm2
function title {
    echo -ne "\033]0;"$*"\007"
}

# show PWD in iterm tab title
export PROMPT_COMMAND='echo -ne "\033];${PWD}\007"'

#### CTRL ####
export MPLBACKEND=AGG

# Mono Setting (for C#)
export MONO_GAC_PREFIX="/usr/local"
export PATH=/Library/Frameworks/Mono.framework/Versions/Current/bin/:${PATH}

function wiki {
    pm2 delete $1-wiki # in case it was already running
    cd ~/wikis/$1 # path to where files are stored
    pm2 start --name $1-wiki /usr/local/bin/tiddlywiki -- --server $2
    echo "Starting Wiki... (Browser will open automatically)"
    sleep .9
    open http://localhost:$2
}

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash" || true

export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="$HOME/.gem/ruby/3.0.0/bin:$PATH"
