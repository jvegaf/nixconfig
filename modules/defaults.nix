{ den, __findFile, ... }:
{
  den.default = {
    includes = [
      <den/define-user>
      <den/hostname>
      <den/mutual-provider>
    ];

    nixos = {
      system.stateVersion = "26.05";

      nixpkgs.config.allowUnfree = true;
      nix = {
        gc = {
          automatic = true;
          dates = "weekly";
          options = "--delete-older-than 7d";
        };
        optimise.automatic = true;
        settings = {
          auto-optimise-store = true;
          accept-flake-config = true;
          experimental-features = [
            "nix-command"
            "flakes"
          ];
          trusted-users = [
            "root"
            "th3g3ntl3man"
            "@wheel"
          ];
          trusted-substituters = [
            "https://cache.nixos.org"
            "https://nix-community.cachix.org"
          ];
          trusted-public-keys = [
            "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
            "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          ];
        };
      };

      home-manager = {
        backupFileExtension = "backup";
        useUserPackages = true;
        useGlobalPkgs = true;
      };
    };

    homeManager = {
      home = {
        backupFileExtension = "backup";
        stateVersion = "26.05";
      };
    };

  };
}
