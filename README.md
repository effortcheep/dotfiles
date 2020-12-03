## 安装 homebrew

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```



## 安装 iterm2

```shell
https://www.iterm2.com/downloads.html
```



## 安装 iterm2 主题

```markdown
Iterm2 theme(I use dracula):
+ https://github.com/MartinSeeler/iterm2-material-design
+ https://draculatheme.com/iterm/
Term2 > Preferences > Profiles > Colors Tab -> import from and choose theme file.
```



## 安装 oh-my-zsh

```shell
# https://github.com/robbyrussell/oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```



## 安装字体 (install nerd-font)

```shell
# https://github.com/ryanoasis/nerd-fonts#option-4-homebrew-fonts
brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font

# Iterm2 里配置非 acsii 字体，否则对于 powerlevel10k 主题的特殊字体会显示不出来。

# (Iterm2 -> Preferences -> Profiles -> Text -> Non-Ascii-Font 选择 nerd-font and restart Iterm2), 之后重启 Iterm2 生效
```



## 安装 zplug 插件管理器

```shell
# https://github.com/zplug/zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
```



## 安装命令行工具

```shell
brew install fzf
# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install

brew install thefuck
brew install autojump
```



## 安装 tmux

```shell
# install tmux plugin manager
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm , use prefix + I install plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# MacOS install tmux
brew install tmux
brew install reattach-to-user-namespace
# copy my tmux conf, I use https://github.com/gpakosz/.tmux
cp .tmux.conf ~/.tmux.conf
cp .tmux.conf.local ~/.tmux.conf.local
```

