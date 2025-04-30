{ config, pkgs, ... }:

let
  vimColorPlugin = pkgs.vimUtils.buildVimPlugin {
    pname = "vim-colors-hatsunemiku";
    version = "latest";
    src = builtins.fetchTarball {
      url = "https://github.com/4513ECHO/vim-colors-hatsunemiku/archive/master.tar.gz";
      sha256 = "0mggwb3wdbfgqzlvrg2iv5s1irryx2rsp0jagc1wgzm5dawkh1jb";
    };
  };
in
{
  programs.neovim = {
    enable = true;
    plugins = [
      vimColorsHatsunemiku
    ];
    extraConfig = ''
      set termguicolors
      colorscheme hatsunemiku
    '';
  };
}

