local cmd = vim.cmd                     -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn                       -- to call Vim functions e.g. fn.bufnr()
local g = vim.g                         -- a table to access global variables
local opt = vim.opt                     -- to set options

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end

local function call_with_helpers(user_func)
    setfenv(user_func,
        vim.tbl_extend('force', getfenv(), get_helpers()))
    local status, err = pcall(user_func)
    if not status then
      print('Failure running setup function: ' .. vim.inspect(err))
    else
        return status
    end
end

function get_helpers()
    return {
        map = map,
        cmd = cmd,
        fn = fn,
        g = g,
        opt = opt,
        dump = dump,
        call_with_helpers = call_with_helpers,
    }
end

return get_helpers()