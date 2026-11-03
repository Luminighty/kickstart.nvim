local group = vim.api.nvim_create_augroup("LocalProjectConfig", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  group = group,
  callback = function()
    local project_config = vim.fn.getcwd() .. "/.nvimrc.lua"
    if vim.fn.filereadable(project_config) == 1 then
      pcall(dofile, project_config)
    end
  end,
})
