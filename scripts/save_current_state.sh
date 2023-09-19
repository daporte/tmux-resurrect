#!/bin/sh
last_auto_save_option="@continuum-save-last-timestamp"
auto_save_interval_option="@continuum-save-interval"
auto_save_interval_default="1"

source "$CURRENT_DIR/scripts/helpers.sh"

current_timestamp() {
	echo "$(date +%s)"
}
set_last_save_timestamp() {
	set_tmux_option "$last_auto_save_option" "$(current_timestamp)"
}

enough_time_since_last_run_passed() {
	local last_saved_timestamp="$(get_tmux_option "$last_auto_save_option" "0")"
	# local interval_minutes="$(get_interval)"
	# local interval_seconds="$((interval_minutes * 60))"
	local interval_seconds=60
    echo $last_saved_timestamp
	local next_run="$((last_saved_timestamp + $interval_seconds))"
	[ "$(current_timestamp)" -ge "$next_run" ]
}

main() {
    echo "HI"
	if enough_time_since_last_run_passed; then
        source $HOME/projects/tmux_resurrect-worktree/master/scripts/save.sh
        cd $HOME/projects/tmux_resurrect-worktree/master/savefiles
        dump_panes
        dump_windows
        capture_pane_contents
        cp -nrp $SAVES_DIR/last/* $SAVE_DIR
        ln -nsf $SAVE_DIR last
        set_last_save_timestamp
	fi
}
main

