#!/bin/sh

arr=$(bt-device -l | cut -d '(' -f 2 | cut -d ')' -f 1)

# IFS=$' ' #setting comma as delimiter
# read -a arr <<< "$arr1"
error="Error: Device not found."
add="Added"
op=""
connected=0
paired=0
for e in $arr
do
		# echo $e
		# info=$(bt-device -i $e)
		if [ $e = $add ] || [ $e = "devices:" ]
		then
				op=""
		else
				name=$(bt-device -i $e | grep -i Name: | cut -d ":" -f 2)
				con=$(bt-device -i $e | grep -i Connected: | cut -d ":" -f 2)
				pair=$(bt-device -i $e | grep -i Paired: | cut -d ":" -f 2)
				if [ $con -eq 1 ]
				then
						connected=$(( $connected+1 ))
				fi
				if [ $pair -eq 1 ]
				then
						paired=$(( $paired+1 ))
				fi
				op=$op$name
		fi
done

# echo "Paired: $paired, Connected: $connected, Devices: $op"
echo $paired:$connected
