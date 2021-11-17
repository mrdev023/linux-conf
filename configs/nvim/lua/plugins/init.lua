function configure_packages()
    call_with_helpers(require('plugins.lspconfig').init)
    call_with_helpers(require('plugins.compe').init)
    call_with_helpers(require('plugins.nvim-tree').init)
    call_with_helpers(require('plugins.nvim-treesitter').init)
    call_with_helpers(require('plugins.nvim-web-devicons').init)
    call_with_helpers(require('plugins.nvim-autopairs').init)
    call_with_helpers(require('plugins.nvim-notify').init)
    call_with_helpers(require('plugins.nvim-hlslens').init)
    call_with_helpers(require('plugins.nvim-flutter-tools').init)
    call_with_helpers(require('plugins.nvim-fterm').init)
    call_with_helpers(require('plugins.nvim-feline').init)
    call_with_helpers(require('plugins.nvim-todo-comments').init)
    call_with_helpers(require('plugins.nvim-lightspeed').init)
    call_with_helpers(require('plugins.nvim-numb').init)
    call_with_helpers(require('plugins.nvim-neoscroll').init)
    call_with_helpers(require('plugins.nvim-lspkind').init)
    call_with_helpers(require('plugins.nvim-signature').init)
    call_with_helpers(require('plugins.nvim-gutentags').init)
    call_with_helpers(require('plugins.nvim-indent-blankline').init)
    call_with_helpers(require('plugins.nvim-editorconfig').init)
    call_with_helpers(require('plugins.nvim-ctrlsf').init)
end

function install_packages()
    -- Packer can manage itself as an optional plugin
    use 'wbthomason/packer.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'onsails/lspkind-nvim'
    use 'kabouzeid/nvim-lspinstall'

    -- Autocomplete
    use 'hrsh7th/nvim-compe'
    use 'SirVer/ultisnips'
    use 'honza/vim-snippets'
    use 'windwp/nvim-autopairs'
    use 'AndrewRadev/tagalong.vim'
    use 'andymass/vim-matchup'    

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'p00f/nvim-ts-rainbow'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use 'romgrk/nvim-treesitter-context'

    -- Syntax
    use 'moll/vim-node'
    -- use 'zinit-zsh/zplugin-vim-syntax' -- NOT WORKING
    use 'editorconfig/editorconfig-vim'
    use 'chrisbra/csv.vim'
    use 'npxbr/glow.nvim'
    use 'junegunn/vim-easy-align'

    -- Icons
    use 'kyazdani42/nvim-web-devicons'
    use 'ryanoasis/vim-devicons'

    -- Status Line and Bufferline
    use 'famiu/feline.nvim'             -- A minimal, stylish and customizable statusline for Neovim written in Lua
    use 'romgrk/barbar.nvim'            -- Tabs, as understood by any other editor.

    -- Telescope project search
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use 'nvim-telescope/telescope-project.nvim'
    use 'fhill2/telescope-ultisnips.nvim'

    -- Explorer
    use 'kyazdani42/nvim-tree.lua'

    -- Git
    use 'kdheepak/lazygit.nvim'

    -- Flutter
    use 'akinsho/flutter-tools.nvim'

    -- Move & Search & replace
    use 'windwp/nvim-spectre'
    use 'nacro90/numb.nvim'
    use 'dyng/ctrlsf.vim'
    use 'kevinhwang91/nvim-hlslens'     -- nvim-hlslens helps you better glance at matched information, seamlessly jump between matched instances.
    use 'ggandor/lightspeed.nvim'
    use 'kshenoy/vim-signature'
    use 'karb94/neoscroll.nvim'
    use 'dstein64/nvim-scrollview'
    use 'chaoren/vim-wordmotion'

    -- Tim Pope docet
    use 'tpope/vim-sensible'
    use 'tpope/vim-rails'
    use 'tpope/vim-abolish'
    use 'tpope/vim-surround'
    use 'tpope/vim-bundler'
    use 'tpope/vim-capslock'
    use 'tpope/vim-repeat'
    use 'tpope/vim-endwise'             -- auto complete block with end
    use 'tpope/vim-rvm'
    use 'tpope/vim-dispatch'
    use 'tpope/vim-dadbod'
    use 'tpope/vim-jdaddy'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-commentary'

    -- Tmux
    use 'christoomey/vim-tmux-navigator'

    -- Colorschema
    use 'dracula/vim'
    use 'whatyouhide/vim-gotham'
    use 'shaunsingh/moonlight.nvim'

    -- Tags
    use 'ludovicchabant/vim-gutentags'

    -- General Plugins
    use 'github/copilot'                -- Copilot is a vim plugin that helps you to create your own vim plugins.
    use 'rcarriga/nvim-notify'          -- fancy notification
    use 'mfussenegger/nvim-dap'         -- debugger
    use 'numtostr/FTerm.nvim'           -- Floating terminal
    use 'folke/todo-comments.nvim'
    use 'lambdalisue/suda.vim'
    use 'mhinz/vim-startify'            -- The fancy start screen for Vim.
end

function init()
    local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
        cmd 'packadd packer.nvim'
    end

    cmd 'packadd packer.nvim'

    require('packer').startup(install_packages)

    call_with_helpers(configure_packages)
end

return {
    init = init
}
