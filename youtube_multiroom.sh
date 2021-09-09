#!/bin/sh

# Script to play youtube video on VLC player and sink its audio to snapcast pipe

# Usage:
# You should have Snapcast installed on your system. (Tested only on RPi 4)

# Load the pipe-sink module in PulseAudio with commands below
#pacmd load-module module-pipe-sink file=/tmp/snapfifo sink_name=Snapcast format=s16le rate=48000
#pacmd update-sink-proplist Snapcast device.description=Snapcast

# Run this in command line: ./youtube_multiroom.sh "URL of youtube video"


# Killing all VLC instances
killall vlc

$1 # Store youtube URL to variable

startVLC="cvlc -Vdummy $1" # Cast the command for playing youtube video with VLC (no video window)

$startVLC & # Execute command in background

index=-1


# Getting sink input index from PulseAudio

while [ "$index" -eq -1 ]
do
   ind=$(pacmd list-sink-inputs | sed -n 's/.*index: //p')
   if [ "$ind" -gt $index ]
   then
      index=$ind
   else
      index=-1
   fi
   #sleep 1
done


# Move VLC input sink to Snapcast
pactl move-sink-input $index Snapcast
