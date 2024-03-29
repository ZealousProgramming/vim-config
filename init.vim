syntax on

set noswapfile
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
set foldlevel=99
set foldlevelstart=10
set foldnestmax=10
set nofoldenable
set signcolumn=yes

set hidden
set colorcolumn=110
highlight ColorColumn ctermbg=0 guibg=lightgrey
"highlight ColorColumn ctermbg=NONE guibg=NONE


call plug#begin("~/.local/share/nvim/plugged")
"Themes
	Plug 'gruvbox-community/gruvbox'
	Plug 'sainnhe/gruvbox-material'
	Plug 'morhetz/gruvbox'
	Plug 'gilgigilgil/anderson.vim'
	Plug 'nightsense/carbonized'
	Plug 'franbach/miramare'
	"Plug 'jcherven/jummidark.vim'
	Plug 'kamykn/dark-theme.vim'
	Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
	Plug 'sainnhe/edge'
	Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
	Plug 'iojani/silenthill.vim'
	Plug 'flrnd/candid.vim'
	Plug 'sjl/badwolf'
	Plug 'wojciechkepka/bogster'
	Plug 'ghifarit53/tokyonight-vim'
	Plug 'owozsh/amora'
	Plug 'Lokaltog/vim-monotone'
	Plug 'jacoborus/tender.vim'
	Plug 'nikolvs/vim-sunbather'
	Plug 'AlessandroYorba/Sierra'
	Plug 'AlessandroYorba/Despacio'
	Plug 'AhmedAbdulrahman/vim-aylin'
	Plug 'matsuuu/pinkmare'
"Third Partys
	"Plug 'junegunn/fzf', {'do': {-> fzf#install() } }
	"Plug 'junegunn/fzf.vim'
	Plug 'kyazdani42/nvim-web-devicons' " for file icons
	Plug 'kyazdani42/nvim-tree.lua'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'cdelledonne/vim-cmake'
	Plug 'itchyny/lightline.vim'
	Plug 'junegunn/goyo.vim'
	Plug 'romgrk/barbar.nvim'
	" Plug 'dense-analysis/ale'
"Language specific
	"C
	Plug 'vim-scripts/c.vim'
	"C++
	Plug 'jackguo380/vim-lsp-cxx-highlight'
	"Plug 'https://github.com/bfrg/vim-cpp-modern'
	Plug 'cdelledonne/vim-cmake'
	Plug 'antoinemadec/FixCursorHold.nvim'
	"C#
	Plug 'OmniSharp/omnisharp-vim'
	"GDScript
	Plug 'habamax/vim-godot'
	"Rust
	Plug 'rust-lang/rust.vim'
	Plug 'rhysd/rust-doc.vim'
	"Zig
	Plug 'ziglang/zig.vim'
	"Python
	Plug 'vim-scripts/indentpython.vim'
	Plug 'nvie/vim-flake8'
	Plug 'vim-syntastic/syntastic'
	"GLSL
	Plug 'tikhomirov/vim-glsl'
	"Markdown
	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
	"Plug 'plasticboy/vim-markdown'
call plug#end()

" ------------------------------------------------------
"	Requireds
" ------------------------------------------------------
lua require 'nvim-tree'.setup{}

" ------------------------------------------------------
"	Transparent
" ------------------------------------------------------
let t:is_transparent = 0

function! Toggle_transparent_back()
	if t:is_transparent == 0
		let t:is_transparent = 1
		hi Normal guibg=#111111 ctermbg=black
		set background=dark
	else
		let t:is_transparent = 0
		hi Normal guibg=NONE ctermbg=NONE
	endif
endfunction


" ------------------------------------------------------
"	Gruvbox
" ------------------------------------------------------
let g:gruvbox_contrast_dark = "medium" " hard and soft
let g:gruvbox_contrast_light = "soft"
let g:gruvbox_invert_selection= "0"

" ------------------------------------------------------
"	Tokyonight
" ------------------------------------------------------
let g:tokyonight_style = 'night' " night and storm
"let g:tokyonight_style = 'storm' " night and storm
"let g:lightline = {'colorscheme': 'tokyonight'}

" ------------------------------------------------------
"	Tokyonight
" ------------------------------------------------------
let g:mode = 'focus' 
" focus - dark
" normal - medium purple
" mirtilo - plum

