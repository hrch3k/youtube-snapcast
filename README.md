# youtube-snapcast
This is a shell script to start youtube video in VLC player and stream it to snapcast server for multiroom listening

Usage:
You should have Snapcast installed on your system. (Tested only on RPi 4)


Load the pipe-sink module in PulseAudio with commands below:

`pacmd load-module module-pipe-sink file=/tmp/snapfifo sink_name=Snapcast format=s16le rate=48000`

`pacmd update-sink-proplist Snapcast device.description=Snapcast`




Run this in command line: 

`./youtube_multiroom.sh "URL of youtube video"`
