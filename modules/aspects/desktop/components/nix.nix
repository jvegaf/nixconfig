{ den, ... }:
{
  # nh exposition
  # https://den.denful.dev/reference/lib/#denlibnh
  # perSystem =
  #   { pkgs, ... }:
  #   {
  #     packages = den.lib.nh.denPackages { fromFlake = true; } pkgs;
  #   };

  pkt.nix = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          nil
          nixd
          nixfmt
          nvd
          nvfetcher
          nix-output-monitor
        ];

        # https://wiki.nixos.org/wiki/Nix-ld
        programs.nix-ld.enable = true;
      };

    homeManager =
      { config, pkgs, ... }:
      {
        programs.nh = {
          enable = true;
          flake = "${config.home.homeDirectory}/nixconfig";
        };

        home.packages = with pkgs; [
          nixfmt
          nvd
        ];

        home.shellAliases = {
          rmd = "rm -rf";
          jctl = "journalctl -p 3 -xb";
          grep = "grep --color=auto";
          bt = "btop";
          gb = "nix-collect-garbage -d";
          clean = "nh clean all --keep 3";
        };
      };
  };
}
