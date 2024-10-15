-- Module of keymaps & bindings which makes using Neovim a pleasure

local telescope = require("telescope.builtin")
local utils = require("utils")
local map = require("utils").map

-- Open the starter dashboard if the buffer list is empty
local open_starter_if_empty_buffer = function()
  local buf_id = vim.api.nvim_get_current_buf()
  local is_empty = vim.api.nvim_buf_get_name(buf_id) == "" and vim.bo[buf_id].filetype == ""
  if not is_empty then
    return
  end

  require("mini.starter").open()
  vim.cmd(buf_id .. "bwipeout")
end

-- Delete all buffers and open the starter dashboard
local bdelete = function()
  require("mini.bufremove").delete()
  open_starter_if_empty_buffer()
end

-- Use the ":Telescope git_files" command if the current directory is version controlled with Git
local git_files = function()
  if utils.is_git_repo() or utils.has_git_dir() then
    telescope.git_files()
  end
end

-- Change to Normal mode by pressing "jk" in quick succession
map("i", "jk", "<esc>", { desc = "Change to Normal mode" })

-- Easier navigation to the beginning or the start of the line
map("n", "H", "<Home>", { desc = "Move to the beginning of the line" })
map("n", "L", "<End>", { desc = "Move to the end of the line" })

-- "Better up/down navigation" (??) not sure what its supposed to do, see the credit below:
-- https://github.com/LazyVim/LazyVim/blob/befa6c67a4387b0db4f8421d463f5d03f91dc829/lua/lazyvim/config/keymaps.lua#L16
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Navigate around windows more easily with the "hjkl" keys
map("n", "<leader>h", "<C-w>h", { desc = "Go to left window" })
map("n", "<leader>j", "<C-w>j", { desc = "Go to lower window" })
map("n", "<leader>k", "<C-w>k", { desc = "Go to upper window" })
map("n", "<leader>l", "<C-w>l", { desc = "Go to right window" })

-- Resize windows using <Ctrl + Arrow keys>
map("n", "<C-Up>", "<CMD>resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", "<CMD>resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Right>", "<CMD>vertical resize +2<CR>", { desc = "Increase window width" })
map("n", "<C-Left>", "<CMD>vertical resize -2<CR>", { desc = "Increase window width" })

-- Better & easier indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Disable the redundant (and sometimes annoying "Ex mode")
-- INFO: See the docs at ":h gQ" for more info on what its supposed to do
map("n", "gQ", "<NOP>")

-- Exit terminal mode in builtin terminal with an easier to use shortcut
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Easier navigation in Insert mode without the arrow keys!
map("i", "<M-h>", "<Left>", { desc = "Move left in Insert mode" })
map("i", "<M-j>", "<Down>", { desc = "Move down in Insert mode" })
map("i", "<M-k>", "<Up>", { desc = "Move up in Insert mode" })
map("i", "<M-l>", "<Right>", { desc = "Move right in Insert mode" })

-- Configure Neovim to delete text without copying them to the unnamed register
map("n", "d", '"_d', { desc = "Delete a line of texting without storing it in a register" })

-- Disable search highlight after a pattern has been searched for
map("n", "<Esc><Esc>", "<CMD>set nohlsearch<CR>", { desc = "Remove the pattern highlight after a search function" })

-- List all available files (and directories) using Telescope
map("n", "<leader>ff", telescope.find_files, { desc = "List all available files/directories" })
map("n", "<leader>gf", git_files, { desc = "List all files and folders tracked inside the Git repository" })
map("n", "<leader>of", telescope.oldfiles, { desc = "Open recently opened files" })

-- Delete the buffer contents from the Neovim session
map("n", "<leader>bd", bdelete, { desc = "Delete the buffer contents from the Neovim session" })

-- List all currently loaded buffers
map("n", "<leader>b", telescope.buffers, { desc = "List all currently in-memory loaded buffers" })

-- Navigate easier around buffers while using the "leader" key
map("n", "<leader>bn", "<CMD>bnext<CR>", { desc = "Change to the next buffer" })
map("n", "<leader>bp", "<CMD>bprevious<CR>", { desc = "Change to the previous buffer" })

-- Visually list in Telescope all the currently registered marks on the current buffer
map("n", "<leader>m", telescope.marks, { desc = "List all Vim marks registered on the current buffer" })

-- List all the registers available on the buffer
map("n", "<leader>r", telescope.registers, { desc = "Show the contents of the registers", icon = "󱥊" })

-- Open Telescope to fuzzy search through the help docs
map("n", "<leader>h", telescope.help_tags, { desc = "Open the help tags menu" })

-- Grep through the contents of the current directory for a particular string pattern
map("n", "<leader>lg", telescope.live_grep, { desc = "Perform a grep on the file contents of the current directory" })

-- Open a Terminal inside Neovim itself
map("n", "<leader>t", "<CMD>split term://zsh<CR>", { desc = "Open the terminal prompt" })
