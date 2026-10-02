{ den, __findFile, ... }:
{
  # General Home Setup for Non-GUI Systems
  den.homes.x86_64-linux.th3g3ntl3man = { };
  den.homes.aarch64-linux.th3g3ntl3man = { };

  den.aspects.th3g3ntl3man = {
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
