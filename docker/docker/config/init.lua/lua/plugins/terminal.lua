return {
  -- 终端插件
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
      size = 20,          -- 终端默认高度/宽度
      -- open_mapping = [[<c-\>]], -- 默认快捷键：Ctrl+\
      direction = "float", -- 终端方向：float（浮动）, horizontal（水平分屏）, vertical（垂直分屏）
      float_opts = {
        border = "curved", -- 浮动窗口边框样式
      },
    },
    keys = {
      { "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal", mode = { "n", "i", "v", "t" } }, -- 切换终端
      { "<esc>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal", mode = { "t" } }, -- 切换终端
    },
  }
}
