-- vim.keymap.set('n', '<C-t>', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })

function toggle_nvimtree_and_find_file()
  if not vim.api.nvim_buf_is_loaded(0) then
    return
  end

  local buftype = vim.api.nvim_buf_get_option(0, 'buftype')
  if buftype ~= '' and buftype ~= 'nofile' then
    return
  end

  if require'nvim-tree.view'.is_visible() then
    vim.cmd('NvimTreeToggle')
  else
    vim.cmd('NvimTreeFindFile')
  end
end
local api = require "nvim-tree.api"
local function opts(desc)
  return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
end
-- add your mappings
vim.keymap.set('n', '<leader>t',   '<cmd>lua toggle_nvimtree_and_find_file()<CR>', opts('Toggle'))
vim.keymap.set('n', '?',       api.tree.toggle_help,                opts('Help'))
