local function init()
    require'nvim-treesitter.configs'.setup {
        ensure_installed = "all",  -- list of languages 
        highlight = {
            enable = true,              
        },
        rainbow = {
            enable = true,
            extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
        }
    }
end

return {
    init = init
}