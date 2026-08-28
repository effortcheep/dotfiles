-- avante.nvim - AI 驱动的代码辅助插件（类似 Cursor）
--
-- 必选依赖：plenary.nvim、nui.nvim
-- 可选依赖（本配置已带）：
--   snacks.nvim   -> input / selector 的现代化 UI
--   img-clip.nvim -> 聊天里粘贴图片
--   render-markdown.nvim -> 渲染 Avante 文件类型（见 after/ftplugin/markdown.lua）
--   mini.icons / nvim-web-devicons
--   blink-cmp-avante -> blink.cmp 中补全 @提及 / /命令 / #快捷方式

-- 1. 构建钩子：avante 附带 Rust 原生库（tokenizers/repo-map/html2md 等），
--    安装/更新后需运行 `make` 编译（本机有 cargo）。
vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "avante.nvim" and (kind == "install" or kind == "update") then
      vim.system({ "make" }, { cwd = ev.data.path }):wait()
    end
  end,
})

-- 2. 声明插件
vim.pack.add({
  { src = "https://github.com/avante-corp/avante.nvim" },
  -- 必选依赖
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/MunifTanjim/nui.nvim" },
  -- blink.cmp 补全源（@提及 / /命令 / #快捷方式）
  { src = "https://github.com/Kaiser-Yang/blink-cmp-avante" },
})

-- 3. 配置
require("avante").setup({
  provider = "claude", -- 默认 provider，可用 :AvanteSwitchProvider 切换
  instructions_file = "avante.md", -- 项目根目录的指令文件
  behaviour = {
    auto_suggestions = false, -- 关闭高成本的内联建议（需单独开）
    auto_set_keymaps = true, -- 使用 avante 默认快捷键（<leader>a*）
  },
  -- 复用已有的 snacks.nvim 作为输入框和选择器
  input = {
    provider = "snacks",
    provider_opts = {
      title = "Avante Input",
      icon = " ",
    },
  },
  selector = {
    provider = "snacks",
  },
  file_selector = {
    provider = "snacks",
  },
})

-- 4. 常用快捷键（其余走 avante 默认 <leader>a* 映射）
local map = function(mode, key, func, desc)
  vim.keymap.set(mode, key, func, { desc = desc })
end
-- 打开/聚焦侧边栏
map("n", "<leader>aa", "<cmd>AvanteAsk<cr>", "Avante: 侧边栏提问")
map("n", "<leader>ac", "<cmd>AvanteChatNew<cr>", "Avante: 新聊天")
map("n", "<leader>af", "<cmd>AvanteFocus<cr>", "Avante: 切换侧边栏焦点")
map("n", "<leader>at", "<cmd>AvanteToggle<cr>", "Avante: 开关侧边栏")
