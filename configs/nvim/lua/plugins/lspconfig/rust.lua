local function init()
    require'lspconfig'.rls.setup {
        settings = {
            rust = {
                unstable_features = true,
                build_on_save = false,
                all_features = true,
            },
        },
    }
end

return {
    init = init
}