syntax on

set tabstop=4 softtabstop=4
set shiftwidth=4
set termguicolors
set nu
"set relativenumber
set cursorline
set cmdheight=4
set updatetime=50
set foldmethod=indent
set foldenable
set foldlevelstart=10
set foldnestmax=10
set nofoldenable
set signcolumn=yes

set hidden
set colorcolumn=110
highlight ColorColumn ctermbg=0 guibg=lightgrey


call plug#begin("~/.local/share/nvim/plugged")
"Themes
	Plug 'gruvbox-community/gruvbox'
	Plug 'sainnhe/gruvbox-material'
	Plug 'morhetz/gruvbox'
	Plug 'gilgigilgil/anderson.vim'
	Plug 'nightsense/carbonized'
	Plug 'franbach/miramare'
	Plug 'jcherven/jummidark.vim'
	Plug 'kamykn/dark-theme.vim'
	Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
	Plug 'sainnhe/edge'
	Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
	Plug 'iojani/silenthill.vim'
	Plug 'flrnd/candid.vim'
"Third Partys
	Plug 'junegunn/fzf', {'do': {-> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'cdelledonne/vim-cmake'
	Plug 'itchyny/lightline.vim'
"Language specific
	"C++
	Plug 'jackguo380/vim-lsp-cxx-highlight'
	Plug 'cdelledonne/vim-cmake'
	Plug 'antoinemadec/FixCursorHold.nvim'

	Plug 'OmniSharp/omnisharp-vim'
	Plug 'habamax/vim-godot'

	Plug 'junegunn/goyo.vim'

	Plug 'rust-lang/rust.vim'
	Plug 'rhysd/rust-doc.vim'

call plug#end()

" CMake
let g:cmake_link_compile_commands = 1


" Prevents terminal from suspending
nmap <C-z> <Nop>

"Goyo
let g:goyo_height = '100%'
let g:goyo_width = '95%'

let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

"colorscheme togglebit
"colorscheme gruvbox
colorscheme mountaineer-grey
set background=dark
"colorscheme anderson
"colorscheme carbonized-dark
"colorscheme jummidark
"colorscheme darktheme



nnoremap <space> <Nop>
let mapleader="\<space>"

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

let $FZF_DEFAULT_OPTS='--reverse'
"let $FZF_DEFAULT_COMMAND = 'rg --files'
"let $FZF_DEFAULT_COMMAND = 'ag -g ""'
"call fzf#vim#gitfiles('', fzf#vim#with_preview('right'))
map <leader>p :GFiles --cached --others --exclude-standard<CR>
"map <leader>p :GFiles<CR>
"map <C-f> :Files<CR>
"map <leader>j :Files<CR>
"map <leader>b :Buffers<CR>
map <leader><C-s> :wa<CR>
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>rn <Plug>(coc-rename)
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>gbox :colorscheme gruvbox<bar>:set background=dark<CR>
nnoremap <leader>and :colorscheme anderson<bar>:set background=dark<CR>
nnoremap <leader>carb :colorscheme carbonized-dark<bar>:set background=dark<CR>
nnoremap <leader>mira :colorscheme miramare<bar>:set background=dark<CR>
nnoremap <leader>jum :colorscheme jummidark<bar>:set background=dark<CR>
nnoremap <leader>cst :colorscheme coolsteel<CR>
nnoremap <leader>dark :colorscheme darktheme<CR>
nnoremap <leader>mt :colorscheme mountaineer-grey<CR>
nnoremap <leader>tb :colorscheme togglebit<CR>
nnoremap <leader>deep :colorscheme challenger_deep<CR>
nnoremap <leader>zn :colorscheme zenburn<CR>
nnoremap <leader>edge :colorscheme edge<CR>
nnoremap <leader>spd :colorscheme spaceduck<CR>
nnoremap <leader>shill :colorscheme silenthill<CR>
nnoremap <leader>vrc :so $vrc<CR>
nnoremap <leader>cand :colorscheme candid<CR>

"let g:lightline = {'colorscheme': 'challenger_deep'}
let g:lightline = {'colorscheme' : 'wombat'}
"let g:lightline = {'colorscheme' : 'spaceduck'}
"let g:lightline = {'colorscheme' : 'seoul256'}

"resize
nnoremap <leader>vsp :vertical 160

"Remove highlight
nnoremap <leader>hl :nohl<CR>

call rpcnotify(0, 'Gui', 'WindowMaximized', 1)


"inoremap <silent><expr> <TAB>
"	\ pumvisible() ? "\<C-n>" :
"	\ <SID>check_back_space() ? "\<TAB>" :
"	\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible ? "\<C-p>" : "\<C-h>"

"function! s:check_back_space() abort
"	let col = col('.') - 1
"	return !col || getline('.')[col - 1] =~# '\s'
"endfunction

inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

"Highlight symbol under curson on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

autocmd FileType cpp, cxx, h, hpp, c, :call GoCoc()

let g:OmniSharp_timeout = 1
let g:SuperTabDefaultCompletionType = 'context'
set splitbelow

augroup omnisharp_commands
	autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
	autocmd CursorHold *.cs OmniSharpTypeLookup

	autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
	autocmd FileType cs nmap <silent> <buffer> <Leader>osfu <Plug>(omnisharp_find_usages)
	autocmd FileType cs nmap <silent> <buffer> <Leader>osfi <Plug>(omnisharp_find_implementations)
	autocmd FileType cs nmap <silent> <buffer> <Leader>ospd <Plug>(omnisharp_preview_definitions)
	autocmd FileType cs nmap <silent> <buffer> <Leader>ospi <Plug>(omnisharp_preview_implementations)
	autocmd FileType cs nmap <silent> <buffer> <Leader>ost <Plug>(omnisharp_type_lookup)
	autocmd FileType cs nmap <silent> <buffer> <Leader>osd <Plug>(omnisharp_documentation)
	autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
	autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
augroup END
