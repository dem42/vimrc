return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
        hijack_cursor = true,
        view = { side = "right", },
        live_filter = {
            prefix = "[FILTER]: ",
            always_show_folders = false,
        }
    }
  end,
}