" CMake
let g:cmake_link_compile_commands = 1

"Goyo
let g:goyo_height = '100%'
let g:goyo_width = '95%'

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

colorscheme pinkmare

"let g:lightline = {'colorscheme': 'challenger_deep'}
let g:lightline = {'colorscheme' : 'wombat'}
"let g:lightline = {'colorscheme' : 'spaceduck'}
"let g:lightline = {'colorscheme' : 'seoul256'}




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

" --------------
" - Move Lines -
" --------------
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc> :m .+1<CR>==gi
inoremap <A-k> <Esc> :m .-2<CR>==gi


" -------------
" - Telescope -
" -------------
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

map <leader><C-s> :wa<CR>
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>rn <Plug>(coc-rename)
nnoremap <C-p> :GFiles<CR>
" Resize
nnoremap <leader>vsp :vertical resize 140<CR>
" Remove highlight
nnoremap <leader>hl :nohl<CR>
" Allow for tab and shift tab on autocomplete menus
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
" Prevents terminal from suspending
nmap <C-z> <Nop>

" Toggle transparency
nnoremap <C-F12> :call Toggle_transparent_back()<CR>

" Godot
nnoremap <F5> :GodotRun<CR>

" Rust
nnoremap <F3> :CocCommand rust-analyzer.openDocs<CR>

" Theme bindings
nnoremap <leader>gbx :colorscheme gruvbox<bar>:set background=dark<CR>
nnoremap <leader>gbl :colorscheme gruvbox<bar>:set background=light<CR>
nnoremap <leader>and :colorscheme anderson<bar>:set background=dark<CR>
nnoremap <leader>carb :colorscheme carbonized-dark<bar>:set background=dark<CR>
nnoremap <leader>mira :colorscheme miramare<bar>:set background=dark<CR>
"nnoremap <leader>jum :colorscheme jummidark<bar>:set background=dark<CR>
nnoremap <leader>cst :colorscheme coolsteel<CR>
nnoremap <leader>dark :colorscheme darktheme<CR>
nnoremap <leader>mt :colorscheme mountaineer-grey<CR>
nnoremap <leader>deep :colorscheme challenger_deep<CR>
nnoremap <leader>zn :colorscheme zenburn<CR>
nnoremap <leader>edge :colorscheme edge<CR>
nnoremap <leader>spd :colorscheme spaceduck<CR>
nnoremap <leader>shill :colorscheme silenthill<CR>
nnoremap <leader>svrc :so $vrc<CR>
nnoremap <leader>evrc :e $vrc<CR>
nnoremap <leader>cand :colorscheme candid<CR>
nnoremap <leader>bog :colorscheme bogster<CR>
nnoremap <leader>badwolf :colorscheme badwolf<CR>
nnoremap <leader>tokyo :colorscheme tokyonight<CR>
nnoremap <leader>amora :colorscheme amora<CR>
nnoremap <leader>mono :colorscheme monotone<CR>
nnoremap <leader>tender :colorscheme tender<CR>
nnoremap <leader>sunbath :colorscheme sunbather<CR>
nnoremap <leader>sierra :colorscheme sierra<CR>
nnoremap <leader>despa :colorscheme despacio<CR>
nnoremap <leader>aylin :colorscheme aylin<CR>
nnoremap <leader>pnk :colorscheme pinkmare<CR>


"--------------------------------------------
"		- BarBar -
"--------------------------------------------
" Close Buffer
nnoremap <silent>	<A-c> :BufferClose<CR>
" Buffer navigation
nnoremap <silent>	<C-l> :BufferNext<CR>
nnoremap <silent>	<C-h> :BufferPrevious<CR>
" Buffer re-ordering
nnoremap <silent>	<C-PageDown> :BufferMovePrevious<CR>
nnoremap <silent>	<C-PageUp> :BufferMoveNext<CR>

let bufferline = get(g:, 'bufferline', {})
let bufferline.closable = v:false
let bufferline.clickable = v:false
let bufferline.icons = v:false
let bufferline.icon_custom_colors = v:false
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

