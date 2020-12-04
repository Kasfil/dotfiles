call plug#begin('~/.config/nvim/plugged')
" Productivity
Plug 'lambdalisue/gina.vim'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'svermeulen/vimpeccable'
" Visual Helper
Plug 'yggdroot/indentline'
Plug 'mhinz/vim-signify'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'w0rp/ale'
Plug 'voldikss/vim-floaterm'
Plug 'sheerun/vim-polyglot'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
" php filetype helper
Plug 'captbaritone/better-indent-support-for-php-with-html', { 'for': 'php' }
" js/ts filetype helper
Plug 'pangloss/vim-javascript', {'for': ['javascript', 'javascript.jsx', 'typescript']}
Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
" Misc plugins
Plug 'embear/vim-localvimrc'
Plug 'bronson/vim-trailing-whitespace'
Plug 'farmergreg/vim-lastplace'
Plug 'rbgrouleff/bclose.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'sainnhe/sonokai'
call plug#end()

let mapleader=","                         " - use , as map leader
set background=dark                       " - set background to dark
set termguicolors                         " - use gui colors instead of tui
set number                                " - show current line number
set relativenumber                        " - show relative number from active line
set hidden                                " - hidden buffer
set expandtab                             " - use space instead of tab
set tabstop=4                             " - 4 spaces count
set shiftwidth=4                          " - 4 spaces indent
set ignorecase                            " - ignore case when all is lowercased
set smartcase                             " - follow case when some char is uppercased
set hlsearch                              " - highlight search result
set incsearch                             " - highlight while typing
" set nowrapscan                            " - don't wrap search result
set wildignore=*.o,*~,*.pyc               " - ignore some file
set wildignore+=*/.git/*,*/.hg/*          " - ignore some dirs
set wildignore+=*/.svn/*,*/.DS_Store      " - ignore some dirs
set scrolloff=5                           " - 5 line from top and bottom window edge
set sidescrolloff=5                       " - 5 line from left and right window edge
set cmdheight=2                           " - 2 lines command height
set fillchars+=vert:\║,eob:\              " - Various char in window
set lazyredraw                            " - don't redraw until it should be
set showmatch                             " - highlight match brackets, parenteses
set matchtime=2                           " - 2 second matchtime
set timeoutlen=500                        " - 500 ms to complete map sequence
set foldmethod=indent                     " - folding method
set foldlevel=7                           " - higher level than value will be folded
set nowritebackup                         " - don't write backup
set noswapfile                            " - don't use swapfile for buffers
set updatetime=250                        " - update time from swap to disk
set autoindent
set cindent
set smartindent
set linebreak                             " - wrap line at character set in 'breakat'
set noshowmode                            " - hide mode
set shortmess+=c                          " - avoid hit-enter prompts
set completeopt=menuone,noinsert,noselect " - for better completion support
set splitright                            " - new vertical split window right
set splitbelow                            " - new horizontal split window bottom
set formatoptions-=a                      " - no auto formating
set formatoptions-=t                      " - don't auto format my code
set formatoptions-=o                      " - new line not for comment
set formatoptions+=crqwjp
set cursorline                            " - highlight cursor line position
" for neovim >= 0.4
if has('nvim-0.4')
    set pumblend=20                       " - Floating transparent level
endif
au FocusGained,BufEnter * :checktime      " - autoread event listener
syntax on                                 " - enable syntax
filetype plugin on                        " - enable filetype autocommand
filetype indent on                        " - enable filetype autocommand

" ====================
" ===== CoC.nvim =====
" ====================
inoremap <silent><expr> <TAB>
\   pumvisible() ? "\<C-n>" :
\   <SID>check_back_space() ? "\<TAB>" :
\   coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.3 or vim >= 8.2.0750
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call CocAction('runCommand', 'editor.action.organizeImport')

" ===========================
" ===== Palenight Theme =====
" ===========================
let g:palenight_terminal_italics=1

" =======================
" ===== easy-motion =====
" =======================
let g:EasyMotion_do_mapping = 0 " disable easymotion default mapping
let g:EasyMotion_smartcase = 1  " enable case-insensitive feature
nmap mf <Plug>(easymotion-overwin-f2)
" line easy-motion
map f <Plug>(easymotion-j)
map ml <Plug>(easymotion-k)

" ===================
" ===== Airline =====
" ===================
let g:airline_theme='sonokai'

" =========================
" ===== NerdCommenter =====
" =========================
let g:NERDSpaceDelims = 1

" ===================
" ===== Gruvbit =====
" ===================
"" Enable italic in comment
augroup colorscheme_change | au!
    au ColorScheme gruvbit hi Comment gui=italic cterm=italic
augroup END

" ================
" ===== Ale ======
" ================
nnoremap <leader>df <plug>(ale_first)<CR>
nnoremap <leader>dl <plug>(ale_last)<CR>
nnoremap <leader>dn <plug>(ale_next)<CR>
nnoremap <leader>dp <plug>(ale_previous)<CR>
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = '  '
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['pylint'],
\   'php': ['phpcs'],
\   'rust': ['rustc'],
\ }
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'php': ['phpcbf'],
\   'rust': ['rustfmt'],
\   'html': ['prettier'],
\ }

" ====================
" ===== floaterm =====
" ====================
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F12>'
" floaterm layout
let g:floaterm_width = 0.9
let g:floaterm_height = 0.8
let g:floaterm_autoclose = 1
" floaterm as wrapper
"" Ranger wrapper
nmap <silent> <leader>nn :FloatermNew ranger<CR>
nmap <silent> <leader>gg :FloatermNew --height=0.9 --width=0.9 lazygit<CR>

" ===================
" ===== fzf.vim =====
" ===================
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 }}
let g:fzf_colors = { 'border': ['fg', 'keyword']}

nmap <silent> <leader>ff :Files<cr>
nmap <silent> <leader>bb :Buffers<cr>

" ======================
" ===== localvimrc =====
" ======================
let g:localvimrc_name = ['.vim/lvimrc']

" ===== Sonokai =====
let g:sonokai_style = 'atlantis'
let g:sonokai_enable_italic = 1

" ======================
" ===== Hexokinase =====
" ======================

" disable some pairs according filetype for coc-pairs
autocmd FileType php let b:coc_pairs_disabled = ['<']
autocmd FileType vim let b:coc_pairs_disabled = ['"']

" ===== vim-javascript =====
let g:javascript_plugin_jsdoc = 1

nmap <leader>w :w!<cr>
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!
map <silent> <leader><CR> :noh<cr>

nmap <silent> <leader>bn :bnext<CR>
nmap <silent> <leader>bp :bprev<CR>
nmap <silent> <leader>bd :bdelete<CR>

nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

colorscheme sonokai
