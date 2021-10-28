local function init()
  cmd('set tags+=tags,.git/tags')
  g.gutentags_enabled = 1
  g.gutentags_generate_on_missing = 1
  g.gutentags_generate_on_write = 1
  g.gutentags_resolve_symlinks = 1
  g.gutentags_ctags_tagfile = '.git/tags'
  g.gutentags_project_root = { '.git' }
  g.gutentags_ctags_extra_args = { '--fields=+l' }
  g.gutentags_add_default_project_roots = 0
  g.gutentags_ctags_executable_ruby = 'ripper-tags'
  g.gutentags_ctags_extra_args = { '--ignore-unsupported-options', '--recursive' }
end

return {
  init = init
}