
# 打开opencode实验性功能
# ============================================
# OpenCode 用户变量配置
# ============================================

# 打开 OpenCode 实验性工作区功能
# 启用后可使用多工作区、工作区切换等实验性特性
export OPENCODE_EXPERIMENTAL_WORKSPACES=true

#compdef opencode
###-begin-opencode-completions-###
#
# yargs command completion script
#
# Installation: opencode completion >> ~/.zshrc
#    or opencode completion >> ~/.zprofile on OSX.
#
_opencode_yargs_completions()
{
  local reply
  local si=$IFS
  IFS=$'
' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" opencode --get-yargs-completions "${words[@]}"))
  IFS=$si
  if [[ ${#reply} -gt 0 ]]; then
    _describe 'values' reply
  else
    _default
  fi
}
if [[ "'${zsh_eval_context[-1]}" == "loadautofunc" ]]; then
  _opencode_yargs_completions "$@"
else
  compdef _opencode_yargs_completions opencode
fi
###-end-opencode-completions-###
# 启用实验性 LSP 工具（go to definition, find references 等代码智能）
export OPENCODE_EXPERIMENTAL_LSP_TOOL=true

# 启用 Plan 模式（先规划后执行的工作流）
#export OPENCODE_EXPERIMENTAL_PLAN_MODE=true

# 启用实验性 Markdown 功能
export OPENCODE_EXPERIMENTAL_MARKDOWN=true
