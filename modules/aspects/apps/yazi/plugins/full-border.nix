{
  inputs,
  lib,
  __findFile,
  ...
}:
{
  pkt.yazi-plugins = {
    homeManager =
      { pkgs, ... }:
      {
        programs.yazi = {
          plugins = with pkgs.yaziPlugins; {
            inherit full-border;
          };

          initLua = ''
            require("full-border"):setup({ set = 'rounded'})
          '';
        };
      };
  };
}