" ------------------------------------------------------
"	markdown-preview
" ------------------------------------------------------
" set to 1, nvim will open the preview window after entering the markdown
" buffer
" " default: 0
let g:mkdp_auto_start = 0
"
" " set to 1, the nvim will auto close current preview window when change
" " from markdown buffer to another buffer
" " default: 1
let g:mkdp_auto_close = 1
"
" " set to 1, the vim will refresh markdown when save the buffer or
" " leave from insert mode, default 0 is auto refresh markdown as you edit or
" " move the cursor
" " default: 0
let g:mkdp_refresh_slow = 0
"
" " set to 1, the MarkdownPreview command can be use for all files,
" " by default it can be use in markdown file
" " default: 0
let g:mkdp_command_for_global = 0
"
" " set to 1, preview server available to others in your network
" " by default, the server listens on localhost (127.0.0.1)
" " default: 0
let g:mkdp_open_to_the_world = 0
"
" " use custom IP to open preview page
" " useful when you work in remote vim and preview on local browser
" " more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" " default empty
let g:mkdp_open_ip = ''
"
" " specify browser to open preview page
" " default: ''
let g:mkdp_browser = 'firefox'
"
" " set to 1, echo preview page url in command line when open preview page
" " default is 0
let g:mkdp_echo_preview_url = 0
"
" " a custom vim function name to open preview page
" " this function will receive url as param
" " default is empty
let g:mkdp_browserfunc = ''
"
" " options for markdown render
" " mkit: markdown-it options for render
" " katex: katex options for math
" " uml: markdown-it-plantuml options
" " maid: mermaid options
" " disable_sync_scroll: if disable sync scroll, default 0
" " sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
" "   middle: mean the cursor position alway show at the middle of the preview
" page
" "   top: mean the vim top viewport alway show at the top of the preview page
" "   relative: mean the cursor position alway show at the relative positon of
" the preview page
" " hide_yaml_meta: if hide yaml metadata, default is 1
" " sequence_diagrams: js-sequence-diagrams options
" " content_editable: if enable content editable for preview page, default:
" v:false
" " disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
	\ 'mkit': {},
	\ 'katex': {},
	\ 'uml': {},
	\ 'maid': {},
	\ 'disable_sync_scroll': 0,
	\ 'sync_scroll_type': 'middle',
	\ 'hide_yaml_meta': 1,
	\ 'sequence_diagrams': {},
	\ 'flowchart_diagrams': {},
	\ 'content_editable': v:false,
	\ 'disable_filename': 0
	\ }

" use a custom markdown style must be absolute path like
" /Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path like
" '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title " ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

nnoremap <leader>pmd <Plug>MarkdownPreview
nnoremap <leader>smd <Plug>MarkdownPreviewStop

" ------------------------------------------------------
"	GLSL	
" ------------------------------------------------------
autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl


" ------------------------------------------------------
"	C++	
" ------------------------------------------------------
" let g:cpp_function_highlight = 1
" let g:cpp_attributes_highlight = 1
" let g:cpp_member_highlight = 1
" let g:cpp_simple_highlight = 1

" ------------------------------------------------------
"  ALE
" ------------------------------------------------------
let g:ale_linters = {'python': 'all'}
let g:ale_fixers = {'python': ['isort', 'yapf', 'remove_trailing_lines', 'trim_whitespace']}
let g:ale_lsp_suggestions = 1
let g:ale_fix_on_save = 1
let g:ale_go_gofmt_options = '-s'
let g:ale_go_gometalinter_options = '— enable=gosimple — enable=staticcheck'
let g:ale_completion_enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] [%severity%] %code: %%s'

" ------------------------------------------------------
"  Python
" ------------------------------------------------------
let python_highlight_all=1

" ------------------------------------------------------
"  Godot
" ------------------------------------------------------
let g:godot_executable = 'D:/Programming/Godot/Godot_v3.4-stable_mono_win64/Godot_v3.4-stable_mono_win64.exe'

" ------------------------------------------------------
"  Nvim-Tree keys
" ------------------------------------------------------
" <CR> o		- edit
" <C-]>			- cd
" dir_up		- -
" <C-v>			- vsplit
" <C-x>			- split
" <C-t>			- tabnew
" <C-t>			- tabnew
" Shift <		- prev_sibling
" Shift >		- next_sibling
" R				- refresh
" a				- create
" d				- remove
" r				- rename
" <C-r>			- full_rename
" x				- cut
" c				- copy
" p				- paste
" y				- copy_name
" Y				- copy_path
" gy			- copy_absolute_path

