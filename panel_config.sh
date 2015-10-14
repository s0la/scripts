#top panel
xfconf-query -c xfce4-panel -p /panels/panel-0/size -n -t int -s 22
xfconf-query -c xfce4-panel -p /panels/panel-0/background-style -n -t int -s 2
xfconf-query -c xfce4-panel -p /panels/panel-0/background-image -n -t string -s '/usr/share/themes/sola/gtk-2.0/apps/Panel/top_panel_bg.png'

#main dock panel
xfconf-query -c xfce4-panel -p /panels/panel-1/size -n -t int -s 50
xfconf-query -c xfce4-panel -p /panels/panel-1/background-style -n -t int -s 2
xfconf-query -c xfce4-panel -p /panels/panel-1/position -n -t string -s 'p=10;x=952;y=1055'
xfconf-query -c xfce4-panel -p /panels/panel-1/background-image -n -t string -s '/usr/share/themes/sola/gtk-2.0/apps/Panel/panel_bg.png'
xfconf-query -c xfce4-panel -p /panels/panel-1/position-locked -n -t bool -s true
#xfconf-query -c xfce4-panel -p /panels/panel-1/disable-struts -n -t bool -s true
xfconf-query -c xfce4-panel -p /panels/panel-1/length-adjust -n -t bool -s true
xfconf-query -c xfce4-panel -p /panels/panel-1/autohide-behavior -n -t int -s 0
xfconf-query -c xfce4-panel -p /panels/panel-1/enter-opacity -n -t int -s 100
xfconf-query -c xfce4-panel -p /panels/panel-1/leave-opacity -n -t int -s 100
xfconf-query -c xfce4-panel -p /panels/panel-1/length -n -t int -s 1

#workspace_switcher panel
xfconf-query -c xfce4-panel -p /panels/panel-2/nrows -n -t int -s 2
xfconf-query -c xfce4-panel -p /panels/panel-2/size -n -t int -s 50
xfconf-query -c xfce4-panel -p /panels/panel-2/background-style -n -t int -s 2
xfconf-query -c xfce4-panel -p /panels/panel-2/position -n -t string -s 'p=5;x=960;y=1030'
xfconf-query -c xfce4-panel -p /panels/panel-2/background-image -n -t string -s '/usr/share/themes/sola/gtk-2.0/apps/Panel/ws_panel_bg.png'
xfconf-query -c xfce4-panel -p /panels/panel-2/position-locked -n -t bool -s true
xfconf-query -c xfce4-panel -p /panels/panel-2/length-adjust -n -t bool -s true
xfconf-query -c xfce4-panel -p /panels/panel-2/autohide-behavior -n -t int -s 2
xfconf-query -c xfce4-panel -p /panels/panel-2/enter-opacity -n -t int -s 100
xfconf-query -c xfce4-panel -p /panels/panel-2/leave-opacity -n -t int -s 100
xfconf-query -c xfce4-panel -p /panels/panel-2/length -n -t int -s 100

#parole panel
xfconf-query -c xfce4-panel -p /panels/panel-3/size -n -t int -s 50
xfconf-query -c xfce4-panel -p /panels/panel-3/background-style -n -t int -s 2
xfconf-query -c xfce4-panel -p /panels/panel-3/position -n -t string -s 'p=10;x=950;y=1055'
xfconf-query -c xfce4-panel -p /panels/panel-3/background-image -n -t string -s '/usr/share/themes/sola/gtk-2.0/apps/Panel/panel_bg.png'
xfconf-query -c xfce4-panel -p /panels/panel-3/position-locked -n -t bool -s true
#xfconf-query -c xfce4-panel -p /panels/panel-3/disable-struts -n -t bool -s true
xfconf-query -c xfce4-panel -p /panels/panel-3/length-adjust -n -t bool -s true
xfconf-query -c xfce4-panel -p /panels/panel-3/autohide-behavior -n -t int -s 2
xfconf-query -c xfce4-panel -p /panels/panel-3/enter-opacity -n -t int -s 100
xfconf-query -c xfce4-panel -p /panels/panel-3/leave-opacity -n -t int -s 100
xfconf-query -c xfce4-panel -p /panels/panel-3/length -n -t int -s 1

