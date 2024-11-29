-- Map " pv" key sequence to :Ex which opens netrw (the built-in dired mode/file-explorer)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pc", "<cmd>e " .. vim.fn.stdpath("config") .. "<CR>")

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

function YankDirectory()
    local abs_path = vim.fn.expand('%:p:h'):gsub('\\', '/')
    vim.fn.setreg('p', 'cd ' .. abs_path)
end

function EnterTerminalMode(cdToDir)
    -- and make sure we enter terminal mode by inputting 'i' in normal mode
    if cdToDir then
        vim.cmd('normal! "ppi')
    else
        vim.cmd("normal! i")
    end
end

function ToggleTerm(cdToDir)
    local term_buf = vim.g.term_buf
    if cdToDir then
        YankDirectory()
    end
    if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
        -- If the terminal is already open, hide it by switching to a different buffer
        if vim.fn.bufwinnr(term_buf) ~= -1 then
            vim.cmd("close")  -- close the split that the buffer is in
        else
            vim.cmd("sbuffer " .. term_buf)  -- Split, and switch back to the terminal buffer
            EnterTerminalMode(cdToDir)
        end
    else
        -- Open a terminal in a horizontal split
        vim.cmd("split")
        vim.cmd("terminal")
        EnterTerminalMode(cdToDir)
        vim.g.term_buf = vim.api.nvim_get_current_buf()
    end
end
-- TODO:
-- we have to also figure out how to cd to the directory of the file we were editing when we toggled
-- that should perhaps be a different command? to a parameter to ToggleTerm so we can call it explictly
vim.keymap.set({'n', 't'}, '<A-t>', function() ToggleTerm(false) end)
vim.keymap.set('n', '<leader>cd', function() ToggleTerm(true) end)


function SetCwd()
    local abs_path = vim.fn.expand('%:p:h'):gsub('\\', '/')
    vim.api.nvim_set_current_dir(abs_path)
end

vim.api.nvim_create_user_command('SetCwd', SetCwd, {})