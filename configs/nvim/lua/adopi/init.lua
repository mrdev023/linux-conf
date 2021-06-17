local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
		execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]


require('packer').startup(function()
		-- Packer can manage itself
		use 'wbthomason/packer.nvim'

		use {'dracula/vim'}
		use {'whatyouhide/vim-gotham'}
		use {'neovim/nvim-lspconfig'}
		use {'hrsh7th/nvim-compe'}
		use {'shaunsingh/moonlight.nvim'}

        -- Telescope project search
        use {
            'nvim-telescope/telescope.nvim',
            requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
        }

        use {'nvim-treesitter/nvim-treesitter'}

end)


vim.cmd('colorscheme moonlight')

-- Setup LSP servers
local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

require'lspconfig'.sumneko_lua.setup{
		cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
		settings = {
				Lua = {
						runtime = {
								-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
								version = 'LuaJIT',
								-- Setup your lua path
								path = vim.split(package.path, ';'),
						},
						diagnostics = {
								-- Get the language server to recognize the `vim` global
								globals = {'vim'},
						},
						workspace = {
								-- Make the server aware of Neovim runtime files
								library = {
										[vim.fn.expand('$VIMRUNTIME/lua')] = true,
										[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
								},
						},
						-- Do not send telemetry data containing a randomized but unique identifier
						telemetry = {
								enable = false,
						},
				},
		},
}


require'lspconfig'.rls.setup {
  settings = {
    rust = {
      unstable_features = true,
      build_on_save = false,
      all_features = true,
    },
  },
}

require'lspconfig'.tsserver.setup{}

require'lspconfig'.pyls.setup{}

vim.o.completeopt = "menuone,noselect"
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
  };
}



require'lspconfig'.solargraph.setup{}
--require'lspconfig'.sorbet.setup{}


--nvim treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",  -- list of languages 
  highlight = {
    enable = true,              
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
  }
}
