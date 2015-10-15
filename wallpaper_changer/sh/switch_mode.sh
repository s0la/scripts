state=$(sed -n '2p' Documents/.hidden_files/counts.txt)
[ "$state" == 'true' ] && state_to_be_set='false' || state_to_be_set='true'

sed -i "2s/.*/$state_to_be_set/" Documents/.hidden_files/counts.txt

notify-send "wallpaper switcher for all workspaces is $state"
xfconf-query -c xfce4-desktop -p /backdrop/single-workspace-mode -s $state