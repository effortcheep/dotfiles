## Neovim 配置（vpack + snacks.nvim）

这是一套基于 **Neovim 0.11+** 的个人配置：使用 `vpack` 管理插件、`snacks.nvim` 提供 dashboard / picker，并用 **Neovim 内置 LSP**（`vim.lsp.enable` + `lsp/*.lua`）按文件类型启动语言服务。

### 亮点

- **插件管理**：`vpack`（带 `nvim-pack-lock.json` 锁定版本）
- **搜索/选择器**：`snacks.nvim`（`<leader>f*` 系列快捷键）
- **文件管理**：`oil.nvim`（`-` 打开父目录）
- **代码补全**：`blink.cmp`（现代补全引擎）
- **LSP**：按 `after/ftplugin/*.lua` 启动；server 配置在 `lsp/*.lua`
- **语法高亮**：`nvim-treesitter`
- **Git**：`gitsigns.nvim`、`vscode-diff.nvim`
- **UI**：`catppuccin` 主题、`heirline` 状态栏
- **Markdown**：`render-markdown.nvim`、图片粘贴（`img-clip.nvim`）
- **LaTeX**：`texlab` + `conform.nvim`
- **Typst**：`tinymist`
- **任务运行**：`overseer.nvim`
- **调试**：`debugpy` 集成

### 版本与依赖

- **Neovim**：建议 `>= 0.11`（本配置使用 `vim.lsp.enable`、`vim.uv`、`vim.loader.enable()` 等）
- **必备命令**：
  - `git`（首次启动会自动拉取插件）
  - `ripgrep`（`rg`，用于内容检索 picker）
  - `fd`（用于文件查找 picker，推荐安装）
- **推荐/可选**：
  - `node` / `npm`：JS/TS/Vue lint/format
  - `python3` / `pip`：Python LSP 和调试
  - `stylua`：Lua 格式化
  - `imagemagick`：提供 `magick`，用于 Markdown/TeX/Typst 图片粘贴处理（`img-clip.nvim`）

### 安装

1. 备份你现有的配置（如有）：

```bash
mv ~/.config/nvim ~/.config/nvim.bak.$(date +%F-%H%M%S)
```

2. 将本目录放到 `~/.config/nvim`（例如克隆到该路径，或直接复制整个目录）。
3. 启动 `nvim`，首次启动会自动同步插件。

常用维护命令：

- `:Lazy`：打开插件管理（如果使用 lazy.nvim）
- `:Mason`：安装/管理 LSP/格式化/调试等工具

### 目录结构

- `init.lua`：入口，加载配置
- `lua/config/`：通用配置（keymaps, options, autocmds, lsp 等）
- `lua/plugins/`：插件声明与配置
- `after/ftplugin/`：按文件类型做设置（包含 `vim.lsp.enable(...)`）
- `lsp/`：内置 LSP server 配置
- `snippets/`：代码片段
- `overseer/`：任务模板

### LSP（如何启用/改配置）

- **启用方式**：按文件类型在 `after/ftplugin/*.lua` 中调用 `vim.lsp.enable(...)`
  - 例如：
    - `lua`：`lua_ls`
    - `typescript/javascript`：`vtsls`
    - `rust`：`rust_analyzer`
    - `tex`：`texlab`
    - `typst`：`tinymist`
- **Server 配置**：在 `lsp/*.lua` 中
- **安装 server**：推荐用 `:Mason` 管理

### 格式化与 Lint

- **Conform**：保存自动格式化 + 手动格式化
- **Lint**：使用 `nvim-lint`
- **nvim-lint**：配置在 `lua/custom/plugins/nvim-lint.lua`
  - JS/TS/JSON/Vue：`oxlint` / `eslint_d`（按 filetype 组合执行）

### 平台差异说明

部分插件按平台启用（通过 `custom.utils.is_mac()` 判断）：

- `vimtex`：仅 macOS 启用（Linux 下默认关闭）
- `typst-preview.nvim`：仅 macOS 启用


