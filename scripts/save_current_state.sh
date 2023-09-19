#!/bin/sh
last_auto_save_option="@continuum-save-last-timestamp"

enough_time_since_last_run_passed() {
	local last_saved_timestamp="$(get_tmux_option "$last_auto_save_option" "0")"
	# local interval_minutes="$(get_interval)"
	# local interval_seconds="$((interval_minutes * 60))"
	local interval_seconds=60
	local next_run="$((last_saved_timestamp + $interval_seconds))"
	[ "$(current_timestamp)" -ge "$next_run" ]
}

main() {
	if enough_time_since_last_run_passed; then
        source $HOME/projects/tmux_resurrect-worktree/master/scripts/save.sh
        cd $HOME/projects/tmux_resurrect-worktree/master/savefiles
        dump_panes
        dump_windows
        capture_pane_contents
        cp -nrp $SAVES_DIR/last/* $SAVE_DIR
        ln -nsf $SAVE_DIR last
	fi
}
main

