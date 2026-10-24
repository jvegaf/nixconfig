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
    ];

    nixos =
      { pkgs, user, ... }:
      {
        users.users.${user.userName}.packages = with pkgs; [
          # cmdline
          cloc
          exiftool
          dnsmasq
          dnsutils
          github-cli
          jq
          tldr
          tree
          wget
          nodejs

          # gui
          # postman
          termius
          # vscode
          zed-editor

        ];
      };
  };
}
