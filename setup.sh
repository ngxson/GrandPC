#!/bin/sh
dconf write /org/gnome/desktop/interface/cursor-size 32

sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' ~/.config/google-chrome/Default/Preferences
sed -i 's/"exit_type":"Crashed"/"exit_type":"None"/' ~/.config/google-chrome/Default/Preferences
sed -i -e 's/("exit_type":\s*)"Crashed"/"exit_type":"None"/g' ~/.config/google-chrome/Default/Preferences
sed -i -e 's/("exited_cleanly":\s*)false/"exited_cleanly":true/g' ~/.config/google-chrome/Default/Preferences

(google-chrome --disable-infobars --disable-session-crashed-bubble --kiosk file:///home/$USER/grandPC/runOnBoot.html)&
(while true; do
	if [ -f /home/$USER/Downloads/turnoff.txt ]; then
		rm /home/$USER/Downloads/turnoff.txt
		echo $(cat /home/$USER/pwd) | sudo -S sync
		echo $(cat /home/$USER/pwd) | sudo -S poweroff
	fi
	sleep 5;
done;)&

