source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
# fzf 设置
export FZF_DEFAULT_OPTS='--height=40% --reverse --inline-info --color=dark'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# 命令行触发弹出搜索框
export FZF_COMPLETION_TRIGGER='\'
export FZF_COMPLETION_OPTS='--border --info=inline'

