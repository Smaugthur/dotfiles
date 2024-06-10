
""""""""""""
"PLUGINS
"""""""""""""""
" {{{
call plug#begin('~/.vim/plugged')

" Themes
    Plug 'morhetz/gruvbox'
    Plug 'flrnd/candid.vim'
    Plug 'adrian5/oceanic-next-vim'
    Plug 'nightsense/cosmic_latte'
    Plug 'chriskempson/base16-vim'

" IDE
    " File explorer 
    Plug 'scrooloose/nerdtree' 
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " File explorer icons 
    Plug 'ryanoasis/vim-devicons'
    Plug 'christoomey/vim-tmux-navigator'
    " Cool start windows
    Plug 'mhinz/vim-startify'
    " Status bar
    Plug 'vim-airline/vim-airline'
    " Intellisense
    Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install --frozen-lockfile'} " this is for auto complete, prettier and tslinting
    let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']  " list of CoC extensions needed
    " Autocompletition for C#
    Plug 'Omnisharp/omnisharp-vim'
    " Linter
    Plug 'dense-analysis/ale'
    " Marks for indentation
    Plug 'Yggdroot/indentLine'
    " Git commands on vim
    Plug 'tpope/vim-fugitive'
    " Debugging functionality
    Plug 'puremourning/vimspector'
    " Auto close ( [ {
    Plug 'jiangmiao/auto-pairs'

    " Javascript better Highlighting
    Plug 'yuezk/vim-js'

    Plug 'ThePrimeagen/vim-be-good'

call plug#end()
"}}}

"""""""""""""""
" =>BASICS
"""""""""""""""
    let mapleader=" "
    set mouse=a

    " Themes and enconding
    set termguicolors
    colorscheme gruvbox
    set encoding=utf-8
    set foldmethod=marker

    " Rulers
    set relativenumber
    set number
    set numberwidth=1
"    set cursorline
"   set cursorcolumn

    "Spliting Buffers
    set splitright
    set splitbelow

    " File History
    set undofile
    set undodir=~/.vim/undodir
    set noswapfile
    set clipboard=unnamedplus

    " Highlighting
    syntax enable
    syntax on

    " Indent
    set tabstop=4 softtabstop=4
    set shiftwidth=4
    set expandtab
    set smartindent
    set nowrap

    " Others
    set showcmd
    set cmdheight=2
    set noerrorbells
    set scrolloff=8
    set signcolumn=yes

    " Theme configuration
    let g:gruvbox_italic=1
    let g:gruvbox_bold=1
    let g:gruvbox_termcolors=16
    let $BAT_THEME='ansi-dark'

"""""""""""""""""
" KEY MAPS
"""""""""""""""""
    nmap <Leader>s :w<CR>
    nmap <Leader>e :q<CR>
    nmap <Leader>m :NERDTreeFind<CR>
    map <Leader>f :Files<CR>

    " Move selected line / block of text in visual mode
    " and change its indentation level
    " < move left
    " > move rigth
     vnoremap < <gv
     vnoremap > >gv

    " Move selected line / block of text in visual mode
    " shift + k to move up
    " shift + j to move down
    xnoremap K :move '<-2<CR>gv-gv
    xnoremap J :move '>+1<CR>gv-gv

    " move among buffers with CTRL
    " space + p next tab
    " space + o previus tab
    map <Leader>p :tabn<CR>
    map <Leader>o :tabp<CR>

""""""""""""""""""""""""
" PLUGINS CONFIGURATION
""""""""""""""""""""""""
    source ~/.config/nvim/vim-plug/nerdTree.vim
    source ~/.config/nvim/vim-plug/fzf.vim
    source ~/.config/nvim/vim-plug/ale.vim
    source ~/.config/nvim/vim-plug/airline.vim
    source ~/.config/nvim/vim-plug/startify.vim
    source ~/.config/nvim/vim-plug/coc.vim
    let g:vimspector_enable_mappings = 'HUMAN'

" indentLine
    let g:indentLine_fileTypeExclude = ['text','vim','nerdtree','help','startify']
    let g:indentLine_bufTypeExclude = ['help','terminal']


"""""""""""""""
" => FUNCTIONS 
"""""""""""""""
" Changes theme color depending on the hour
    function! Change_theme_by_hour()
        if strftime("%H") < 17
          set background=light
        else
          set background=dark
        endif
    endfunction

call Change_theme_by_hour()
" Toggle transparent background {{{
    let t:is_transparent = 0
    function! Toggle_transparent()
        if t:is_transparent == 0
            hi Normal guibg=NONE ctermbg=NONE
            set nocursorcolumn
            let t:is_transparent = 1
        else
           call Change_theme_by_hour()
            set cursorcolumn
            let t:is_transparent = 0
        endif
    endfunction
    map <Leader>t : call Toggle_transparent()<CR>

" }}}

