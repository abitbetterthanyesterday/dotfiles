#!/bin/sh

set -eu

ROOTUID="0"
USER="$SUDO_USER"

echo "Setting up chezmoi"

if [ "$(id -u)" -ne "$ROOTUID" ]; then
	echo "Error: Please run as root" >&2
	exit 1
fi

if ! chezmoi="$(command -v chezmoi)"; then
	bin_dir="/usr/local/bin"
	chezmoi="${bin_dir}/chezmoi"
	echo "Installing chezmoi to '${chezmoi}'" >&2
	if command -v curl >/dev/null; then
		chezmoi_install_script="$(curl -fsSL https://chezmoi.io/get)"
	elif command -v wget >/dev/null; then
		chezmoi_install_script="$(wget -qO- https://chezmoi.io/get)"
	else
		echo "To install chezmoi, you must have curl or wget installed." >&2
		exit 1
	fi
	sh -c "${chezmoi_install_script}" -- -b "${bin_dir}"
	unset chezmoi_install_script bin_dir
fi

echo "Running chezmoi"

exec sudo -u "$USER" chezmoi init --apply "abitbetterthanyesterday"
