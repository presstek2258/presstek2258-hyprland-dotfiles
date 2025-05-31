#!/bin/bash

# toggle floating
hyprctl dispatch togglefloating
sleep 0.05

# resize and center the window
hyprctl dispatch centerwindow
