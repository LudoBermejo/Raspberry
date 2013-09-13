# like in http://blog.scphillips.com/2013/01/using-a-raspberry-pi-with-android-phones-for-media-streaming/#network


In  /etc/network/interface

auto lo
 
iface lo inet loopback
iface eth0 inet dhcp
 
allow-hotplug wlan0
iface wlan0 inet manual
wpa-roam /etc/wpa_supplicant/wpa_supplicant.conf
iface default inet dhcp