sudo apt install neovim

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

mkdir ~/.config/nvim/

cd ~/.config/nvim/

touch init.vim

VAR=$(cat <<EOF
call plug#begin()

" List your plugins here
Plug 'theblob42/drex.nvim'
Plug 'kyazdani42/nvim-web-devicons' " optional

Plug 'lervag/vimtex'
Plug 'lervag/vimtex', { 'tag': 'v2.15' }

call plug#end()
EOF
)

echo $VAR >> init.vim
