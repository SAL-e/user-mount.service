#!/bin/bash

OLDIFS=$IFS
IFS=" "
HOME_DIR="$2"
while read -r m_type m_dev m_dir m_options
do
	/bin/umount "$HOME_DIR$m_dir"
done < "$HOME_DIR/.config/user-mount.service/$1"
IFS=$OLDIFS
