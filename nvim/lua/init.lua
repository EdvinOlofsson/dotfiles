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

vim.cmd [[packadd packer.nvim]]

require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 60,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

return require('packer').startup(function(use)
    -- packer can manage itself
    use {'wbthomason/packer.nvim', otp = true }

    use {'nvim-tree/nvim-web-devicons'}
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
end)
