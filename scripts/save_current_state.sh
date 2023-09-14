source save.sh
cd $HOME/projects/tmux_resurrect-worktree/master/savefiles && dump_panes && dump_windows && ln -nsf $SAVE_DIR last
