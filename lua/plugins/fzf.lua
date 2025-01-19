return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    opts = {},
    config = function()
        vim.keymap.set('n', '<leader>sg', '<cmd>Fzf live_grep<CR>', { desc = 'Live-grep' })
        vim.keymap.set('n', '<leader>sf', '<cmd>Fzf files<CR>', { desc = 'Search Files' })
        vim.keymap.set('n', '<leader>sb', '<cmd>Fzf buffers<CR>', { desc = 'Search buffers' })
    end,
}
