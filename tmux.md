# Tmux

Tmux is a terminal multiplier.

Run `tmux` to create a virtual terminal.

Tmux waits for a prefix to execute a command and all commands must start with the prefix. The default prefix is `ctrl + B`.

The current tmux window will be with a start (*).

## Inside Tmux
### Windows (Tabs)
- `c`: new window
- `,`: rename window
- `p`: previous window
- `n`: next window
- `w`: list windows
- `&`: kill window
- `[numbers]`: go to specific window
- `f`: find window

### Panes (Splits)
- `%`: split horizontally
- `"`: split vertically
- `;`: go to last pane
- `q`: show pane numbers
- `x`: kill pane
- `<space>`: toggle layouts
- `o`: cycle through panes
- `C-O`: cycle panes
- `{`: move pane to previous position
- `}`: move pane to next position

### Session
- `)`: next session
- `(`: previous session
- `s`: list sessions
- `$`: rename session
- `:new`: new session

### Misc
- `d`: detach from the session
- `?`: list all keybindings
- `t`: big clock

## Outside Tmux
- `tmux list-sessions`
  - `tmux ls`
- `tmux new -s [session name]`
- `tmux attach -t [session name]`
  - `tmux a`
- `tmux kill-session -t [session name]`
