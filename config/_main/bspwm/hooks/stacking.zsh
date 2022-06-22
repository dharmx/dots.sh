#!/usr/bin/env zsh

# monitor and keep eww bar below all windows
bspc subscribe node_state | while read -r _ _ _ _ state flag
do
  [ $state = fullscreen ] && [ $flag = on ] && xdo lower -N eww-vertigo
done &

bspc subscribe node_add | while read -r _
do
  xdo lower -N stalonetray
  xdo raise -N Plank
done &

# vim:ft=zsh
