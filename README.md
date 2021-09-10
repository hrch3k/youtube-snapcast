# youtube-snapcast
This is a shell script to start youtube video in VLC player and stream it to snapcast server for multiroom listening (Tested on RPi 4 and Debian 10) 


Usage:

You should have [Snapcast](https://github.com/badaix/snapcast) and [PulseAudio](https://www.freedesktop.org/wiki/Software/PulseAudio/) installed on your system. 


Load PulseAudio pipe-sink module with below commands :

`pacmd load-module module-pipe-sink file=/tmp/snapfifo sink_name=Snapcast format=s16le rate=48000`

`pacmd update-sink-proplist Snapcast device.description=Snapcast`




Put the youtube_multiroom.sh file in a folder and run this in command line. You should start to hear audio comming from your snapcast clients: 

`./youtube_multiroom.sh "URL of youtube video"`
