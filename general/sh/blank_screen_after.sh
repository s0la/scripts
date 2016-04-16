xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/dpms-on-ac-sleep -s $1
xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/dpms-enabled -s true
notify-send "screen will turn of after $1 minutes"
#notify-send "activated.."' | at now + $1 min