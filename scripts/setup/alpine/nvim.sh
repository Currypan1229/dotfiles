#!/bin/ash

BASE_DIR=$(cd "$(dirname "$0")" && pwd)
INSTALL_SCRIPTS_DIR=$(cd "$BASE_DIR/../../install/alpine" && pwd)

sh "$INSTALL_SCRIPTS_DIR/nvim.sh"


cwd=$(pwd)
CONFIG_DIR="$HOME/.config/"
SYMLINK_FILE="$CONFIG_DIR/nvim"

if [ -e "$SYMLINK_FILE" ]; then
        rm -rf "$SYMLINK_FILE"
        echo "Deleted exists symlink for nvim."
fi


if [ ! -d "$CONFIG_DIR" ]; then
        mkdir -p "$CONFIG_DIR"
fi

ln -sfn "$cwd/nvim" "$SYMLINK_FILE"
