#two param $1:filename better be absolute path $2:linenum
#two C-c make sure incomplete discarded
open_and_jump(){
    local cmd_now
    cmds=(`tmux list-pane -F "#{pane_current_command}"`)
    cmd_now=${cmds[0]}
    if [ "$cmd_now"x = "vim"x ]
    then
        tmux send-keys -t 0 Escape : 'e '$1 Enter : $2 Enter
    elif [ "$cmd_now"x = "bash"x ]
    then
        tmux send-keys -t 0 End C-u vim' '$1' '+$2 Enter
    fi
    tmux select-pane -t 0
}

#binded commands run in sub shell, export dependency
export -f open_and_jump

gp_helper(){
    grep --colour=always -rnHiI --exclude="tags" --exclude="cscope.*" "$@" |
        fzf --ansi -d ':' -n 3 --preview="
            cat -n {1}|sed -n {2},'\$'p
        " --preview-window up:60% \
        --bind "enter:execute:
            open_and_jump \$PWD'/'{1} {2}
        "
}

sym_opener(){
    while [ true ]
    do
        if [ ! -f ./cscope.out ]
        then
            if [ "$PWD"x = "/home/$(whoami)"x ] || [ "$PWD"x = "/"x ]
            then
                echo "cscope.out not found"
                return -1
            else
                cd $(dirname $PWD)
            fi
        else
            cscope -RL1 ".*" |
                fzf -d ' ' -n 4 --preview="
                    cat -n {1}|sed -n {3},'\$'p
                " --preview-window up:60% \
                --bind "enter:execute:
                    open_and_jump \$PWD'/'{1} {3}
                "
        fi
    done
}
