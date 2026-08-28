# 快捷键指南

> Leader 键是 **Space**

## 通用操作

| 快捷键 | 功能 |
|--------|------|
| `<leader>o` | 保存并重新加载配置 |
| `<leader>w` | 保存文件 |
| `<leader>R` | 重启 Neovim |
| `<leader>j` | 跳转到下一个诊断 |
| `<leader>k` | 跳转到上一个诊断 |
| `,w` | 保存文件（插入模式可用） |
| `<Esc>` | 清除搜索高亮 |

## 窗口与标签页

| 快捷键 | 功能 |
|--------|------|
| `\` | 水平分割窗口 |
| `|` | 垂直分割窗口 |
| `L` | 切换到下一个标签页 |
| `H` | 切换到上一个标签页 |
| `<C-w><C-t>` | 在新标签页中打开当前 buffer |

## Snacks Picker（文件搜索）

| 快捷键 | 功能 |
|--------|------|
| `<leader>ff` | 智能查找文件 |
| `<leader>fo` | 查找最近打开的文件 |
| `<leader>fw` | 搜索文件内容（grep） |
| `<leader>fh` | 在帮助文档中搜索 |
| `<leader>fl` | 查看可用的 picker 布局 |
| `<leader>fk` | 查找快捷键 |
| `<leader><leader>` | 切换 buffer（按最近使用排序） |
| `<leader>fm` | 查找书签 |
| `<leader>fn` | 查看通知 |
| `<leader>fS` | 查找工作区符号 |
| `<leader>fs` | 查找当前 buffer 的符号 |

## LSP 相关

| 快捷键 | 功能 |
|--------|------|
| `gd` | 跳转到定义 |
| `gD` | 跳转到定义（智能分屏） |
| `grr` | 查找 LSP 引用 |
| `[f` | 跳转到当前函数开头 |
| `]f` | 跳转到当前函数结尾 |
| `<leader>td` | 切换 diagnostics 显示 |
| `<leader>th` | 切换 inlay hints |
| `<leader>lf` | 格式化当前 buffer |

## 文件浏览

| 快捷键 | 功能 |
|--------|------|
| `-` | 打开父目录（Oil） |

## 格式化

| 快捷键 | 功能 |
|--------|------|
| `<leader>lf` | 格式化当前 buffer |
| `<leader>tf` | 切换保存时自动格式化 |

## Git

| 快捷键 | 功能 |
|--------|------|
| `<leader>gg` | 打开 lazygit（需要安装） |
| `<leader>co` | 打开/关闭 Diffview |
| `<leader>ch` | 查看当前文件的历史 |
| `]c` | 跳转到下一个 git 块 |
| `[c` | 跳转到上一个 git 块 |
| `<leader>hs` | 暂存当前块 |
| `<leader>hr` | 重置当前块 |
| `<leader>hS` | 暂存整个 buffer |
| `<leader>hR` | 重置整个 buffer |
| `<leader>hp` | 预览当前块 |
| `<leader>hi` | 内联预览当前块 |

## 终端

| 快捷键 | 功能 |
|--------|------|
| `<leader>sR` | 发送选中文本到 ROOT 终端 |
| `<leader>sr` | 发送选中文本到 ROOT 终端（可视化模式） |
| `<leader>sp` | 发送选中文本到 Python 终端 |
| `<leader>tp` | 选择预定义的终端并打开 |

## Lua 开发

| 快捷键 | 功能 |
|--------|------|
| `<space>X` | 运行当前 Lua 文件 |
| `<space>x` | 运行当前行作为 Lua 代码 |
| `<space>x` | 运行选中的代码（可视化模式） |

## 插件快捷键

| 快捷键 | 功能 |
|--------|------|
| `<leader>rl` | 打开 Overseer 任务运行器 |
| `<leader>ds` | 加载调试功能 |
| `<leader>Cp` | 打开命令面板 |

## Avante AI（AI 助手，默认 provider = pi）

### 全局快捷键

| 快捷键 | 功能 |
|--------|------|
| `<leader>aa` | 侧边栏提问（AvanteAsk） |
| `<leader>ac` | 添加当前 buffer 到选中文件 |
| `<leader>af` | 切换侧边栏焦点（AvanteFocus） |
| `<leader>at` | 开关侧边栏（AvanteToggle） |
| `<leader>an` | 新建提问 |
| `<leader>ae` | 编辑选中的代码块 |
| `<leader>aS` | 停止当前 AI 请求 |
| `<leader>ad` | 切换调试模式 |
| `<leader>as` | 切换建议显示 |
| `<leader>aR` | 切换 repo map |
| `<leader>a?` | 选择模型 |
| `<leader>aM` | 选择 ACP agent 模型 |
| `<leader>am` | 选择 ACP agent 模式 |
| `<leader>ah` | 选择聊天历史 |
| `<leader>ar` | 刷新侧边栏 |
| `<leader>aB` | 添加所有 buffer 到选中文件 |
| `<leader>az` | Zen 模式 |

### 侧边栏内（光标在侧边栏时）

| 快捷键 | 功能 |
|--------|------|
| `]p` / `[p` | 下一个 / 上一个 prompt |
| `A` | 应用全部 |
| `a` | 应用光标处的代码块 |
| `r` | 重试用户请求 |
| `e` | 编辑用户请求 |
| `<Tab>` / `<S-Tab>` | 切换窗口 |
| `x` | 切换代码窗口 |
| `d` | 移除文件 |
| `@` | 添加文件 |
| `q` | 关闭侧边栏 |

### 冲突解决（确认窗口）

| 快捷键 | 功能 |
|--------|------|
| `co` | 保留 ours |
| `ct` | 保留 theirs |
| `ca` | 全部 theirs |
| `cb` | 两者都要 |
| `cc` | 光标处 |
| `]x` / `[x` | 下一个 / 上一个冲突 |
| `<C-w>f` | 聚焦确认窗口 |
| `c` / `r` / `i` | 确认代码 / 响应 / 输入 |

### 常用命令

| 命令 | 功能 |
|--------|------|
| `:AvanteSwitchProvider` | 切换 provider（交互式选择，含 pi） |
| `:AvanteChat` / `:AvanteChatNew` | 开始 / 新建聊天 |
| `:AvanteAsk` | 直接提问 |
| `:AvanteToggle` / `:AvanteFocus` | 开关 / 聚焦侧边栏 |
| `:AvanteHistory` | 查看聊天历史 |
| `:AvanteEdit` | 编辑选中的代码块 |
| `:AvanteModels` | 查看模型列表 |
| `:AvanteStop` | 停止当前请求 |

## 移动

| 快捷键 | 功能 |
|--------|------|
| `j` | 向下移动（支持虚拟行） |
| `k` | 向上移动（支持虚拟行） |

## Treesitter（代码结构）

| 快捷键 | 功能 |
|--------|------|
| `<leader>tc` | 切换 Treesitter Context 显示 |

## Mini.ai（文本对象）

| 快捷键 | 功能 |
|--------|------|
| `af` | 选中外层语法块 |
| `if` | 选中内层语法块 |
| `ac` | 选中当前语法块（含子节点） |
| `ic` | 选中当前语法块（不含子节点） |
| `[` | 跳转到上一个文本对象 |
| `]` | 跳转到下一个文本对象 |

## Mini.surround（环绕编辑）

| 快捷键 | 功能 |
|--------|------|
| `sa` | 添加环绕符号 |
| `sd` | 删除环绕符号 |
| `sf` | 查找环绕符号（向右） |
| `sF` | 查找环绕符号（向左） |
| `sh` | 高亮环绕符号 |
| `sr` | 替换环绕符号 |

## 其他

| 快捷键 | 功能 |
|--------|------|
| `<leader>sw` | 切换单词（switch.nvim） |
| `<leader>P` | 从剪贴板粘贴图片（Markdown/TeX/Typst） |