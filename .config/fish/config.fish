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

    alias python=python3

    nvm use -s # adds the node bins to path using the closest .nvmrc
end
