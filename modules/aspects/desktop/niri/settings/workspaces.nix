{ inputs, ... }:
{
  pkt.niri-workspaces = {
    imports = [ inputs.niri-nix.homeModules.default ];

    homeManager = {
      wayland.windowManager.niri.settings = {
        workspace = [
          {
            _args = [ "main" ];
            open-on-output = "eDP-1";
          }
          {
            _args = [ "work" ];
            open-on-output = "eDP-1";
          }
          {
            _args = [ "chat" ];
            open-on-output = "eDP-1";
          }
          {
            _args = [ "media" ];
            open-on-output = "eDP-1";
          }
        ];
      };
    };
  };
}
