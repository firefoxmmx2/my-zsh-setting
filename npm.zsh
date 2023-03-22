# npm local user global install

PATH=$PATH:$HOME/.local/bin
export npm_config_prefix=$HOME/.local
export NODE_OPTIONS="--max-old-space-size=2000 --max-http-header-size=10000000"
