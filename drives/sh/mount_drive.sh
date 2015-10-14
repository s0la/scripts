drive="/dev/sda$1"

if [ $1 == 5 ]; then
	drive_dir="/media/sola/61_GB"
else
	drive_dir="/media/sola/9.8_GB"
fi

if [ -z $(mount | grep "$drive_dir") ]; then
	gksudo mount /dev/sda$drive_num $drive_dir
fi
Documents/scripts/files/sh/thunar_opacity.sh $drive_dir