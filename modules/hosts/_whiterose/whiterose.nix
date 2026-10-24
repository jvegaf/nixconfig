{
  den,
  lib,
  __findFile,
  ...
}:
{
  den.hosts.x86_64-linux.whiterose = {
    users.nixos.classes = [ "homeManager" ];
  };

  den.aspects.whiterose = {
    includes = [
      den.aspects.whiterose-computer
    ];

    provides.nixos = {
      includes = [
        <pkt/dev-tools>
        <pkt/nixos-minimal>
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
    # nixos =
    #   { pkgs, lib, ... }:
    #   {
    #     environment = {
    #       systemPackages = with pkgs; [
    #       ];
    #     };
    #
    #     nixpkgs.config.permittedInsecurePackages = [
    #
    #     ];
    #   };
  };
}
