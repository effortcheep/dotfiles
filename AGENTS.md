# AGENTS.md

## 这是什么仓库

chezmoi dotfiles 仓库，管理个人开发环境配置。不是代码项目，没有构建/测试/lint 流程。

远程：`git@github.com:effortcheep/dotfiles.git`，分支 `main`。

## chezmoi 命名规则

源目录中 `dot_` 前缀映射为目标路径的 `.`：
- `dot_zshrc` → `~/.zshrc`
- `dot_config/` → `~/.config/`

编辑源文件后必须先 `chezmoi diff` 再 `chezmoi apply`，不要直接改 `$HOME` 下的文件。

## 受管配置清单

| 源路径 | 目标路径 |
|--------|----------|
| `dot_zshrc` | `~/.zshrc` |
| `dot_gitconfig` | `~/.gitconfig` |
| `dot_ripgreprc` | `~/.ripgreprc` |
| `dot_tmux.conf` | `~/.tmux.conf` |
| `dot_config/nvim/` | `~/.config/nvim/` |
| `dot_config/lazygit/config.yml` | `~/.config/lazygit/config.yml` |
| `dot_agents/` | `~/.agents/` |
| `dot_config/opencode/AGENTS.md` | `~/.config/opencode/AGENTS.md` |
| `dot_config/opencode/agent/` | `~/.config/opencode/agent/` |

## 提交规范

格式：`<type>(<scope>): <msg>`
示例：`feat(shell): add fzf keybindings`、`chore(nvim): tune lsp formatting`

## Neovim 配置要点

要求 Neovim >= 0.11。使用 `vim.lsp.enable()`（内置 LSP，非 lspconfig 注册方式）。

- 入口：`dot_config/nvim/init.lua`，按顺序加载 `config/` 和 `plugins/`
- 插件管理：`vpack`（带 `nvim-pack-lock.json` 锁版本），不是 lazy.nvim
- LSP server 配置：`lsp/*.lua`，按文件类型在 `after/ftplugin/*.lua` 中用 `vim.lsp.enable(...)` 启用
- 全局 LSP 也在 `lua/config/lsp.lua` 中 `vim.lsp.enable()`（marksman, lua_ls, pylsp 等）
- 主题：catppuccin，lazygit/tmux 也统一用 catppuccin 色板
- Picker：snacks.nvim（`<leader>f*`）

必备外部命令：`rg`（ripgrep）、`fd`、`git`

## zsh 环境

- 别名：`vi=nvim`、`lg=lazygit`、`t=tmux` 及系列 tmux 快捷别名
- 工具链：fnm（Node）、uv（Python）、bun、pnpm、starship prompt、fzf
- `EDITOR=nvim`
- opencode 在 PATH 中：`/home/effort/.opencode/bin`

## tmux 配置

- vim-tmux-navigator：Alt+h/j/k/l 在 nvim 和 tmux pane 间导航
- vi 模式复制：`v` 选中、`y` 复制
- 鼠标开启，窗口索引从 1 开始

## 禁止事项

- 不要提交明文密码、Token、私钥。使用 chezmoi 模板读取环境变量或 age/gpg 加密
- 不要用 `chezmoi edit` 以外的方式编辑受管文件（会跳过路径映射）
