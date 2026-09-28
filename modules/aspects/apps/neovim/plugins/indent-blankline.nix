{ inputs, ... }:
{
  pkt.neovim-plugins = {
      imports = [ inputs.nixvim.homeModules.nixvim ];

      homeManager = {
        programs.nixvim = {
          
    plugins.indent-blankline = {
      enable = true;
    };
        };
     };
  };
}
