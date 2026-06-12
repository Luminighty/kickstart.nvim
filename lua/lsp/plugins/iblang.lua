vim.filetype.add {
  extension = {
    ib = 'iblang',
  },
}

vim.lsp.config('iblang-lsp', {
  cmd = { '/home/luminight/projects/iblang-selfhost/bin/ib', 'lsp' },
  filetypes = { 'iblang' },
  root_dir = function(bufnr, on_dir)
    local root = vim.fs.root(bufnr, { '.git', 'project.config' })
    if root then
      on_dir(root)
    end
  end,
})

vim.lsp.enable 'iblang-lsp'
