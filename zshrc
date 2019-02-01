# Path to your oh-my-zsh installation.
  export ZSH=/home/lmartini/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="luca"
ZSH_THEME="powerlevel9k/powerlevel9k"

git_project(){
	git rev-parse 2> /dev/null
	if [[ $? != 0 ]]
	then 
		echo ""
	else
		local name=$(basename `git rev-parse --show-toplevel` 2> /dev/null) 
		echo -n "${name}"
	fi
}

POWERLEVEL9K_CUSTOM_PROJECT_NAME="git_project"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir custom_project_name vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status ssh root_indicator background_jobs time)
POWERLEVEL9K_DIR_PATH_ABSOLUTE="true"
POWERLEVEL9K_PROMPT_ON_NEWLINE="true"

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
plugins=(zsh-nvm npm sudo docker zsh-syntax-highlighting)

# User configuration
# node PATH
export PATH="$HOME/.node/current/bin:$PATH"
# PHP Composer PATH
export PATH="$HOME/.config/composer/vendor/bin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"
export PATH=$PATH:/usr/local/go/bin
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
alias ll="ls -hl"
alias vi="vim"
alias top="top -o %CPU"
alias diff="diff --color=always"

#export CMAKE_PREFIX_PATH=$QT_PATH
# shell is en
export LANG=en_US.UTF-8
export LANGUAGE=en.UTF-8
export EDITOR=vim
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

unsetopt share_history