#gmusicbrowser panel
xfconf-query -c xfce4-panel -p /panels/panel-4/size -n -t int -s 50
xfconf-query -c xfce4-panel -p /panels/panel-4/background-style -n -t int -s 2
xfconf-query -c xfce4-panel -p /panels/panel-4/position -n -t string -s 'p=12;x=1110;y=1055'
xfconf-query -c xfce4-panel -p /panels/panel-4/background-image -n -t string -s '/usr/share/themes/sola/gtk-2.0/apps/Panel/panel_bg.png'
xfconf-query -c xfce4-panel -p /panels/panel-4/position-locked -n -t bool -s true
#xfconf-query -c xfce4-panel -p /panels/panel-4/disable-struts -n -t bool -s true
xfconf-query -c xfce4-panel -p /panels/panel-4/length-adjust -n -t bool -s true
xfconf-query -c xfce4-panel -p /panels/panel-4/autohide-behavior -n -t int -s 2
xfconf-query -c xfce4-panel -p /panels/panel-4/enter-opacity -n -t int -s 100
xfconf-query -c xfce4-panel -p /panels/panel-4/leave-opacity -n -t int -s 100
xfconf-query -c xfce4-panel -p /panels/panel-4/length -n -t int -s 1

#worspace manager panel
xfconf-query -c xfce4-panel -p /panels/panel-5/size -n -t int -s 50
xfconf-query -c xfce4-panel -p /panels/panel-5/background-style -n -t int -s 2
xfconf-query -c xfce4-panel -p /panels/panel-5/position -n -t string -s 'p=12;x=1010;y=1055'
xfconf-query -c xfce4-panel -p /panels/panel-5/background-image -n -t string -s '/usr/share/themes/sola/gtk-2.0/apps/Panel/panel_bg.png'
xfconf-query -c xfce4-panel -p /panels/panel-5/position-locked -n -t bool -s true
#xfconf-query -c xfce4-panel -p /panels/panel-5/disable-struts -n -t bool -s true
xfconf-query -c xfce4-panel -p /panels/panel-5/length-adjust -n -t bool -s true
xfconf-query -c xfce4-panel -p /panels/panel-5/autohide-behavior -n -t int -s 2
xfconf-query -c xfce4-panel -p /panels/panel-5/enter-opacity -n -t int -s 100
xfconf-query -c xfce4-panel -p /panels/panel-5/leave-opacity -n -t int -s 100
xfconf-query -c xfce4-panel -p /panels/panel-5/length -n -t int -s 1

#terminal panel
xfconf-query -c xfce4-panel -p /panels/panel-6/size -n -t int -s 50
xfconf-query -c xfce4-panel -p /panels/panel-6/background-style -n -t int -s 2
xfconf-query -c xfce4-panel -p /panels/panel-6/position -n -t string -s 'p=12;x=1085;y=1055'
xfconf-query -c xfce4-panel -p /panels/panel-6/background-image -n -t string -s '/usr/share/themes/sola/gtk-2.0/apps/Panel/panel_bg.png'
xfconf-query -c xfce4-panel -p /panels/panel-6/position-locked -n -t bool -s true
#xfconf-query -c xfce4-panel -p /panels/panel-6/disable-struts -n -t bool -s true
xfconf-query -c xfce4-panel -p /panels/panel-6/length-adjust -n -t bool -s true
xfconf-query -c xfce4-panel -p /panels/panel-6/autohide-behavior -n -t int -s 2
xfconf-query -c xfce4-panel -p /panels/panel-6/enter-opacity -n -t int -s 100
xfconf-query -c xfce4-panel -p /panels/panel-6/leave-opacity -n -t int -s 100
xfconf-query -c xfce4-panel -p /panels/panel-6/length -n -t int -s 1

#files panel
xfconf-query -c xfce4-panel -p /panels/panel-7/size -n -t int -s 50
xfconf-query -c xfce4-panel -p /panels/panel-7/background-style -n -t int -s 2
xfconf-query -c xfce4-panel -p /panels/panel-7/position -n -t string -s 'p=12;x=1085;y=1055'
xfconf-query -c xfce4-panel -p /panels/panel-7/background-image -n -t string -s '/usr/share/themes/sola/gtk-2.0/apps/Panel/panel_bg.png'
xfconf-query -c xfce4-panel -p /panels/panel-7/position-locked -n -t bool -s true
#xfconf-query -c xfce4-panel -p /panels/panel-7/disable-struts -n -t bool -s true
xfconf-query -c xfce4-panel -p /panels/panel-7/length-adjust -n -t bool -s true
xfconf-query -c xfce4-panel -p /panels/panel-7/autohide-behavior -n -t int -s 2
xfconf-query -c xfce4-panel -p /panels/panel-7/enter-opacity -n -t int -s 100
xfconf-query -c xfce4-panel -p /panels/panel-7/leave-opacity -n -t int -s 100
xfconf-query -c xfce4-panel -p /panels/panel-7/length -n -t int -s 1

