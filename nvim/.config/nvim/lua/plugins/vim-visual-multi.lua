return {
  'mg979/vim-visual-multi',
  branch = 'master',
  config = function()
    -- Disable default mappings
    vim.g.VM_default_mappings = 0

    -- Custom keybindings for Shift+j and Shift+k
    vim.api.nvim_set_keymap('n', 'J', '<Plug>(VM-Find-Under)', { noremap = false, silent = true })
    vim.api.nvim_set_keymap('x', 'J', '<Plug>(VM-Find-Under)', { noremap = false, silent = true })
    vim.api.nvim_set_keymap('n', 'K', '<Plug>(VM-Remove-Cursor)', { noremap = false, silent = true })
  end
}

