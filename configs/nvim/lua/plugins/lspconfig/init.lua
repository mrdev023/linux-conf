local function init()
    call_with_helpers(require('plugins.lspconfig.lua').init)
    call_with_helpers(require('plugins.lspconfig.rust').init)
    call_with_helpers(require('plugins.lspconfig.typescript').init)
    call_with_helpers(require('plugins.lspconfig.ruby').init)
    call_with_helpers(require('plugins.lspconfig.php').init)
end

return {
    init = init
}