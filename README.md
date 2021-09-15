# youtube-snapcast
This is a shell script to start youtube video in VLC player and stream the audio to snapcast server for multiroom listening (Tested on RPi 4 and Debian 10) 


Usage:

You should have [Snapcast](https://github.com/badaix/snapcast), [PulseAudio](https://www.freedesktop.org/wiki/Software/PulseAudio/) and [VLC](https://www.videolan.org/vlc/download-debian.html) installed on your system. 

If VLC player gives you an error: "Unable to open MRL" see this [Link](https://thegeekpage.com/vlc-media-player-cannot-play-youtube-videos/). I had to remove the youtube.luac from playlists folder and replace it with youtube.lua from [here](https://code.videolan.org/videolan/vlc/-/raw/master/share/lua/playlist/youtube.lua?inline=false).


Load PulseAudio pipe-sink module with below commands :

`pacmd load-module module-pipe-sink file=/tmp/snapfifo sink_name=Snapcast format=s16le rate=48000`

`pacmd update-sink-proplist Snapcast device.description=Snapcast`




Put the youtube_multiroom.sh file in a folder and run this in command line. You should start to hear audio comming from your snapcast clients: 

`./youtube_multiroom.sh "URL of youtube video"`
