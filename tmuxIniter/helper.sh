file_opener(){
    local cmd_now
    fzf --reverse \
    --bind "enter:execute@
        cmds=(\`tmux list-pane -F \"#{pane_current_command}\"\`)
        cmd_now=\${cmds[0]}
        if [ \"\$cmd_now\"x = \"vim\"x ]
        then
            tmux send-keys -t 0 Escape : 'e '\$PWD'/'{} Enter 
        elif [ \"\$cmd_now\"x = \"bash\"x ]
        then
            tmux send-keys -t 0 vim' '\$PWD'/'{} Enter
        else
        fi
        tmux select-pane -t 0
    @"
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
                    cmds=(\`tmux list-pane -F \"#{pane_current_command}\"\`)
                    cmd_now=\${cmds[0]}
                    if [ \"\$cmd_now\"x = \"vim\"x ]
                    then
                        tmux send-keys -t 0 Escape : 'e '\$PWD'/'{1} Enter : {3} Enter
                    elif [ \"\$cmd_now\"x = \"bash\"x ]
                    then
                        tmux send-keys -t 0 vim' '\$PWD'/'{1}' '+{3} < /dev/tty Enter
                    fi
                "
            return 0
        fi
    done
}

ref_opener(){
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
            cscope -RL0 ".*" |
                fzf -d ' ' -n 4 --preview="
                    cat -n {1}|sed -n {3},'\$'p
                " --preview-window up:60% \
                --bind "enter:execute:
                    cmds=(\`tmux list-pane -F \"#{pane_current_command}\"\`)
                    cmd_now=\${cmds[0]}
                    if [ \"\$cmd_now\"x = \"vim\"x ]
                    then
                        tmux send-keys -t 0 Escape : 'e '\$PWD'/'{1} Enter : {3} Enter
                    elif [ \"\$cmd_now\"x = \"bash\"x ]
                    then
                        tmux send-keys -t 0 vim' '\$PWD'/'{1}' '+{3} < /dev/tty Enter
                    fi
                "
            return 0
        fi
    done
}
