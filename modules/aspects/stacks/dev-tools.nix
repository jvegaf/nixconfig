{ __findFile, ... }:
{
  pkt.dev-tools = {
    includes = [
      <pkt/devenv>
      <pkt/docker>
      <pkt/git>
      <pkt/lazygit>
      <pkt/gpg>
      <pkt/keyd>
      <pkt/ai-tools>
      <pkt/pi-agent>
      <pkt/opencode>
    ];

    nixos =
      { pkgs, user, ... }:
      {
        users.users.${user.userName}.packages = with pkgs; [
          # cmdline
          cloc
          exiftool
          distrobox
          dnsmasq
          dnsutils
          ffmpeg
          github-cli
          jq
          ookla-speedtest
          texliveFull
          tldr
          tree
          wget

          # gui
          postman
          rpi-imager
          termius
          vscode
          zed-editor

        ];
      };
  };
}
