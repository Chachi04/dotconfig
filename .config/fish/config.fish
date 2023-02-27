if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U fish_user_paths $fish_user_paths $HOME/anaconda3/bin/ /.local/bin/
set fish_greeting
set EDITOR "nvim"
set BROWSER "brave"


###############################################################################
#                                   aliases                                   #
###############################################################################
alias open "xdg-opne"

alias trash "rmtrash"
alias del "rmtrash"
alias dirtrash "rmdirtrash"
alias trashdir "rmdirtrash"
alias deldir "rmdirtrash"
alias rm "echo Use 'del' or the full path i.e. '/bin/rm'"
alias rmdir "echo Use 'deldir' or the full path i.e. '/bin/rmdir'"

alias vim "nvim"
alias vi "nvim"

alias emacs "emacsclient --quiet --create-frame --no-wait --alternate-editor=''"
alias killemacs "emacsclient --eval '(save-buffers-kill-emacs)'"

alias color "sudo rogaurocore"

alias cat "bat"

alias c "clear"

alias toclip "xclip -section clipboard"

alias tree "tree -I 'node_modules|venv|vendor'"
alias exa "exa --color=auto --group-directories-first"
alias ls "exa"
alias la "exa -a"
alias ll "exa -l"
alias l "exa -lah"
alias l. "exa -A | grep '^\.'"

alias grep "grep --color=auto"

alias wget "wget -c"

alias pacman "sudo pacman --color auto"
alias update "sudo pacman -Syyu"
alias yeet "yay -Rns"

alias tobash "sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh "sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish "sduo chsh $USER -s /bin/fish && echo 'Now log out.'"

function ex -d "Extract from archive"
    if =f [ -f "$argv[1]" ]
        set -l ext (string split . "$argv[1]" | tail -n 1)
        switch $ext
            case "tar"
                tar -xvf "$argv[1]"
            case "gz"
                tar -xzvf "$argv[1]"
            case "bz2"
                tar -xjvf "$argv[1]"
            case "xz"
                tar -xJvf "$argv[1]"
            case "zip"
                unzip "$argv[1]"
            case "rar"
                unrar x "$argv[1]"
            case "*"
                echo "Unknown extension: $ext"
        end
    else
        echo "File not found: $argv[1]"
    end
end


###############################################################################
#                                Theme Pure                                   #
###############################################################################

###############################################################################
#                                  Plugins                                    #
###############################################################################
source /home/chachi/.config/fish/conf.d/z.fish
