#!/usr/bin/env bash

echo "开始链接"

ln -s zshrc ~/.zshrc

ln -s env.sh ~/.env.sh
ln -s alias.sh ~/.alias.sh
ln -s fzf.sh ~/.fzf.sh

ln -s tmux.conf ~/.tmux.conf
ln -s xvimrc ~/.xvimrc

echo "链接完成"
# link() {
#     from="$1"
#     to="$2"
#     echo "Linking '$from' to '$to'"
#     ln -s "$from" "$to"
# }

# for location in $(find -name '.*'); do
#     echo "${location}"
#     # file="${location##*/}"
#     # file="${file%.sh}"
#     # link "$dotfiles/$location" "$HOME/$file"
# done

