#!/bin/bash

# Author:
## @tanmaybala!
### Requirments:
# pactl, pulsemixer

change=$1
cmd=${0##*/}
# Set default output to Buil-in Speakers.
sink=$(pactl list sinks | grep alsa_output.pci-0000_00_1f.3.analog-stereo -B 3 | grep "Sink #" | awk '{ print $2}' | cut -b 2)
$(pactl set-default-sink $sink)

if [ -x $change ]
then
		vol=$(pulsemixer --get-volume | cut -f1 -d' ')"%"
		mute=$(pactl list sinks | grep -i alsa_output.pci-0000_00_1f.3.analog-stereo -A 9 | grep "Mute:")
		if [[ $mute == *"yes"* ]]
		then
				echo "$vol [M]"
		else
				echo "$vol"
		fi
elif [ $change == "-mute" ]
then
		pactl set-sink-mute "$sink" toggle
else
		pactl set-sink-volume "$sink" $change
fi