#drives panel
xfconf-query -c xfce4-panel -p /panels/panel-8/mode -n -t int -s 1
xfconf-query -c xfce4-panel -p /panels/panel-8/size -n -t int -s 80
xfconf-query -c xfce4-panel -p /panels/panel-8/background-style -n -t int -s 2
xfconf-query -c xfce4-panel -p /panels/panel-8/position -n -t string -s 'p=7;x=25;y=535'
xfconf-query -c xfce4-panel -p /panels/panel-8/background-image -n -t string -s '/usr/share/themes/sola/gtk-2.0/apps/Panel/vert_panel_bg.png'
xfconf-query -c xfce4-panel -p /panels/panel-8/position-locked -n -t bool -s true
xfconf-query -c xfce4-panel -p /panels/panel-8/length-adjust -n -t bool -s true
xfconf-query -c xfce4-panel -p /panels/panel-8/autohide-behavior -n -t int -s 2
xfconf-query -c xfce4-panel -p /panels/panel-8/enter-opacity -n -t int -s 100
xfconf-query -c xfce4-panel -p /panels/panel-8/leave-opacity -n -t int -s 100
xfconf-query -c xfce4-panel -p /panels/panel-8/length -n -t int -s 1

#wallpaper_changer panel
xfconf-query -c xfce4-panel -p /panels/panel-9/size -n -t int -s 50
xfconf-query -c xfce4-panel -p /panels/panel-9/background-style -n -t int -s 2
xfconf-query -c xfce4-panel -p /panels/panel-9/position -n -t string -s 'p=12;x=1135;y=1055'
xfconf-query -c xfce4-panel -p /panels/panel-9/background-image -n -t string -s '/usr/share/themes/sola/gtk-2.0/apps/Panel/panel_bg.png'
xfconf-query -c xfce4-panel -p /panels/panel-9/position-locked -n -t bool -s true
#xfconf-query -c xfce4-panel -p /panels/panel-9/disable-struts -n -t bool -s true
xfconf-query -c xfce4-panel -p /panels/panel-9/length-adjust -n -t bool -s true
xfconf-query -c xfce4-panel -p /panels/panel-9/autohide-behavior -n -t int -s 2
xfconf-query -c xfce4-panel -p /panels/panel-9/enter-opacity -n -t int -s 100
xfconf-query -c xfce4-panel -p /panels/panel-9/leave-opacity -n -t int -s 100
xfconf-query -c xfce4-panel -p /panels/panel-9/length -n -t int -s 1

#now_playing parole
xfconf-query -c xfce4-panel -p /panels/panel-10/size -n -t int -s 80
xfconf-query -c xfce4-panel -p /panels/panel-10/background-style -n -t int -s 2
xfconf-query -c xfce4-panel -p /panels/panel-10/position -n -t string -s 'p=0;x=1700;y=950'
xfconf-query -c xfce4-panel -p /panels/panel-10/background-image -n -t string -s '/usr/share/themes/sola/gtk-2.0/apps/Panel/ws_panel_bg.png'
xfconf-query -c xfce4-panel -p /panels/panel-10/position-locked -n -t bool -s true
xfconf-query -c xfce4-panel -p /panels/panel-10/length-adjust -n -t bool -s true
xfconf-query -c xfce4-panel -p /panels/panel-10/autohide-behavior -n -t int -s 2
xfconf-query -c xfce4-panel -p /panels/panel-10/enter-opacity -n -t int -s 100
xfconf-query -c xfce4-panel -p /panels/panel-10/leave-opacity -n -t int -s 100
xfconf-query -c xfce4-panel -p /panels/panel-10/length -n -t int -s 1

#now_playing gmusicbrowser
xfconf-query -c xfce4-panel -p /panels/panel-11/size -n -t int -s 80
xfconf-query -c xfce4-panel -p /panels/panel-11/background-style -n -t int -s 2
xfconf-query -c xfce4-panel -p /panels/panel-11/position -n -t string -s 'p=0;x=1700;y=950'
xfconf-query -c xfce4-panel -p /panels/panel-11/background-image -n -t string -s '/usr/share/themes/sola/gtk-2.0/apps/Panel/ws_panel_bg.png'
xfconf-query -c xfce4-panel -p /panels/panel-11/position-locked -n -t bool -s true
xfconf-query -c xfce4-panel -p /panels/panel-11/length-adjust -n -t bool -s true
xfconf-query -c xfce4-panel -p /panels/panel-11/autohide-behavior -n -t int -s 2
xfconf-query -c xfce4-panel -p /panels/panel-11/enter-opacity -n -t int -s 100
xfconf-query -c xfce4-panel -p /panels/panel-11/leave-opacity -n -t int -s 100
xfconf-query -c xfce4-panel -p /panels/panel-11/length -n -t int -s 1

#restart panels
xfce4-panel -r