set relativenumber
set termguicolors     " enable true colors support
set cursorline
set scrolloff=8
set showmatch
set splitbelow
set splitright

call plug#begin()
Plug 'mhinz/vim-startify'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'ayu-theme/ayu-vim'
Plug 'airblade/vim-gitgutter'
Plug 'lervag/vimtex'
Plug 'neovim/nvim-lspconfig'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'rhysd/vim-clang-format'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'dense-analysis/ale'
Plug 'vim-autoformat/vim-autoformat'
call plug#end()

lua << END
require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {},
}
require('lspconfig')['clangd'].setup({})
require'colorizer'.setup()
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  sync_install = true,
  auto_install = true,
  ignore_install = { "javascript" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
END

let ayucolor="mirage"
colorscheme ayu

filetype plugin indent on

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
syntax enable

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'zathura'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = ","

let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+,\.aux$,\._aux$,\.bbl$,\.bcf$,\.blg$,\.fdb_latexmk$,\.fls$,\.out$,\.run.xml$,\.synctex.gz$,\.tex.project.vim$,\.toc$'
let g:netrw_localcopydircmd = 'cp -r'
let g:netrw_banner = 0
let g:netrw_keepdir = 0

nnoremap <SPACE> <Nop>
let mapleader = ","
nnoremap <leader>ff :CtrlP<CR>
nnoremap <leader>ft :Texplore %:p:h<CR>
nnoremap <leader>fd :Explore<CR>
nnoremap <leader>fce :tabnew /home/mifrandir/.config/nvim/init.vim<CR>
nnoremap <leader>fcr :source /home/mifrandir/.config/nvim/init.vim<CR>
nnoremap <leader>en :cn<CR>
nnoremap <leader>tt :term<CR>
nnoremap <leader>cf :<C-u>ClangFormat<CR>

set tabstop=2
set shiftwidth=2
set expandtab
set colorcolumn=90
highlight ColorColumn ctermbg=darkgray
let g:cpp_function_highlight = 1
let g:cpp_attributes_highlight = 1
let g:cpp_member_highlight = 1
let g:cpp_simple_highlight = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
au BufWinEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
au BufWinLeave * call clearmatches()
set noinfercase

set completeopt-=preview
set completeopt+=menuone,noselect
let g:clang_library_path = '/usr/local/opt/llvm/lib/libclang.dylib'
let g:clang_user_options = '-std=c++20'
let g:clang_complete_auto = 1
let g:mucomplete#enable_auto_at_startup = 1

let g:cpp_function_highlight = 1
let g:cpp_attributes_highlight = 1
let g:cpp_member_highlight = 1
let g:cpp_simple_highlight = 1
let g:clang_library_path='/lib64/libclang.so'


let g:opamshare = substitute(system('opam var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"


let g:syntastic_ocaml_checkers = ['merlin']

au BufWrite * :Autoformat
