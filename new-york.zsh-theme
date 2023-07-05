function ruby_version_info() {
  echo "%F{green}$(asdf current | awk '{print $2}')%f"
}

setopt prompt_subst

() {

local PR_USER_OP PR_PROMPT

# Check the UID
if [[ $UID -ne 0 ]]; then # normal user
  PR_USER_OP='%F{green}%#%f'
  PR_PROMPT='%f➤ %f'
else # root
  PR_USER_OP='%F{red}%#%f'
  PR_PROMPT='%F{red}➤ %f'
fi

local return_code="%(?..%F{red}%? ↵%f)"

local current_dir="%B%F{blue}%~%f%b"
local git_branch='$(git_prompt_info)'

PROMPT="╭─${current_dir} \$(ruby_version_info) ${git_branch}
╰─$PR_PROMPT "
RPROMPT="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %f"
}
