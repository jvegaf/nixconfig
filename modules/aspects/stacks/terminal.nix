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
      <pkt/zsh>
      <pkt/tldr>
      <pkt/tmux>
    ];

    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          fd
          fzf
          timg
        ];
        home.shellAliases = {
          dots = "cd ~/nixconfig";
          doc = "cd ~/Documents";
          dw = "cd ~/Downloads";
          dt = "cd ~/Desktop";
          cdc = "cd ~/Code";
        };
      };

  };
}
