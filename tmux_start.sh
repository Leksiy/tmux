#!/bin/bash

SESSION="main"

if tmux has-session -t $SESSION 2>/dev/null; then
    echo "Session $SESSION already exists. Attaching to it."
    tmux attach-session -t $SESSION
else
    echo "New session start."
    tmux new-session -d -s $SESSION
    tmux split-window -h
    tmux split-window -v
    tmux send-keys -t 1 'speedometer -s -k 256 -t enp0s3 -r enp0s3' C-m
    tmux send-keys -t 2 'glances' C-m
    tmux select-pane -t 0
    tmux attach-session -t $SESSION
fi
