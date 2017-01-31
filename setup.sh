echo '(google-chrome --kiosk file:///home/$USER/grandPC/runOnBoot.html)&' >> ~/.profile
echo '(while true; do' >> ~/.profile
echo '	if [ -f /home/$USER/Downloads/turnoff.txt ]; then' >> ~/.profile
echo '		rm /home/$USER/Downloads/turnoff.txt' >> ~/.profile
echo '		echo \"$1\" | sudo -S sync' >> ~/.profile
echo '		echo \"$1\" | sudo -S poweroff' >> ~/.profile
echo '	fi' >> ~/.profile
echo 'done; sleep 5)&' >> ~/.profile
