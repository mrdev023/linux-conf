local dap = require('dap')

local function init()
  dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb-vscode',
    name = 'lldb'
  }
  dap.configurations.cpp = {
    {
      name = "Launch",
      type = "lldb",
      request = "launch",
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = '${workspaceFolder}',
      stopOnEntry = false,
      args = {},
      runInTerminal = false,
    },
  }
  dap.configurations.c = dap.configurations.cpp
  dap.configurations.rust = dap.configurations.cpp
end

return {
  init = init
}