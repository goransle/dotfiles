if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_add_path "/usr/local/bin"
    fish_add_path "/opt/homebrew/bin"
    fish_add_path "/Users/goranslettemark/Library/Python/3.9/bin"
    fish_add_path "/Users/goranslettemark/.ebcli-virtual-env/executables"
    fish_config prompt choose Arrow
    fish_config theme choose "Solarized Light"

    set -U fish_greeting # unset the greeting message
    set -gx EDITOR nvim
    set -gx AWS_SDK_JS_SUPPRESS_MAINTENANCE_MODE_MESSAGE 1
    set -gx FIREFOX_BIN /Applications/Firefox.app/Contents/MacOS/firefox

    alias python=python3
    alias ga="git add"
    alias gs="git status"
    alias gc="git commit"
    alias gco="git checkout"
    alias gp="git push"
    alias gpl="git pull"
    alias gl="git log"
    alias gr="git restore"
    alias grs="git restore --staged"

    alias docker="podman"

    alias zen="/Applications/Zen\ Browser.app/Contents/MacOS/zen"

    zoxide init --cmd cd fish | source

    nvm use -s
end

# pnpm
set -gx PNPM_HOME "/Users/goranslettemark/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Generated for envman. Do not edit.
test -s ~/.config/envman/load.fish; and source ~/.config/envman/load.fish

alias sqlite=/opt/homebrew/opt/sqlite3/bin/sqlite3
