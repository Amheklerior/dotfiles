#!/bin/zsh

local LOG_PREFIX="[setting dotfiles repo dev env]:"

local PRE_COMMIT_HOOK="$DOTFILES_REPO/.git/hooks/pre-commit"

if [ ! -e $PRE_COMMIT_HOOK ]; then
  echo "$LOG_PREFIX setting up pre-commit hooks..."

  echo "\
    #!/bin/sh\
    \\n\\n\
    # run gitleaks on every commit to make sure I don't accidentally push any secret to the repo\\n\
    gitleaks git --pre-commit --staged\
  " > $PRE_COMMIT_HOOK

  chmod +x $PRE_COMMIT_HOOK
else
  echo "$LOG_PREFIX pre-commit hook already setup!"
fi

