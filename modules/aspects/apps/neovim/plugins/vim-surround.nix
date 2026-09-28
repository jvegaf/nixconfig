{ inputs, ... }: {
  pkt.neovim-plugins = {
      imports = [ inputs.nixvim.homeModules.nixvim ];

      homeManager = {
        programs.nixvim = {
          
    plugins.vim-surround = {
      enable = true;
    };
        };
     };
  };
}
