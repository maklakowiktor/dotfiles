local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close
      }
    },
    vimgrep_arguments = {
       "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--regexp"
    },
  },
}
