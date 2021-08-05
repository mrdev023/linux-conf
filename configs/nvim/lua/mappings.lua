local function init()
    -- command! LogPath :lua print(vim.inspect(vim.lsp.get_log_path()))

    -------------------- Telescope -----------------------------
    map('n', '<space>ff', '<cmd>Telescope find_files<CR>')
    map('n', '<space>fg', '<cmd>Telescope live_grep<CR>')
    map('n', '<space>fb', '<cmd>Telescope buffers<CR>')
    map('n', '<space>fh', '<cmd>Telescope help_tags<CR>')
    map('n', '<space>ps', [[<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For >")})<CR>]])

    -------------------- NvimTreeToggle ------------------------
    map('n', '<space>tt', '<cmd>NvimTreeToggle<CR>')
    map('n', '<space>tr', '<cmd>NvimTreeRefresh<CR>')

    -------------------- LSP -----------------------------------
    map('n', '<space>,', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
    map('n', '<space>;', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
    map('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>')
    map('n', '<space>d', '<cmd>lua vim.lsp.buf.definition()<CR>')
    map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
    map('n', '<space>h', '<cmd>lua vim.lsp.buf.hover()<CR>')
    map('n', '<space>m', '<cmd>lua vim.lsp.buf.rename()<CR>')
    map('n', '<space>r', '<cmd>lua vim.lsp.buf.references()<CR>')
    map('n', '<space>s', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')

    -------------------- HlsLens -------------------------------
    map('n', 'n', "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>")
    map('n', 'N', "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>")
    map('n', '*', "*<Cmd>lua require('hlslens').start()<CR>")
    map('n', '#', "#<Cmd>lua require('hlslens').start()<CR>")
    map('n', 'g*', "g*<Cmd>lua require('hlslens').start()<CR>")
    map('n', 'g#', "g#<Cmd>lua require('hlslens').start()<CR>")

    -------------------- LAZYGIT -------------------------------
    -- Install docs : https://github.com/jesseduffield/lazygit
    map('n', '<space>lg', '<cmd>LazyGit<CR>')

    -------------------- COMMANDS ------------------------------
    cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'  -- disabled in visual mode
end

return {
    init = init
}