# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=/home/lmartini/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="luca"
POWERLEVEL9K_MODE='nerdfont-complete'
ZSH_THEME="powerlevel10k/powerlevel10k"
#ZSH_THEME="apollo"

git_project(){
	local repoTopLevel="$(command git rev-parse --show-toplevel 2> /dev/null)"
	[[ $? != 0 || -z $repoTopLevel ]] && return
    
	local base="$(command basename $repoTopLevel 2> /dev/null)"
	echo -n " $base"
}

POWERLEVEL9K_CUSTOM_PROJECT_NAME="git_project"
POWERLEVEL9K_CUSTOM_PROJECT_NAME_ICON=$'\uf7a1'
POWERLEVEL9K_CUSTOM_PROJECT_NAME_BACKGROUND='orchid'

node_env(){
	echo -n "$NODE_ENV"
}
POWERLEVEL9K_CUSTOM_NODE_ENV="node_env"
POWERLEVEL9K_CUSTOM_NODE_ENV_BACKGROUND='green'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon status command_execution_time background_jobs ssh context dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(custom_project_name vcs root_indicator custom_node_env time)
POWERLEVEL9K_DIR_PATH_ABSOLUTE="true"
POWERLEVEL9K_PROMPT_ON_NEWLINE="true"
POWERLEVEL9K_RPROMPT_ON_NEWLINE="true"
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_ETC_ICON=''
# POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#808080"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-nvm npm sudo fast-syntax-highlighting zsh-autosuggestions zsh-completions)

# User configuration
# export TERM="xterm-256color"
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/bin
export PATH="$HOME/.cargo/bin:$PATH"
export DOCKER_HOST=tcp://127.0.0.1:2375
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
alias ls="ls --color=always"
alias ll="ls -htl"
alias find="fd"

alias vi="vim"
alias top="top -o %CPU"
alias diff="diff --color=always"
alias npmc="npm run commit"

#export CMAKE_PREFIX_PATH=$QT_PATH
# shell is en
export LANG=en_US.UTF-8
export LANGUAGE=en.UTF-8
export EDITOR=vim
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export ACCOUNTS=/mnt/c/Users/lmartini/nwg/services/accounts/accounts/index.js
export NEWS=/mnt/c/Users/lmartini/nwg/services/news/news/index.js
export ENERGY=/mnt/c/Users/lmartini/nwg/services/energy/energy/index.js
export MYFOCUS=/mnt/c/Users/lmartini/nwg/services/myfocus/myfocus/index.js
export NEWS=/mnt/c/Users/lmartini/nwg/services/news/news/index.js
export ISTAT=/mnt/c/Users/lmartini/nwg/services/istat/istat/index.js
export COURSES=/mnt/c/Users/lmartini/nwg/services/courses/courses/index.js
export HIRINGS=/mnt/c/Users/lmartini/nwg/services/hirings/hirings/index.js
export USERS=/mnt/c/Users/lmartini/nwg/services/users/users/index.js
export IVD=/mnt/c/Users/lmartini/nwg/services/ivd/ivd/index.js
export FV=/mnt/c/Users/lmartini/nwg/services/fv/fv/index.js
unsetopt share_history

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
