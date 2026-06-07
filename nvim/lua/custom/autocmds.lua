local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
  -- pattern = {"*.f90", "*.F90", "*.f", "*.F"},
  pattern = "fortran",
  callback = function()
    -- print(string.format('event fired: %s', vim.inspect(ev)))
    vim.opt_local.formatprg = "fprettify --silent"
  end,
})

autocmd("BufWritePost", {
  pattern = {"*.f90", "*.F90", "*.f", "*.F"},
  command = "silent !fprettify --silent %",
  -- callback = function(ev)
  --   -- vim.cmd('echo "Installing `mini.nvim`" | redraw')
  --   -- print(string.format('event fired: %s', vim.inspect(ev)))
  --   vim.cmd("silent !fprettify --silent %")
  --   print(string.format('file has been formatted: %s', ev.file))
  -- end,
})
