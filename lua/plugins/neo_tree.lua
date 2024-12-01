return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
        vim.keymap.set("n", "<leader>ev", "<cmd>Neotree position=right dir=%:p:h:h reveal_file=%:p<CR>")
        vim.keymap.set("n", "<leader>ec", "<cmd>Neotree position=right dir=C:/Users/marti/AppData/Local/nvim<CR>")
    end
}

--return {
--  "nvim-tree/nvim-tree.lua",
--  version = "*",
--  lazy = false,
--  dependencies = {
--    "nvim-tree/nvim-web-devicons",
--  },
--  config = function()
--    require("nvim-tree").setup {
--        hijack_cursor = true,
--        view = { side = "right", },
--        live_filter = {
--            prefix = "[FILTER]: ",
--            always_show_folders = false,
--        }
--    }
--  end,
--  init = function()
--    vim.keymap.set("n", "<leader>xv", function() require("nvim-tree.api").tree.toggle({path = vim.fn.expand('%')}) end)
--    vim.keymap.set("n", "<leader>xc", function() require("nvim-tree.api").tree.open({path = vim.fn.stdpath("config")}) end)
--  end,
--}
