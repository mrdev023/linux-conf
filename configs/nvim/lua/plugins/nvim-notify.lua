local function init()
    vim.notify = require("notify")
end

return {
    init = init
}