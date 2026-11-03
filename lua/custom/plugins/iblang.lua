
vim.filetype.add({
  extension = {
    ib = "iblang",
    iblang = "iblang"
  }
})

vim.treesitter.language.register('iblang', { 'iblang', 'ib' })

vim.api.nvim_create_autocmd('User', {
  pattern = 'TSUpdate',
  callback = function()
    require('nvim-treesitter.parsers').iblang = {
      install_info = {
        url = 'https://github.com/Luminighty/tree-sitter-iblang',
        -- revision = <sha>, -- commit hash for revision to check out; HEAD if missing
        -- optional entries:
        generate = true, -- only needed if repo does not contain pre-generated `src/parser.c`
        generate_from_json = false, -- only needed if repo does not contain `src/grammar.json` either
        queries = 'queries', -- also install queries from given directory
      },
      filetypes = {'iblang'}
    }
  end
})

vim.lsp.config['iblang-lsp'] = {
  cmd = {"/home/luminight/projects/iblang-selfhost/bin/ib", "lsp"},
  filetypes = { "iblang" },
  root_markers = { {'.nvimrc.lua'}, '.git' }
}

vim.lsp.enable('iblang-lsp')

vim.api.nvim_create_autocmd("FileType", {
  pattern = "iblang",
  callback = function()
    vim.bo.commentstring = '// %s'
  end,
})
