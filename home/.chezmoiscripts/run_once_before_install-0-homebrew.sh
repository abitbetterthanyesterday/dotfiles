#! /bin/bash
err() {
	echo "$*" >&2
}

echo "Install homebrew"
if ! command -v brew &>/dev/null; then
	echo "brew not found, installing homebrew"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
	echo "Homebrew already installed."
fi

echo "Install homebrew packages"
brew bundle --file "${CHEZMOI_WORKING_TREE}/home/brewfile"

exit 0
