## [NEOVIM/VIM]
<img src="https://github.com/rohit-krish/CONFIG-FILES/blob/main/NEOVIM/Screenshot%20from%202022-07-11%2012-35-13.png"><br/>
## File Structure:-</br>
```~/.config/nvim/init.vim```</br>
```~/.config/nvim/autoload/plug.vim```</br>
```~/.config/nvim/plugged/*```</br>

>***init.vim*** is the file given in my repo.which will load when we open vim/nvim</br>
>using [***vim-plug***](https://github.com/junegunn/vim-plug) for to maintain and install new plugins for my neovim</br>
>***~/.config/nvim/plugged/*** contains my extra added plugins files</br>
>
### Installation of vim-plug [Unix/Linux]
```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.config}"/nvim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
[language servers (coc)](https://github.com/neoclide/coc.nvim/wiki/Language-servers)
 
**If you don't want to use vim in terminal always use as an extension vim supports for most of the IDEs. I use VSCODE along with vim as an extension.</br>**

<h4>My recommended vim tutorial from <a href="https://www.youtube.com/playlist?list=PL7yh-TELLS1Eevqs4-XmlSfrFOKb5C97K" target="_blank">NeuralNine</a></h4>
