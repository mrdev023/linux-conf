local function init()
  require'lspconfig'.dartls.setup{}
end

return {
  init = init
}