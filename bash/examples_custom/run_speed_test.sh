#! /bin/bash
# __author__ = "Hanmei Tang"
# __version__ = "1.0"
# __maintainer__ = "Hanmei Tang"
# __email__ = "hmtang003@gmail.com"
# __date__ = "May 22, 2020"

# Get Wifi SSID
ssid=$(/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | grep " SSID" | sed 's/           SSID: //')
#echo $ssid

# Run speed test
download_speed=$(/usr/local/bin/speedtest | grep Download | awk '{print $3}')
#echo download_speed

# Get current time
time_now=$(date | awk '{print $4}')
# echo time_now

echo "$time_now, $ssid, $download_speed" >> $HOME/speed_test.csv
