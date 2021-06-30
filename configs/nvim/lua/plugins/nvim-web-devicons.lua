local function init()
    require'nvim-web-devicons'.setup {
        -- globally enable default icons (default to false)
        -- will get overriden by `get_icons` option
        default = true;
    }
    require'nvim-web-devicons'.get_icons()
end

return {
    init = init
}