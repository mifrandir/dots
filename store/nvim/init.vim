set relativenumber
set termguicolors
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
Plug 'dense-analysis/ale'
Plug 'vim-autoformat/vim-autoformat'
Plug 'preservim/nerdtree'
Plug 'sirver/ultisnips'
Plug 'Xuyuanp/nerdtree-git-plugin'
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

syntax enable

nnoremap <SPACE> <Nop>
let mapleader = " "
let maplocalleader = " "

" file navigation

let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+,\.aux$,\._aux$,\.bbl$,\.bcf$,\.blg$,\.fdb_latexmk$,\.fls$,\.out$,\.run.xml$,\.synctex.gz$,\.tex.project.vim$,\.toc$'
let g:netrw_localcopydircmd = 'cp -r'
let g:netrw_banner = 0
let g:netrw_keepdir = 0

let g:NERDTreeIgnore=[ '\(^\|\s\s\)\zs\.\S\+', '\.o$','\~$', '\.aux$','\._aux$','\.bbl$','\.bcf$','\.blg$','\.fdb_latexmk$','\.fls$','\.out$','\.run.xml$','\.synctex.gz$','\.tex.project.vim$','\.toc$','\.log$','_minted']
let g:NERDTreeGitStatusIndicatorMapCustom = {
      \ 'Modified'  : 'M',
      \ 'Staged'    : 'S',
      \ 'Untracked' : '*',
      \ 'Renamed'   : 'R',
      \ 'Unmerged'  : 'U',
      \ 'Deleted'   : '!',
      \ 'Dirty'     : 'D',
      \ 'Clean'     : 'C',
      \ 'Ignored'   : 'I',
      \ 'Unknown'   : '?'
      \ }

let NERDTreeShowBookmarks=1

" navigation and buffers

set splitbelow
set splitright

nnoremap <leader>ff :CtrlP<CR>
nnoremap <leader>fd :Explore<CR>
nnoremap <leader>ce :tabnew /home/mifrandir/.config/nvim/init.vim<CR>
nnoremap <leader>cr :source /home/mifrandir/.config/nvim/init.vim<CR>
nnoremap <leader>se :UltiSnipsEdit<CR>
nnoremap <leader>en :cn<CR>
nnoremap <leader>tt :tab term<CR>
tnoremap <Esc> <C-\><C-n>
nnoremap <leader>cf :<C-u>ClangFormat<CR>
nnoremap <C-w>/ :vsplit<CR>
nnoremap <C-w>- :split<CR>
nnoremap <C-w>q :q<CR>
nnoremap <leader>zz :qa!<CR>
nnoremap <leader>ft :NERDTreeToggle<CR>

" colours

set tabstop=2
set shiftwidth=2
set expandtab
set colorcolumn=90
highlight ColorColumn ctermbg=darkgray

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
au BufWinEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
au BufWinLeave * call clearmatches()
set noinfercase

" C++

let g:cpp_function_highlight = 1
let g:cpp_attributes_highlight = 1
let g:cpp_member_highlight = 1
let g:cpp_simple_highlight = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

set completeopt+=preview
set completeopt+=menuone,noselect
let g:clang_library_path = '/usr/local/opt/llvm/lib/libclang.dylib'
let g:clang_user_options = '-std=c++20'
let g:clang_complete_auto = 1

let g:cpp_function_highlight = 1
let g:cpp_attributes_highlight = 1
let g:cpp_member_highlight = 1
let g:cpp_simple_highlight = 1
let g:clang_library_path='/lib64/libclang.so'

" OCaml

let g:opamshare = substitute(system('opam var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
let g:syntastic_ocaml_checkers = ['merlin']

" LaTeX

let g:vimtex_view_method = 'zathura'

let g:vimtex_compiler_latexmk = {
      \ 'build_dir' : '',
      \ 'callback' : 1,
      \ 'continuous' : 1,
      \ 'executable' : 'latexmk',
      \ 'hooks' : [],
      \ 'options' : [
        \   '-lualatex',
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \   '-shell-escape',
        \ ],
        \}

let g:vimtex_compiler_latexmk_engines = {
      \ '_'                : '-xelatex',
      \ 'pdflatex'         : '-pdf',
      \ 'dvipdfex'         : '-pdfdvi',
      \ 'lualatex'         : '-lualatex',
      \ 'xelatex'          : '-xelatex',
      \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
      \ 'context (luatex)' : '-pdf -pdflatex=context',
      \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
      \}

let g:vimtex_compiler_method = 'latexmk'

" formatting

au BufWrite * :Autoformat
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

" snippets

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']
let g:UltiSnipsEditSplit="vertical"

let g:python3_host_prog="/usr/bin/python3"
