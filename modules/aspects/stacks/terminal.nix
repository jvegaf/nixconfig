{ __findFile, ... }:
{
  pkt.terminal = {
    includes = [
      <pkt/bat>
      <pkt/btop>
      <pkt/eza>
      <pkt/fastfetch>
      <pkt/fish>
      <pkt/helix>
      <pkt/starship>
      <pkt/zellij>
      <pkt/neovim>
      <pkt/yazi>
      <pkt/ns>
    ];

    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          fd
          fzf
          timg
        ];
      };

  };
}
