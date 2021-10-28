local function init()
    require'lspconfig'.phpactor.setup{}
end

return {
    init = init
}