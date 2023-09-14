#!/bin/sh

source $HOME/projects/tmux_resurrect-worktree/master/scripts/save.sh
cd $HOME/projects/tmux_resurrect-worktree/master/savefiles
dump_panes
dump_windows
cp -nr $SAVES_DIR/last/* $SAVE_DIR
ln -nsf $SAVE_DIR last

