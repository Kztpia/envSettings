basedir="`cd $(dirname "$0"); pwd -P`"
echo $basedir
tmux split-window
tmux select-pane -t 0
tmux kill-pane -a -t 0
tmux split-window
tmux split-window
tmux split-window
tmux select-layout "689d,237x62,0,0{170x62,0,0[170x49,0,0,13,170x12,0,50,23],66x62,171,0[66x31,171,0,22,66x30,171,32,24]}"
tmux send-key -t 2 'source '$basedir'/helpers.sh' Enter
tmux send-key -t 3 'source '$basedir'/helpers.sh' Enter sym_opener Enter
tmux bind-key '`' select-pane -t 1
tmux bind-key e select-pane -t 0
tmux bind-key '/' select-pane -t 2
tmux bind-key '\' select-pane -t 3
tmux select-pane -t 0
basedir=