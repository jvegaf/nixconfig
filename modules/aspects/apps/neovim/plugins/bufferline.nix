{ inputs, ... }:
{
  pkt.neovim-plugins = {
    imports = [ inputs.nixvim.homeModules.nixvim ];

    homeManager = { pkgs, ... }: {
      programs.nixvim = {

        extraPlugins = with pkgs.vimPlugins; [ vim-bbye ];

        plugins.bufferline = {
          enable = true;
        };

        keymaps = [
          {
            mode = "n";
            key = "L";
            action = "<Cmd>BufferLineCycleNext<CR>";
            options.desc = "Next Tab";
          }
          {
            mode = "n";
            key = "H";
            action = "<Cmd>BufferLineCyclePrev<CR>";
            options.desc = "Prev Tab";
          }
          {
            mode = "n";
            key = "Q";
            action = "<Cmd>Bdelete<CR>";
          }
        ];
      };
    };
  };
}
