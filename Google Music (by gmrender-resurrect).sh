# like in http://blog.scphillips.com/2013/07/playing-music-on-a-raspberry-pi-using-upnp-and-dlna-revisited/
# Firmware 3.6.11+

cd
git clone https://github.com/hzeller/gmrender-resurrect.git
cd gmrender-resurrect

sudo apt-get install autoconf automake libtool

sudo apt-get install libupnp-dev libgstreamer0.10-dev \
                gstreamer0.10-plugins-base gstreamer0.10-plugins-good \
                gstreamer0.10-plugins-bad gstreamer0.10-plugins-ugly \
                gstreamer0.10-ffmpeg \
                gstreamer0.10-pulseaudio gstreamer0.10-alsa

# And wait to paroxism

./autogen.sh
./configure
make
sudo make install
sudo cp scripts/init.d/gmediarenderer /etc/init.d
sudo update-rc.d gmediarenderer defaults

sudo shutdown -r now

#When reboot, test run:

ps aux|grep gmedia

# Volume

alsamixer

# and save

sudo alsactl store 0

# Check alsa works

sudo apt-get install mpg123
cd /tmp
wget http://www.richardfarrar.com/audio/right.mp3
wget http://www.richardfarrar.com/audio/left.mp3
mpg123 right.mp3
mpg123 left.mp3