{
  pkt.font = {
    # https://wiki.nixos.org/wiki/Fonts
    nixos =
      { pkgs, ... }:
      {
        fonts = {
          enableDefaultPackages = true;

          packages = with pkgs; [
            corefonts
            jetbrains-mono
            nerd-fonts.commit-mono
            nerd-fonts.fantasque-sans-mono
            nerd-fonts.fira-code
            nerd-fonts.jetbrains-mono
            noto-fonts
            noto-fonts-color-emoji
            open-sans
          ];

          fontconfig = {
            enable = true;

            defaultFonts = {
              monospace = [
                "Noto Sans Mono"
              ];

              sansSerif = [
                "Noto Sans"
              ];

              serif = [
                "Noto Serif"
              ];
            };
          };
        };
      };
  };
}
