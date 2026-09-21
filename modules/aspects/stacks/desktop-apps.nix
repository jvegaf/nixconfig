{ __findFile, inputs, ... }:
{
  pkt.desktop-apps = {
    includes = [
      <pkt/flatpak>
      <pkt/kitty>
      <pkt/nautilus>
      <pkt/openrazer>
      <pkt/sunshine>
      <pkt/tailscale>
    ];

    nixos =
      { pkgs, user, ... }:
      {
        imports = [ inputs.nix-flatpak.nixosModules.nix-flatpak ];

        services.flatpak.packages = [
          "app.fluxer.Fluxer"
        ];

        users.users.${user.userName}.packages = with pkgs; [
          # https://apps.gnome.org/
          baobab
          eyedropper
          gnome-calculator
          gnome-characters
          gnome-disk-utility
          gnome-font-viewer
          gnome-logs
          impression
          loupe
          papers

          anki
          firefox
          localsend
          obs-studio
          qbittorrent
          telegram-desktop
          vlc
          zoom-us
        ];
      };

  };
}
