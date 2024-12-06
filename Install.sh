sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

mkdir ~/.config/nvim/

cd ~/.config/nvim/

touch init.vim

pip3 install pynvim
pip3 install --upgrade pynvim

cat > init.vim << EOF
call plug#begin()

" List your plugins here \n
Plug 'theblob42/drex.nvim'
Plug 'kyazdani42/nvim-web-devicons' " optional

Plug 'lervag/vimtex'
Plug 'lervag/vimtex', { 'tag': 'v2.15' }

Plug 'puremourning/vimspector'
Plug 'mfussenegger/nvim-jdtls'
Plug 'elementdavv/vimspector-jdtls'

function! UpdateRemotePlugins(...)
    " Needed to refresh runtime files
    let &rtp=&rtp
    UpdateRemotePlugins
  endfunction

Plug 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins') }

Plug 'nvim-treesitter/nvim-treesitter'

call plug#end()
EOF
