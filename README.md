# dotfiles with chezmoi

这个仓库用于通过 [chezmoi](https://www.chezmoi.io/) 管理个人开发环境配置（dotfiles），例如：

- `~/.zshrc`
- `~/.gitconfig`
- `~/.ripgreprc`
- `~/.config/nvim/*`

通过 `chezmoi` 可以把配置文件版本化，并安全、可重复地同步到不同机器。

---

## 目录结构说明

在 `chezmoi` 源目录里，文件名通常会带前缀：

- `dot_` -> 对应目标文件名中的 `.`  
  例如：`dot_zshrc` -> `~/.zshrc`
- `dot_config/` -> 对应 `~/.config/`

当前仓库示例：

- `dot_zshrc`
- `dot_gitconfig`
- `dot_ripgreprc`
- `dot_config/nvim/`

---

## 快速开始（新机器）

### 1) 安装 chezmoi

参考官方安装文档：<https://www.chezmoi.io/install/>

Linux 常见安装方式（任选其一）：

```bash
sh -c "$(curl -fsLS get.chezmoi.io)"
```

或使用包管理器安装（如 `brew`, `apt`, `dnf`, `pacman` 等）。

### 2) 拉取并初始化此仓库

将 `<your-repo-url>` 替换为你的仓库地址：

```bash
chezmoi init <your-repo-url>
```

如果已在本机克隆仓库并希望直接指定本地路径，也可以：

```bash
chezmoi init --source /path/to/chezmoi-repo
```

### 3) 预览将要发生的改动

```bash
chezmoi diff
```

### 4) 应用配置

```bash
chezmoi apply
```

建议首次先 `diff` 再 `apply`，避免覆盖本机已有手工配置。

---

## 日常使用流程

### 场景 A：修改配置并同步回仓库

当你在目标位置（例如 `~/.zshrc`）直接改了文件，执行：

```bash
chezmoi add ~/.zshrc
chezmoi cd
git status
```

确认变更后正常提交：

```bash
git add .
git commit -m "update zsh config"
git push
```

### 场景 B：在仓库里编辑后应用到系统

```bash
chezmoi cd
# 编辑源文件，例如 dot_zshrc
chezmoi diff
chezmoi apply
```

### 场景 C：从远端更新并应用

```bash
chezmoi update
```

`chezmoi update` 通常等价于拉取远端并执行应用（行为依配置可能略有差异）。

---

## 常用命令速查

- `chezmoi status`：查看源目录与目标目录差异状态
- `chezmoi diff`：查看将应用到 `$HOME` 的具体 diff
- `chezmoi apply`：应用所有变更
- `chezmoi apply <path>`：仅应用某个文件
- `chezmoi add <file>`：把目标文件纳入管理
- `chezmoi edit <file>`：编辑受管文件（经 chezmoi 路径映射）
- `chezmoi managed`：列出所有受管文件
- `chezmoi cd`：进入 chezmoi 源目录
- `chezmoi doctor`：诊断环境问题

---

## Secret 与敏感信息管理（重要）

不要把明文密码、Token、私钥直接提交到仓库。

推荐方式：

1. 使用 `chezmoi` 模板读取环境变量
2. 使用 `chezmoi` 支持的密码管理器（如 `1Password`、`pass`、`Bitwarden` 等）
3. 使用 `age` / `gpg` 加密后再纳入管理

如果需要，我可以后续补一版 `secret` 模板示例（如在 `dot_zshrc.tmpl` 中安全注入 API Key）。

---

## 模板文件（可选进阶）

当你希望不同机器生成不同配置时，可以使用 `.tmpl`：

- `dot_gitconfig.tmpl`
- `dot_zshrc.tmpl`

示例思路：

- 根据主机名决定别名
- 根据系统类型（Linux/macOS）设置 PATH
- 根据环境变量决定是否启用代理

模板语法基于 Go template，详见：<https://www.chezmoi.io/reference/templates/>

---

## 建议的提交规范

推荐小步提交，便于回滚和审查：

- `feat(shell): add fzf keybindings`
- `fix(git): correct default branch in aliases`
- `chore(nvim): tune lsp formatting`

---

## 常见问题排查

### 1) `chezmoi apply` 后结果不符合预期

- 先执行 `chezmoi diff` 查看将写入内容
- 检查是否使用了模板（`.tmpl`）导致渲染差异
- 检查本机环境变量是否缺失

### 2) 与本地已有配置冲突

- 先备份现有文件
- 使用 `chezmoi add <file>` 将本地版本纳入管理
- 再手动整理差异，统一成最终版本

### 3) 不确定某文件是否被管理

```bash
chezmoi managed | rg zshrc
```

---

## 初始化后的推荐操作清单

在新机器上建议按这个顺序：

1. 安装 `chezmoi`
2. `chezmoi init <repo>`
3. `chezmoi diff`
4. `chezmoi apply`
5. 打开新 shell 验证 `zsh/git/nvim` 是否生效
6. `chezmoi doctor` 做一次健康检查

---

## 参考链接

- 官网：<https://www.chezmoi.io/>
- 快速开始：<https://www.chezmoi.io/quick-start/>
- 命令参考：<https://www.chezmoi.io/reference/commands/>
- 模板参考：<https://www.chezmoi.io/reference/templates/>

