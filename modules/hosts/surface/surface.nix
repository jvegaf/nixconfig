{
  den,
  lib,
  __findFile,
  ...
}:
{
  # ASUS AMD Gaming Desktop
  den.hosts.x86_64-linux.surface = {
    users.th3g3ntl3man.classes = [ "homeManager" ];
  };

  den.aspects.surface = {
    includes = [
      den.aspects.surface-computer
      den.aspects.surface-disko
    ];

    provides.th3g3ntl3man = {
      includes = [
        <pkt/desktop-apps>
        <pkt/dev-tools>
        <pkt/niri>
        <pkt/nixos-base>
        <pkt/noctalia>
        <pkt/noctalia-greeter>
        <pkt/terminal>
      ];

      homeManager = {
        # useful for setting an icon when testing, but probably conflicts in real setups.
        # home.file.".face.icon".source = ./avatar.png;

        # explicitly set home.pointerCursor.enable
        # home.pointerCursor.enable = true;
      };
    };

    # Impromptu Configurations
    nixos =
      { pkgs, lib, ... }:
      {
        environment = {
          systemPackages = with pkgs; [

          ];

          hardware.graphics = {
            enable = true;
            enable32Bit = true;
          };

          shellAliases = {
            freb = "sudo nixos-rebuild switch --flake ~/nixconfig#surface --log-format internal-json -v |& nom --json";
          };
          # variables = {
          #   POWERDEVIL_NO_DDCUTIL = "1";
          #   # Necesario para NVIDIA + Wayland
          #   LIBVA_DRIVER_NAME = "nvidia";
          #   XDG_SESSION_TYPE = "wayland";
          #   GBM_BACKEND = "nvidia-drm";
          #   __GLX_VENDOR_LIBRARY_NAME = "nvidia";
          #   NVD_BACKEND = "direct";
          #   # AIDEV-NOTE: Para pantallas externas con NVIDIA
          #   WLR_NO_HARDWARE_CURSORS = "1";
          # };
        };

        nixpkgs.config.permittedInsecurePackages = [

        ];
      };
  };
}
