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
- `z`: toggle fullscreen

### Session
- `)`: next session
- `(`: previous session
- `s`: list sessions
- `$`: rename session
- `:new`: new session

### Copy and Paste
- `[`: enter copy mode
- `<space>`: start copy, on copy mode
- `<enter>`: copy text and quit, on copy mode
- `q`: quit copy mode
- `]`: paste text

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

## Share Windows SSH

Tmux can do pair programming too.

SSH into the computer and open a tmux session.

### Host (SSH server)
- `tmux new-session -s [session name]`
### Client
- `ssh [user]@[host]`
- `tmux attach -t [session name]`

The host computer can attach to that session and they can see the same thin at thesame time.

They can even type in different windows at the same time, but not at the same window.

### First Computer
- `tmux new-session -s comp1`: view your window
- `tmux new-session -t comp1 -s comp2`: view other person's window
### Second Computer
- `tmux attach -t comp2`: view your window
- `tmux attach -t comp1`: view other person's window
