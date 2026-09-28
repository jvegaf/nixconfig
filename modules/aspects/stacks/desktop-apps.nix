{ __findFile, inputs, ... }:
{
  pkt.desktop-apps = {
    includes = [
      # <pkt/flatpak>
      <pkt/kitty>
      <pkt/nautilus>
      <pkt/openrazer>
      <pkt/onepassword>
      # <pkt/sunshine>
      # <pkt/tailscale>
    ];

    nixos =
      { pkgs, user, ... }:
      {
        # imports = [ inputs.nix-flatpak.nixosModules.nix-flatpak ];
        #
        # services.flatpak.packages = [
        #   "app.fluxer.Fluxer"
        # ];

        users.users.${user.userName}.packages = with pkgs; [
          # https://apps.gnome.org/
          gnome-calculator
          gnome-disk-utility
          gnome-font-viewer

          firefox
          tor-browser
          localsend
          qbittorrent
          telegram-desktop
          vlc
        ];
      };

  };
}
