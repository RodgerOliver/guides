# Tmux

Tmux is a terminal multiplier.

Run `tmux` to create a virtual terminal.

When on tmux terminal press `ctrl-b` (^B) to make tmux listen for a command.

The current tmux window will be with a start (*).

## Inside Tmux
* `^B c` - create a new tmux window
* `^B ,` - rename the current window
* `^B p` - go to previous window
* `^B n` - go to next window
* `^B w` - list the windows
* `^B %` - split vertically
* `^B d` - detach from the session
* `^B &` - kill current session
* `^B ?` - list all keybindings

## Outside Tmux
* `tmux list-sessions`
  * `tmux ls`
* `tmux new -s [session name]`
* `tmux attach -t [session name]`
* `tmux kill-session -t [session name]`
