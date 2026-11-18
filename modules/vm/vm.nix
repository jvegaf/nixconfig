{ inputs, __findFile, ... }:
{
  den.aspects.fs0ciety = {
    includes = [ <test/vmvariant> ];
  };

  perSystem =
    { pkgs, system, ... }:
    {
      # nix run .#vm-kangaroo
      packages =
        if system != "x86_64-linux" then
          { }
        else
          {
            vm-fs0ciety = pkgs.writeShellApplication {
              name = "vm-fs0ciety";
              text = ''
                ${inputs.self.nixosConfigurations.fs0ciety.config.system.build.vm}/bin/run-fs0ciety-vm "$@"
              '';
            };
          };
    };
}
