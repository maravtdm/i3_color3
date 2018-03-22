#!/bin/bash
#label=" "
if [[ -d ~/.local/share/Trash/files ]]; then
trash=$(ls -R ~/.local/share/Trash/files/ | grep -v Trash | wc -l)
	echo $trash
else
	echo 0
fi
