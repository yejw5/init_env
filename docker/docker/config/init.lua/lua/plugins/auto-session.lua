return {
  -- session管理
  {
    "rmagatti/auto-session",
    event = "VimEnter",
    opts = {
      log_level = "error",
      auto_session_enabled = true,
      allowed_dirs = { "~/autonomous-driving/*"}, -- 允许自动保存/恢复session的目录
      auto_session_suppress_dirs = { "~/", "/tmp", "~/Downloads" },
    },
  }
}
