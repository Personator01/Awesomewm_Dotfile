[ ! -s ~/.config/mpd/pid ] && mpd && mpc load masic.m3u
mpc crossfade 3
mpc random on
wezterm start ncmpcpp
