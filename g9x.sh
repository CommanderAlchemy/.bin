#!/bin/sh
#
# Change mouse speed with constant deceleration to use with high DPI.

mouse_id=($(xinput list | awk -F "[=\t]" '/G9x/ {print $3}'))

for i in "${mouse_id[@]}"; do
  echo "Setting Deceleration 4, for id: "$i""
  xinput set-prop $i "Device Accel Constant Deceleration" 4
done