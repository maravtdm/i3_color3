#!/bin/bash
if [[ -d ~/.local/share/Trash/files ]]; then
trash_files=$(ls -R ~/.local/share/Trash/files/ | grep -v Trash | wc -l)
	echo $trash_files
else
	echo 0
fi
