local function init()
  call_with_helpers(require('plugins.dap.lldb').init)
end

return {
  init = init
}