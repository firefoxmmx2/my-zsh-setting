source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/fzf.zsh
export VISUAL=nvim


alias top="htop"
alias dc=docker-compose
alias blc=bluetoothctl
alias blwh="bluetoothctl connect 38:18:4C:7D:C6:5C"
alias blmdr="bluetoothctl connect 04:5D:4B:41:38:2E"
alias syc=systemctl
alias sus="systemctl suspend"
alias vim=nvim
alias pk=pikaur
alias rg='ranger --choosedir=$HOME/.rangerdir; LASTDIR=$(cat $HOME/.rangerdir); cd $LASTDIR'
alias s=screenfetch
# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git man node bundler svn last-working-dir catimg rsync extract python fzf)

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

proxyon () {
    export HTTP_PROXY="socks5://localhost:1081"
    # export HTTPS_PROXY="socks5://localhost:1081"
}

proxyoff() {
    export HTTP_PROXY=""
    export HTTPS_PROXY=""
}

# enviroment variables settings

export JAVA_HOME="/usr/lib/jvm/default"
export SPARK_HOME="$HOME/Programs/spark-2.4.6-bin-hadoop2.7"
export HADOOP_HOME="$HOME/Programs/hadoop-3.1.3"
export ES_HOME="$HOME/Programs/elasticsearch-7.7.1"
export HBASE_HOME="$HOME/Programs/hbase-2.2.5"
export MAVEN_OPTS="-Xms256m -Xmx768m"
#export HDFS_NAMENODE_USER=root
export NODE_OPTIONS="--max-old-space-size=2000 --max-http-header-size=10000000"
export PATH=$PATH:$HOME/bin:$HOME/Programs/Sencha/Cmd:$HOME/node_modules/.bin:$SPARK_HOME/bin:$HADOOP_HOME/bin:$ES_HOME/bin:$HADOOP_HOME/sbin:$HBASE_HOME/bin
#export HDFS_DATANODE_USER=root

start_zkl() {
    $HOME/Programs/kafka_2.12-2.6.0/bin/zookeeper-server-start.sh -daemon $HOME/Programs/kafka_2.12-2.6.0/config/zookeeper.properties
}
stop_zkl() {
    $HOME/Programs/kafka_2.12-2.6.0/bin/zookeeper-server-stop.sh
}
start_kafka() {
    $HOME/Programs/kafka_2.12-2.6.0/bin/kafka-server-start.sh -daemon $HOME/Programs/kafka_2.12-2.6.0/config/server.properties
}
stop_kafka() {
    $HOME/Programs/kafka_2.12-2.6.0/bin/kafka-server-stop.sh
}

# 使用vim 模式
bindkey -v
# 区别插入模式和普通模式
function zle-keymap-select {
  if [[ "${KEYMAP}" == vicmd ]] || [[ "$1" == 'block' ]]; then 
    echo -ne '\e[1 q' 
  elif [[ "$KEYMAP" == main ]] || [[ "${KEYMAP}" == viins ]] || [[ "${KEYMAP}" == '' ]] || [[ "$1" == 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}

zle -N zle-keymap-select 
echo "${KEYMAP}" "$1"
# 默认插入模式(显示为细条）
echo -ne '\e[5 q'
# 在执行完上一个命令后，打开新会话执行的回调函数,这里让光标默认显示为细条(因为默认是插入模式)
preexec() {
  echo -ne '\e[5 q'
}

# 自动刷新命令
zstyle ':completion:*' rehash true


