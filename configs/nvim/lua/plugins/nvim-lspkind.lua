local function init()
  require('lspkind').init {
    with_text = true,
  }
end

return {
  init = init
}