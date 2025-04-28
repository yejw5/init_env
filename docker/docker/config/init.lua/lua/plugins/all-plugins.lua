return {
  -- 括号自动补全
  {
      'windwp/nvim-autopairs',
      event = "InsertEnter",
      config = true
      -- use opts = {} for passing setup options
      -- this is equivalent to setup({}) function
  },

  -- 图标外观优化
  { "nvim-tree/nvim-web-devicons", opts = {} },

  -- 文件目录
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    keys = {
      { "<C-n>", ":NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
    },
    opts = {
      update_focused_file = {
        enable = true,      -- 启用自动定位
        update_cwd = true,  -- 同时更新工作目录（可选）
      },
    },
  },

  -- 语法高亮
  {
    'nvim-treesitter/nvim-treesitter',
    event = "BufRead",  -- 延迟加载到打开文件时
    build = ":TSUpdate",  -- 首次安装后自动更新语法解析器
    config = function()
      -- 这里是 Treesitter 的配置
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "lua", "vim", "python", "javascript" }, -- 指定需要安装的语法解析器
        sync_install = false, -- 同步安装（较慢，通常设为 false）
        auto_install = true,  -- 自动安装缺失的解析器
        highlight = {
          enable = true,      -- 启用代码高亮
          additional_vim_regex_highlighting = false, -- 禁用传统正则高亮（提升性能）
        },
      })
    end,
  },

  -- 状态栏定制
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {}
  },

  -- 缓冲区标签栏
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      vim.opt.termguicolors = true,
      require("bufferline").setup{
        vim.keymap.set("n", "<C-h>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true }),
        vim.keymap.set("n", "<C-l>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true }),
        vim.keymap.set('n', '<S-w>', ':bd<CR>', { desc = 'Close buffer',}),
        options = {
          numbers = "ordinal",
          mode = "buffers",  -- 显示 Buffers 而非原生 Tabs
          separator_style = "slant",  -- 标签分隔符样式
          show_close_icon = false,     -- 隐藏关闭按钮
          offsets = {{
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left"
          }}
        }
      }
    end
  },

  -- github copilot
  {
    'github/copilot.vim',
    lazy = false,
  },

  -- 文件名、内容检索
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<S-p>", "<cmd>Telescope buffers<cr>", desc = "Live grep" },
    },
  },

  -- 每行灰度显示git blame概括
  {
    "f-person/git-blame.nvim",
    -- load the plugin at startup
    event = "VeryLazy",
    -- Because of the keys part, you will be lazy loading this plugin.
    -- The plugin will only load once one of the keys is used.
    -- If you want to load the plugin at startup, add something like event = "VeryLazy",
    -- or lazy = false. One of both options will work.
    opts = {
        -- your configuration comes here
        -- for example
        enabled = true,  -- if you want to enable the plugin
        message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
        date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
        virtual_text_column = 1,  -- virtual text start column, check Start virtual text at column section for more options
    },
  },
  
  -- 展开git message内容
  {
    'rhysd/git-messenger.vim',
    event = "BufRead",
    keys = {
      { "<C-m>", ":GitMessenger<CR>", desc = "Show Git History with Diff" },
      { "<S-m>", ":GitMessengerClose<CR>", desc = "Close Git Messenger" },
    },
  },
}
