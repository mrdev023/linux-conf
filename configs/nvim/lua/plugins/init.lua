function configure_packages()
    call_with_helpers(require('plugins.lspconfig').init)
    call_with_helpers(require('plugins.compe').init)
    call_with_helpers(require('plugins.nvim-treesitter').init)
    call_with_helpers(require('plugins.web-devicons').init)
end

function install_packages()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
        
    use {'dracula/vim'}
    use {'whatyouhide/vim-gotham'}
    use {'neovim/nvim-lspconfig'}
    use {'kabouzeid/nvim-lspinstall'}
    use {'hrsh7th/nvim-compe'}
    use {'shaunsingh/moonlight.nvim'}

    -- Telescope project search
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }

    use {'nvim-treesitter/nvim-treesitter'}

    use 'kyazdani42/nvim-web-devicons' -- removing this line doesn't change the error
    use 'kyazdani42/nvim-tree.lua'
    use 'kdheepak/lazygit.nvim'
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