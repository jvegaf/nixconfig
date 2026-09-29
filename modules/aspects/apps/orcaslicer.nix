{
  pkt.orcaslicer = {
    homeManager =
      {
        config,
        pkgs,
        ...
      }:

      let
        # Ruta absoluta a tu repositorio de dotfiles
        dotfilesDir = "/home/th3g3ntl3man/nixconfig/dotfiles";
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
