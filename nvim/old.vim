" ##########
" ########## Plugin list
" ##########

call plug#begin('~/.config/nvim/plugs')
" ## visual helper
" Directory tree view
Plug 'preservim/nerdtree'
" Indent line like IDE
Plug 'yggdroot/indentline'
" Git sign
Plug 'mhinz/vim-signify'
" Status line
Plug 'itchyny/lightline.vim'
" Easy code commmenting
Plug 'tomtom/tcomment_vim'
" Grammar file
Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
" Color preview
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
" Colorscheme
" Plug 'sainnhe/sonokai'
Plug 'drewtempelmeyer/palenight.vim'

" ## filetype helper
" Html in php indent support
Plug 'captbaritone/better-indent-support-for-php-with-html', { 'for': 'php' }
" SQL keyword uppercase
Plug 'jsborjesson/vim-uppercase-sql', { 'for': 'sql' }
" Better javascript and typescript highlight
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
" Markdown syntax and previewer
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" ## Enhance productivity
" Git command helper and integrator
Plug 'lambdalisue/gina.vim'
" Surround with quotes, parentheses or etc
Plug 'tpope/vim-surround'
" Fast easy moving cursor
Plug 'easymotion/vim-easymotion'
" LSP integration
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" Additional snippet
Plug 'honza/vim-snippets'
" Multi cursor
Plug 'mg979/vim-visual-multi', { 'branch': 'master' }
" Enhanced integrated terminal
Plug 'voldikss/vim-floaterm'
" Align
Plug 'junegunn/vim-easy-align'
" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" ## Misc plugin
" Easy remove whitespace
Plug 'bronson/vim-trailing-whitespace'
" Return back cursor in the last place
Plug 'farmergreg/vim-lastplace'
" load local editor config
Plug 'editorconfig/editorconfig-vim'
" Delete buffer helper
Plug 'moll/vim-bbye'
call plug#end()

" ##########
" ########## Editor settings
" ##########

" So lazy to rewrite in vim script
lua require 'settings'
set completeopt="menuone,preview,noinsert,noselect"



" ##########
" ########## Autocommands
" ##########

" toggle coc when is easymotion mode
autocmd User EasyMotionPromptBegin silent! CocDisable
autocmd User EasyMotionPromptEnd silent! CocEnable

" ### coc.nvim
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" update statusline on diagnostic change
autocmd User CocDiagnosticChange call lightline#update()

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end



" ##########
" ########## Custom function
" ##########

" Coc completion
function MyCompletion() abort
    if !exists('*complete_info')
        throw 'coc#_select_confirm requires complete_info function to work'
    endif
    let selected = complete_info()['selected']
    if pumvisible() && selected != -1
        return "\<C-y>"
    elseif pumvisible() && selected == -1
        return "\<CR>"
    else
        return "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
    endif
endfunction
" Coc show documentation
function! s:show_documentation()
    if (index(['vim','help','lua'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction
" Coc check backspace
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" no diagnostic coc-status
function! CocMessages() abort
    return get(g:, 'coc_status', '')
endfunction
" Get coc-diagnostic status
function! StatusDiagnostic() abort
    let display = []
    let info = get(b:, 'coc_diagnostic_info', {})
    if get(info, 'error', 0)
        call add(display, 'E:' . info['error'])
    endif
    if get(info, 'warning', 0)
        call add(display, 'W:' . info['warning'])
    endif
    if get(info, 'information', 0)
        call add(display, 'I:' . info['information'])
    endif
    if get(info, 'hint', 0)
        call add(display, 'H:' . info['hint'])
    endif
    return trim(join(display, ' '))
endfunction



" ##########
" ########## Custom command
" ##########

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')



" ##########
" ########## Plugins configuration and key mapping
" ##########
" ### Nerdtree
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeSortHiddenFirst = 1
let g:NERDTreeHijackNetrw = 1
let g:NERDTreeWinPos = 'right'
let g:NERDTreeWinSize = 25
let g:NERDTreeRespectWildIgnore = 1
let g:NERDTreeIgnore = ['plugs[[dir]]', 'vendor[[dir]]', 'node_modules[[dir]]']
let g:NERDTreeMinimalUI = 1
let g:NERDTreeMinimalMenu = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeDirArrowExpandable = "-"
let g:NERDTreeDirArrowCollapsible = "+"
nnoremap <silent> <leader>nn <cmd>NERDTreeToggle<CR>

" ### Indentline
let g:vim_json_syntax_conceal = 0
let g:indentLine_bufTypeExclude = ['help', 'terminal', 'NERDTree']
let g:indentLine_bufNameExclude = ['NERD_tree.*']

" ### Treesitter
lua require 'plugins/treesitter'

" ### vim-javascript
let g:javascript_plugin_jsdoc = 1

" ### Sonokai
let g:sonokai_style = 'andromeda'

" ### Palenight
let g:palenight_terminal_italics = 1

" ### Lightline
lua require 'plugins/lightline'

" ### vim-easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap mf <Plug>(easymotion-overwin-f2)
nmap ml <Plug>(easymotion-bd-jk)

" ### coc.nvim
let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-yaml',
    \ 'coc-snippets',
    \ 'coc-tsserver',
    \ 'coc-phpls',
    \ 'coc-vimlsp',
    \ 'coc-go',
    \ 'coc-css',
    \ 'coc-emmet',
    \ 'coc-actions',
    \ 'coc-pairs',
    \ 'coc-diagnostic',
    \]
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <cr> MyCompletion()

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" ### vim-floaterm
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F12>'
let g:floaterm_height = 0.7
let g:floaterm_autoclose = 2
nnoremap <silent> <leader>gg <CMD>FloatermNew --height=0.9 --width=0.9 lazygit<CR>

" ### fzf.vim
let g:fzf_preview_window = ['right:50%']
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
nnoremap <silent> <leader>ff <CMD>Files<CR>
nnoremap <silent> <leader>fb <CMD>Buffers<CR>
nnoremap <silent> <leader>fh <CMD>Helptags<CR>
nnoremap <silent> <leader>rg <CMD>Rg<CR>

" ##########
" ########## Hexokinase
" ##########
let g:Hexokinase_optOutPatterns = ['colour_names']

" ##########
" ########## Custom Editor mapping
" ##########

" easy move window
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" quick write file
nnoremap <leader>w <CMD>w!<CR>

" remove search highlight
nnoremap <leader><CR> <CMD>nohl<CR>

" create split window
nnoremap <C-\> <CMD>vsplit<CR>
nnoremap <A-\> <CMD>split<CR>

" move line up & down
nnoremap <C-A-DOWN> <CMD>m .+1<CR>
nnoremap <C-A-UP> <CMD>m .-2<CR>

" easy switch buffer
nnoremap [b <CMD>bprevious<CR>
nnoremap ]b <CMD>bnext<CR>

" delete buffer
nnoremap \b <CMD>Bdelete<CR>

" quit buffer
nnoremap Q <CMD>q!<CR>

" ### Set color scheme
colorscheme palenight

" ##########
" ########## Custom Highlight color
" ##########
highlight Floaterm guibg=#262626
highlight FloatermBorder guibg=#292929 guifg=Normal
