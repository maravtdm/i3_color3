#!/bin/sh
yay -Syy >/dev/null 2>&1
update=$(yay -Qu | wc -l)
echo $update
