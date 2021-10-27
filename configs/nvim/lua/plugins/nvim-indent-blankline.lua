local function init()
  g.indent_blankline_show_current_context = true
  g.indent_blankline_buftype_exclude = {'terminal'}
  g.indent_blankline_filetype_exclude = {'help', 'startify', 'dashboard', 'packer', 'neogitstatus', 'NvimTree'}
  g.indent_blankline_char = '▏'
  g.indent_blankline_use_treesitter = true
  g.indent_blankline_show_trailing_blankline_indent = false
end

return {
  init = init
}