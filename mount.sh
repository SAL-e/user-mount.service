#!/bin/bash

OLDIFS=$IFS
IFS=" "
HOME_DIR="$2"
while read -r m_type m_dev m_dir m_options m_credentials
do
	[ ! -d "$HOME_DIR$m_dir" ] && mkdir -p "$HOME_DIR$m_dir" && chmod 700 "$HOME_DIR$m_dir"
	/bin/mount -t "$m_type" "$m_dev" "$HOME_DIR$m_dir" -o "$m_options,credentials=$HOME_DIR$m_credentials"
done < "$HOME_DIR/.config/user-mount.service/$1"
IFS=$OLDIFS
