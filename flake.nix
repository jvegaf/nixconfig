# DO-NOT-EDIT. This file was auto-generated using github:denful/flake-file.
# Use `nix run .#write-flake` to regenerate it.
{
  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);

  inputs = {
    den.url = "github:denful/den";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-file.url = "github:vic/flake-file";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    import-tree.url = "github:denful/import-tree";
    llm-agents.url = "github:numtide/llm-agents.nix";
    niri-nix.url = "git+https://codeberg.org/BANanaD3V/niri-nix";
    nix-flatpak.url = "github:gmodena/nix-flatpak/";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia.url = "github:noctalia-dev/noctalia";
    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    omp-nix.url = "git+https://git.molez.org/mandlm/omp-nix";
    pixie-sddm.url = "github:xCaptaiN09/pixie-sddm";
    superpowers = {
      url = "github:obra/superpowers";
      flake = false;
    };
    yazi = {
      url = "github:sxyazi/yazi";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
