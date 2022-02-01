local function init()
    require'lspconfig'.sorbet.setup{}
end

return {
    init = init
}
