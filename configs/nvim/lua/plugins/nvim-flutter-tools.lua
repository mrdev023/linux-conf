local function init()
  require('flutter-tools').setup {
    decorations = {
      statusline = {
        app_version = true,
        device = true
      }
    },
    fvm = true
  }
end

return {
  init = init
}
