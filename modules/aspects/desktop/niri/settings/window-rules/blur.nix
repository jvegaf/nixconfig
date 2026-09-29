{ inputs, ... }:
{
  pkt.niri-window-rules = {
    imports = [ inputs.niri-nix.homeModules.default ];

    homeManager = {
      wayland.windowManager.niri.settings.window-rule = [
        {
          geometry-corner-radius = 10;
          clip-to-geometry = true;
          background-effect = {
            blur = true;
            xray = false;
          };
        }
        # {
        #   match._props.app-id = "org\\.telegram\\.desktop|discord|Cider";
        #   opacity = 0.90;
        #   background-effect = {
        #     blur = true;
        #     xray = true;
        #   };
        # }
      ];
    };
  };
}
