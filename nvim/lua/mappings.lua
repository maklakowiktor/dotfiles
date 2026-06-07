require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set
local fn = vim.fn
local opts = { noremap = true, silent = true }

local function get_parent_dir()
  return fn.fnamemodify(fn.expand("%:p"), ":h:h")
end

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- errors search 
map("n", "<F4>", ":1000cp<CR>zvzz:cc<CR>")
map("n", "<F5>", ":cprev<CR>")
map("n", "<F6>", ":cnext<CR>")

-- launch Make
map("n", "<F7>", ":wa | make all<CR>")
map("n", "<F8>", ":make run<CR>")
map("n", "<F9>", function()
  local parent_dir = get_parent_dir()
  vim.cmd("make build DIR='" .. fn.fnameescape(parent_dir) .. "'")
end, { silent = true })
map("n", "<F10>", function()
  local parent_dir = get_parent_dir()
  vim.cmd("make run DIR='" .. fn.fnameescape(parent_dir) .. "'")
end, { silent = true })

-- moving lines
-- normal mode:  Alt+j / Alt+k
map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)

-- insert mode: Alt+j / Alt+k
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- visual mode: moving selected lines Alt+j / Alt+k
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)


-- open floating window for diagnotic messages: errors & warnings
map("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>")


-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
