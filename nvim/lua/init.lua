-- Load Packer
vim.cmd [[packadd packer.nvim]]

-- nvim-tree
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

function vim_enter()
  require('keymaps')
end
vim.cmd('autocmd VimEnter * lua vim_enter()')

return require('packer').startup(function(use)
  -- packer can manage itself
  use {'wbthomason/packer.nvim', otp = true }

  use {'nvim-tree/nvim-web-devicons'}
  use {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require('nvim-tree-config')
    end
  }

end)

