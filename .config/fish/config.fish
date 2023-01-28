if status is-interactive
    # Commands to run in interactive sessions can go here
    set -gx PATH $PATH ~/usr/bin # default path I guess
    fish_add_path "/opt/homebrew/bin"
    fish_config prompt choose Arrow
    fish_config theme choose "Solarized Light"

    set -U fish_greeting # unset the greeting message
    set -gx EDITOR nvim

    nvm use -s # adds the node bins to path using the closest .nvmrc
end
