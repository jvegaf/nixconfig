{ inputs, ... }:
{
  pkt.neovim-plugins = {
    imports = [ inputs.nixvim.homeModules.nixvim ];

    homeManager = {
      programs.nixvim = {

        plugins.neo-tree = {
          enable = true;
          autoLoad = true;
          settings = {
            close_if_last_window = true;
            popup_border_style = "rounded";
            use_popups_for_input = false;
            filesystem = {
              filtered_items = {
                visible = true;
              };
            };
          };
        };

        keymaps = [
          {
            mode = "n";
            key = "<leader>e";
            action = ":Neotree toggle<CR>";
            options.silent = true;
          }
          {
            mode = "n";
            key = "<C-n>";
            action = ":Neotree filesystem reveal left<CR>";
            options.silent = true;
          }
          {
            mode = "n";
            key = "<leader>bf";
            action = ":Neotree buffers reveal right<CR>";
            options.silent = true;
          }
        ];
      };
    };
  };
}
