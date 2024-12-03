# NeoVimSetUp
This is a NeoVim Configuration I made for a client on Fiverr.

To install on Linux/Unix/Mac you need to run the Install.sh script
To install on Windows you need to run the command found below in powershell:
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force

For more detail on installing on Windows see [Vim-Plug](https://github.com/junegunn/vim-plug) under the install section.

After go to the file "insert.txt" and copy and paste the entire contents into a random section of the ~/.config/nvim/init.vim file.

Package Manager: [Vim-plug](https://github.com/junegunn/vim-plug) 

File Explorer: [Drex.nvim](https://github.com/TheBlob42/drex.nvim) 

LayTex Support: [Vimtex](https://github.com/lervag/vimtex)
