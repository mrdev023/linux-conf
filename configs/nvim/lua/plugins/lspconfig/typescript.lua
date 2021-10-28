local function init()
    require'lspconfig'.tsserver.setup{}
end

return {
    init = init
}