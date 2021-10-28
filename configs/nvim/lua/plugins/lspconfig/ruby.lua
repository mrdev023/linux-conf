local function init()
    require'lspconfig'.solargraph.setup{}
end

return {
    init = init
}