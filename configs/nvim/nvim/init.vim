" auto toggle relativenumber
set number! relativenumber!
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Tab options
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set signcolumn=yes

set noerrorbells

set nobackup
set nowrap
set undodir=~/.vim/undodir
set undofile

set updatetime=500

let mapleader = " "

lua require("matcha")

" smartsearch 
set smartcase ignorecase
set incsearch

" toggle nu column
augroup vimrc-incsearch-highlight
	autocmd!
	autocmd CmdlineEnter /,\? :set hlsearch
	autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

" start custom RPC server ( for Twitch )
command! Twitchbotstart :call serverstart('/tmp/nvimbot')

" is it a bug? Ask to neovim community
command! Twitchbotstop :call serverstop('/tmp/nvimbot')


nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For >")})<cr>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


