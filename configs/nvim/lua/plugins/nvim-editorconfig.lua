local function init()
  g.EditorConfig_exclude_patterns = { 'fugitive://.*', 'scp://.*' }
end

return {
  init = init
}