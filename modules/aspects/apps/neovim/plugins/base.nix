{ inputs, ... }:
{
  pkt.neovim-plugins = {
    imports = [ inputs.nixvim.homeModules.nixvim ];

    homeManager = {
      programs.nixvim = {
        plugins = {
          better-escape = {
            enable = true;
          };
          colorizer.enable = true;
          diffview = {
            enable = true;
            settings = {
              enhanced_diff_hl = true;
            };
          };
          indent-blankline.enable = true;
          fidget.enable = true;
          lastplace.enable = true;
          grug-far.enable = true;
          luasnip.enable = true;
          nix.enable = true;
          nix-develop.enable = true;
          markview.enable = true;
          nvim-autopairs = {
            enable = true;
            settings = {
              check_ts = true;
            };
          };
          mini-surround = {
            enable = true;
            settings.mappings = {
              add = "gsa";
              delete = "gsd";
              find = "gsf";
              find_left = "gsF";
              replate = "gsr";
              update_n_lines = "gsn";
            };
          };
          lazygit.enable = true;
          nvim-ufo.enable = true;
          web-devicons.enable = true;
          smear-cursor.enable = true;
        };
      };
    };
  };
}
