{ inputs, ... }:
{
  pkt.neovim-plugins = {
      imports = [ inputs.nixvim.homeModules.nixvim ];

      homeManager = {
        programs.nixvim = {
          
    plugins.treesitter-context = {
      enable = true;
    };

    plugins.treesitter = {
      enable = true;
      settings = {
        auto_install = true;
        highlight.enable = true;
        indent.enable = true;
      };
    };

    extraConfigLua = ''
      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = { "*.tsx", "*ts", "*.jsx", "*.js" },
        callback = function()
          vim.cmd("TSBufEnable highlight")
        end,
      })
    '';
        };
     };
  };
}

