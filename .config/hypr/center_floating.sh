#!/bin/bash

# toggle floating
hyprctl dispatch 'hl.dsp.window.float({ action = "toggle" })'
sleep 0.05

# resize and center the window
hyprctl dispatch 'hl.dsp.window.center()'
