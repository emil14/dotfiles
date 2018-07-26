set $mod Mod4

font pango: Terminus 16px

floating_modifier $mod

bindsym $mod+Return exec i3-sensible-terminal
bindsym $mod+Shift+q kill
bindsym $mod+d exec rofi -show run

bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

bindsym $mod+Shift+h split h
bindsym $mod+Shift+v split v
bindsym $mod+f fullscreen toggle

bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

bindsym $mod+Shift+space floating toggle
bindsym $mod+space focus mode_toggle
bindsym $mod+a focus parent

bindsym $mod+1 workspace 1
bindsym $mod+2 workspace 2
bindsym $mod+3 workspace 3
bindsym $mod+4 workspace 4
bindsym $mod+5 workspace 5
bindsym $mod+6 workspace 6
bindsym $mod+7 workspace 7
bindsym $mod+8 workspace 8
bindsym $mod+9 workspace 9
bindsym $mod+0 workspace 10

bindsym $mod+Shift+1 move container to workspace 1
bindsym $mod+Shift+2 move container to workspace 2
bindsym $mod+Shift+3 move container to workspace 3
bindsym $mod+Shift+4 move container to workspace 4
bindsym $mod+Shift+5 move container to workspace 5
bindsym $mod+Shift+6 move container to workspace 6
bindsym $mod+Shift+7 move container to workspace 7
bindsym $mod+Shift+8 move container to workspace 8
bindsym $mod+Shift+9 move container to workspace 9
bindsym $mod+Shift+0 move container to workspace 10

bindsym $mod+Shift+c reload
bindsym $mod+Shift+r restart
bindsym $mod+Shift+e exec "i3-msg exit"

bindsym $mod+r mode "resize"

mode "resize" {
  bindsym j resize shrink width 10 px or 10 ppt
  bindsym k resize grow height 10 px or 10 ppt
  bindsym l resize shrink height 10 px or 10 ppt
  bindsym semicolon resize grow width 10 px or 10 ppt
  bindsym Left resize shrink width 10 px or 10 ppt
  bindsym Down resize grow height 10 px or 10 ppt
  bindsym Up resize shrink height 10 px or 10 ppt
  bindsym Right resize grow width 10 px or 10 ppt
  bindsym Return mode "default"
  bindsym Escape mode "default"
}

exec_always --no-startup-id $HOME/.config/polybar/launch.sh
exec --no-startup-id compton

# Colors
# class                 border  bground text    indicator child_border
client.focused          #61AFEF #3B84C0 #FFFFFF #3B84C0   #61AFEF
client.focused_inactive #ABB2BF #282C34 #ABB2BF #484E50   #5F676A
client.unfocused        #828997 #282C34 #828997 #292D2E   #222222
client.urgent           #E06C75 #BE5046 #FFFFFF #900000   #900000
client.placeholder      #000000 #5C6370 #ABB2BF #000000   #0C0C0C
client.background       #5C6370

# Switch language
exec "setxkbmap -layout us,ru -option grp:caps_toggle1"
exec --no-startup-id "nm-applet --sm-disable"

# Lock sreen
bindsym $mod+Escape exec "lock --pixelate"

# Borders
for_window [class="^.*"] border pixel 2
hide_edge_borders smart
smart_borders on

# Move workspases between monitors
bindsym $mod+Shift+greater move workspace to output right
bindsym $mod+Shift+less move workspace to output left

# Make a screenshot
bindsym --release $mod+z exec scrot -s -e 'mv $f ~/Pictures/screenshots/'

# Move throught worpspaces with mouse
bindsym --whole-window $mod+button4 workspace prev_on_output
bindsym --whole-window $mod+button5 workspace next_on_output

# Gaps
gaps inner 10
gaps outer 20

focus_on_window_activation smart

# Wallpapers
exec_always --no-startup-id $HOME/bin/wallpapers.sh

