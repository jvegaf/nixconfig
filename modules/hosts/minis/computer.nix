{
  den.aspects.minis-computer = {
    nixos =
      {
        pkgs,
        config,
        ...
      }:
      {
        imports = [
          ./_hardware.nix
        ];

        boot.kernelPackages = pkgs.linuxPackages_latest;

        boot.loader = {
          efi.canTouchEfiVariables = true;
          systemd-boot.enable = true;
          timeout = 5;
        };

        hardware = {
          enableRedistributableFirmware = true;
        };

      };
  };
}
