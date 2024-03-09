-- vim.api.nvim_set_keymap('n', '<C-t>', ':NvimTreeToggle<CR>:NvimTreeFindFile<CR>', { noremap = true, silent = tru-- Define a function to toggle the nvimtree and find the file
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

-- Define the keymap to toggle the nvimtree or find the file
vim.api.nvim_set_keymap('n', '<C-t>', '<cmd>lua toggle_nvimtree_and_find_file()<CR>', { noremap = true, silent = true })
