{
  pkt.orcaslicer = {
    homeManager =
      {
        config,
        pkgs,
        user,
        ...
      }:

      let
        # Ruta absoluta a tu repositorio de dotfiles
        dotfilesDir = "/home/${user.username}/nixdots/dotfiles";
      in
      {
        home.packages = with pkgs; [
          orca-slicer
        ];

        # Enlace simbólico fuera del Nix Store
        home.file.".config/OrcaSlicer".source =
          config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/OrcaSlicer";
      };
  };
}
