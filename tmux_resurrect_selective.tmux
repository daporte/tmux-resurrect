#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/scripts/helpers.sh"

save_command_interpolation="#($HOME/.tmux/plugins/tmux-resurrect-selective/scripts/save_current_state.sh)"

add_resurrect_save_interpolation() {
	local status_right_value="$(get_tmux_option "status-right" "")"
	# check interpolation not already added
	if ! [[ "$status_right_value" == *"$save_command_interpolation"* ]]; then
		local new_value="${save_command_interpolation}${status_right_value}"
		set_tmux_option "status-right" "$new_value"
	fi
    # "$(get_tmux_option "status-right" "")"
}

main() {
    echo "ABC"
	add_resurrect_save_interpolation
    # "$HOME/.tmux/plugins/tmux-resurrect-selective/scripts/save_current_state.sh"
}
main
