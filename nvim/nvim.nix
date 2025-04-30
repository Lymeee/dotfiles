{ config, pkgs, inputs, ... }:

let
  hatsunemiku = pkgs.vimUtils.buildVimPlugin {
    name = "vim-colors-hatsunemiku";
    src = pkgs.fetchFromGitHub {
      owner = "4513ECHO";
      repo = "vim-colors-hatsunemiku";
      rev = "eecb0f1fe4db10c312a8174d758ba275a8e95736";
      sha256 = "0mggwb3wdbfgqzlvrg2iv5s1irryx2rsp0jagc1wgzm5dawkh1jb";
    };
  };

  toLua = str: "lua << EOF\n${str}\nEOF\n";
  toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
in {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      lua-language-server
      nixd
      git
      xclip
      wl-clipboard
      unzip # for loading vscode snippets
    ];

    plugins = with pkgs.vimPlugins; [
      {
        plugin = nvim-lspconfig;
        config = toLuaFile ./plugin/lsp.lua;
      }
      {
        plugin = comment-nvim;
        config = toLua "require(\"Comment\").setup()";
      }
      neodev-nvim
      {
        plugin = nvim-cmp;
        config = toLuaFile ./plugin/cmp.lua;
      }
      {
        plugin = telescope-nvim;
        config = toLuaFile ./plugin/telescope.lua;
      }
      telescope-fzf-native-nvim
      cmp_luasnip
      cmp-nvim-lsp
      luasnip
      friendly-snippets
      lualine-nvim
      nvim-web-devicons
      {
        plugin = (nvim-treesitter.withPlugins (p: [
          p.tree-sitter-nix
          p.tree-sitter-vim
          p.tree-sitter-bash
          p.tree-sitter-lua
          p.tree-sitter-python
          p.tree-sitter-json
        ]));
        config = toLuaFile ./plugin/treesitter.lua;
      }
      vim-nix
      {
        plugin = hatsunemiku;
        config = "colorscheme hatsunemiku";
      }
      nerdtree
      vim-surround
      vim-repeat
      which-key-nvim
    ];

    extraLuaConfig = ''
      vim.opt.termguicolors = true

      ${builtins.readFile ./options.lua}
      ${builtins.readFile ./plugin/other.lua}

      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          vim.cmd("colorscheme hatsunemiku")
        end,
      })

      -- Miku keybinding to toggle NERDTree
      vim.keymap.set("n", "<leader>m", ":NERDTreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle NERDTree with Miku power" })
    '';
  };
}

