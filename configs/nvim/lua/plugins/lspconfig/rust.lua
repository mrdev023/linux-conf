local function init()
    require'lspconfig'.rust_analyzer.setup{}
end

return {
    init = init
}