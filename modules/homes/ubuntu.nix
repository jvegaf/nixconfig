{ den, __findFile, ... }:
{
  # Copy of th3g3ntl3man.nix for systems where th3g3ntl3man is not available
  den.homes.x86_64-linux.ubuntu = { };
  den.homes.aarch64-linux.ubuntu = { };

  den.aspects.ubuntu = {
    includes = [
      <pkt/devenv>
      <pkt/git>
      <pkt/nix>
      <pkt/ssh>
      <pkt/terminal>
    ];

    homeManager = {
      programs.home-manager.enable = true;
    };
  };
}
