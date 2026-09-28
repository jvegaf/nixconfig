{
  inputs,
  lib,
  __findFile,
  ...
}:
{
  flake-file.inputs.nixvim = {
    url = "github:nix-community/nixvim";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  pkt.neovim = {
    includes = [
      <pkt/neovim-keymaps>
      <pkt/neovim-plugins>
    ];
    
    nixos = {
      # Sidekick stack (see _config/plugins/sidekick.nix).
      unfree.packages = [
        "claude-code"
        "copilot-language-server"
        "github-copilot-cli"
        "git-conflict.nvim"
      ];
    };

    homeManager = {
      imports = [ inputs.nixvim.homeModules.nixvim ];

      programs.nixvim = {
        enable = true;
        nixpkgs.useGlobalPackages = true;
        colorschemes.dracula.enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        enableMan = true;

        globals = {
          mapleader = " ";
          maplocalleader = ",";
        };

        opts = {
          expandtab = true;
          number = true;
          relativenumber = true;
          shiftwidth = 2;
          tabstop = 4;
          cursorline = true;
          scrolloff = 5;
          visualbell = true;
          ignorecase = true;
          smartcase = true;
          hlsearch = true;
          undofile = true;
          spell = false;
          foldlevel = 99;
          foldlevelstart = 99;
          list = true;
          updatetime = 2000;
          termguicolors = true;
        };

        clipboard = {
          register = "unnamedplus";
          providers = {
            wl-copy.enable = true;
            xsel.enable = true;
            xclip.enable = true;
          };
        };

        extraConfigLua = ''
          vim.diagnostic.config({
            virtual_text = true,
            signs = true,
            underline = true,
          })
        '';
      };
    };

  };
}
