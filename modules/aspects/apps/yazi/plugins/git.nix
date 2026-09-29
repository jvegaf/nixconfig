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
            inherit git;
          };

          initLua = ''
            require("git"):setup()
          '';

          settings.plugin = {
            prepend_fetchers = [
              {
                group = "git";
                url = "*";
                run = "git";
              }
              {
                group = "git";
                url = "*/";
                run = "git";
              }
            ];
          };
        };
      };
  };
}
