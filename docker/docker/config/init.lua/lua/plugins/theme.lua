return {
  -- 主题
  {
    'ribru17/bamboo.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      -- optional configuration here
      style = 'multiplex',
      transparent = false,
    },
    config = function()
      require('bamboo').load()
    end,
  }
}
