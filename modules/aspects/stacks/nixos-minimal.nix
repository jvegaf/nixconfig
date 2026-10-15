{ __findFile, ... }:
{
  pkt.nixos-minimal = {
    includes = [
      # <pkt/extra>
      # <pkt/internationalization>
      # <pkt/font>
      # <pkt/networking>
      # <pkt/nix>
      # <pkt/security>
      # <pkt/timezone>
      <pkt/ssh>
    ];
  };
}
