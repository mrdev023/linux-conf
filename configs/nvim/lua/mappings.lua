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
    map('n', '<space>tf', '<cmd>NvimTreeFocus<CR>')

    -------------------- Github Copilot ------------------------
    map('n', '<space>gd', '<cmd>Copilot disable<CR>')
    map('n', '<space>ge', '<cmd>Copilot enable<CR>')
    map('n', '<space>gi', '<cmd>Copilot setup<CR>')
    
    -------------------- BarBar --------------------------------
    -- Move to previous/next
    map('n', '<A-,>', ':BufferPrevious<CR>', opts)
    map('n', '<A-.>', ':BufferNext<CR>', opts)
    -- Re-order to previous/next
    map('n', '<A-<>', ':BufferMovePrevious<CR>', opts)
    map('n', '<A->>', ':BufferMoveNext<CR>', opts)
    -- Close buffer
    map('n', '<A-c>', ':BufferClose<CR>', opts)

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
    map('n', '<leader>T', '<cmd>lua require\'lsp_extensions\'.inlay_hints()<CR>')

    -------------------- HlsLens -------------------------------
    map('n', 'n', "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>")
    map('n', 'N', "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>")
    map('n', '*', "*<Cmd>lua require('hlslens').start()<CR>")
    map('n', '#', "#<Cmd>lua require('hlslens').start()<CR>")
    map('n', 'g*', "g*<Cmd>lua require('hlslens').start()<CR>")
    map('n', 'g#', "g#<Cmd>lua require('hlslens').start()<CR>")

    -------------------- DAP -----------------------------------
    map('n', '<A-b>', '<cmd>lua require\'dap\'.toggle_breakpoint()<CR>', opts)
    map('n', '<A-v>', '<cmd>lua require\'dap\'.set_breakpoint(vim.fn.input(\'Breakpoint condition: \'))<CR>', opts)
    map('n', '<A-n>', '<cmd>lua require\'dap\'.continue()<CR>', opts)
    map('n', '<A-o>', '<cmd>lua require\'dap\'.repl.toggle()<CR>', opts)

    -------------------- FTerm ---------------------------------
    map('n', '<F3>', '<CMD>lua require("FTerm").toggle()<CR>')
    map('t', '<F3>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

    -------------------- LAZYGIT -------------------------------
    -- Install docs : https://github.com/jesseduffield/lazygit
    map('n', '<F2>', '<cmd>LazyGit<CR>')

    -------------------- OTHER ---------------------------------
    map('i', '<Esc>', '<Esc>:w<CR>')
    map('n', '<Esc>', '<Esc>:w<CR>')

    -------------------- COMMANDS ------------------------------
    cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'  -- disabled in visual mode
end

return {
    init = init
}
