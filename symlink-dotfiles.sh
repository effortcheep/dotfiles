#!/usr/bin/env bash

echo "开始链接"

script_dir=$(cd $(dirname $0);pwd)
# echo "${script_dir}/zshrc"

ln -sfn /Users/effort/effort/dotfiles/zshrc ~/.zshrc

# ln -sfn zshrc ~/.zshrc

# ln -sfn env.sh ~/.env.sh
# ln -sfn alias.sh ~/.alias.sh
# ln -sfn fzf.sh ~/.fzf.sh

# ln -s tmux.conf ~/.tmux.conf
# ln -s xvimrc ~/.xvimrc

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

