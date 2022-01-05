#!/bin/bash

apt-get install -y tmux

echo << TMUX_CONFIG_END >> ~/.tmux.conf
# set prefix key to ctrl+a unTil I have time to adapt
unbind C-b
set -g prefix C-a

# send the prefix to client inside window (ala nested sessions)
bind-key a send-prefix

# toggle last window like screen
bind-key C-a last-window

# confirm before killing a window or the server
bind-key k confirm kill-window
bind-key K confirm kill-server

# toggle statusbar
bind-key b set-option status

# ctrl+left/right cycles thru windows
bind-key -n C-right next
bind-key -n C-left prev

# open a man page in new window
bind / command-prompt "split-window 'exec man %%'"

# quick view of processes
bind '~' split-window "exec htop"

# scrollback buffer n lines
set -g history-limit 5000

# listen for activity on all windows
set -g bell-action any

# on-screen time for display-panes in ms
set -g display-panes-time 2000

# start window indexing at one instead of zero
set -g base-index 1

# enable wm window titles
set -g set-titles on

# wm window title string (uses statusbar variables)
set -g set-titles-string "tmux.#I.#W"

# session initialization
new -s mysession mutt
neww -t 2
neww -d -t 3
neww -d -t 5 mocp
neww -d -t 6 rtorrent
selectw -t 1

# statusbar --------------------------------------------------------------

set -g display-time 2000

# default statusbar colors
set -g status-fg white
set -g status-bg default
set -g status-attr default

# default window title colors
set-window-option -g window-status-fg cyan
set-window-option -g window-status-bg default
set-window-option -g window-status-attr dim

# active window title colors
set-window-option -g window-status-current-fg white
set-window-option -g window-status-current-bg default
set-window-option -g window-status-current-attr bright

# command/message line colors
set -g message-fg white
set -g message-bg black
set -g message-attr bright

# center align the window list
# set -g status-justify centre
# set -g status-justify right

# show some useful stats but only when tmux is started 
# outside of Xorg, otherwise dwm statusbar shows these already
# set -g status-right ""
# set -g status-left ""
# if '[ -z "$DISPLAY" ]' 'set -g status-left "[#[fg=green] #H #[default]]"'
# if '[ -z "$DISPLAY" ]' 'set -g status-right "[ #[fg=magenta]#(cat /proc/loadavg | cut -d \" \" -f 1,2,3)#[default] ][ #[fg=cyan,bright]%a %Y-%m-%d %H:%M #[default]]"'
# if '[ -z "$DISPLAY" ]' 'set -g status-right-length 50'

# show host name and IP address on left side of status bar
# set -g status-left-length 0
# set -g status-left "#[fg=green]: #h : #[fg=brightblue]#(curl icanhazip.com) #[fg=yellow]#(ifconfig en0 | grep 'inet ' | awk '{print \"en0 \" $2}') #(ifconfig en1 | grep 'inet ' | awk '{print \"en1 \" $2}') #[fg=red]#(ifconfig tun0 | grep 'inet ' | awk '{print \"vpn \" $2}') "

# show session name, window & pane number, date and time on right side of
# status bar
# set -g status-right-length 60
# set -g status-right "#[fg=blue]#S #I:#P #[fg=yellow]:: %d %b %Y #[fg=green]:: %l:%M %p :: #(date -u | awk '{print $4}')::"

set-option -g default-shell /usr/bin/zsh

bind C-h select-pane -L
bind C-j select-pane -D
bind C-k select-pane -U
bind C-l select-pane -R

setw -g mode-keys vi

bind '"' split-window -c "#{pane_current_path}"
bind % split-window -h -c "#{pane_current_path}"
bind c new-window -c "#{pane_current_path}"

# refer to: https://github.com/neovim/neovim/issues/2035
set -sg escape-time 0
TMUX_CONFIG_END
