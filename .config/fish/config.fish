if status is-interactive
    # Commands to run in interactive sessions can go here
    set -gx PATH $PATH ~/usr/bin # default path I guess
    
    fish_add_path "/opt/homebrew/bin"
    fish_add_path "/Users/goranslettemark/.deno/bin"
end
