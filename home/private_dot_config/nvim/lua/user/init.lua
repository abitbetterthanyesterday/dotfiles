local config = {
  -- When using kitty, set the padding/margin
  vim.cmd [[
  augroup kitty_mp
      autocmd!
      au VimLeave * :silent !kitty @ set-spacing padding=5 margin=2
      au VimEnter * :silent !kitty @ set-spacing padding=0 margin=0
  augroup END
  ]]
}

return config
