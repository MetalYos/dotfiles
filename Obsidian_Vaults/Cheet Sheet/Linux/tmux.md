# tmux - _terminal multiplexer_
tmux acts as a window manager within your terminal and allows you to create multiple windows and panes within a single terminal window.

## Installation
```bash
sudo pacman -S tmux
```

## Sessions
### Start a new session
- Start a new nameless (given an index) session, write
```bash
tmux
```
- To start a named session, write:
```bash
tmux new -s <name>
```

### Session handling
- To detach current session (keep session in background for later reuse), write:
```
Ctrl + b -> d
```
- To have tmux give you a choice on what session to detach, write:
```
Ctrl + b -> D
```
- To get a list of tmux sessions currenly running in the background, write:
```bash
tmux ls
```
- To attach (connect) to a background session, write:
```bash
tmux attach -t <name/index>
```
- To rename a background session, write:
```bash
tmux rename-session -t <old> <new>
```

## Panes
### Splitting Panes
- Spliiting panes into left and right panes: 
```
Ctrl + b -> %
```
- Splitting panes into top and bottom panes:
```
Ctrl + b -> "
```

### Navigating Panes
```
Ctrl + b -> <arrow key>
```

For example, to navigate to the left pane enter the following:
```
Ctrl + b -> left
```

### Make a Pane go fullscreen and back
```
Ctrl + b -> z
```

### Closing Panes
To close a pane, either type `exit` or hit `Ctrl + d`

### Resizing Panes
To resize tmux panes, you’ll first want to hit your prefix `ctrl + b` by default and then the colon key `:`. What this does is brings up a prompt at the bottom of your screen.
Now you’ll want to type in `resize-pane` in the prompt, followed by a hyphen `-` and either `D, U, L, R`. Which you can probably guess stands for down, up, left and right, the direction in which you want your pane to be resized. When using the `resize-pane` command, the resize will be applied to the last pane that had focus.

For example:
```
:resize-pane -D (Resizes the current pane down)
:resize-pane -U (Resizes the current pane upward)
:resize-pane -L (Resizes the current pane left)
:resize-pane -R (Resizes the current pane right)
:resize-pane -D 10 (Resizes the current pane down by 10 cells)
:resize-pane -U 10 (Resizes the current pane upward by 10 cells)
:resize-pane -L 10 (Resizes the current pane left by 10 cells)
:resize-pane -R 10 (Resizes the current pane right by 10 cells)
```

## Windows
Windows in tmux can be compared to creating new virtual desktops.

### Creating Windows
```
Ctrl + b -> c
```
The new window will be represented in the status bar

### Navigating Windows
- To go to the previous pane, write:
```
Ctrl + b -> p
```
- To go to the next pane, write:
```
Ctrl + b -> n
```
- To go to a specific pane, write:
```
Ctrl + b -> <number>
```
Where number is the number in front of the windows's name in the status bar

### Rename current window
```
Ctrl + b -> ,
```

### Misc
- To see all available commands, write:
```
Ctrl + b -> ?
```