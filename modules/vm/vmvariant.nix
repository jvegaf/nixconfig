{
  test.vmvariant = {
    nixos =
      {
        config,
        modulesPath,
        user,
        ...
      }:
      {
        virtualisation.vmVariant = {
          virtualisation = {
            cores = 4;
            diskSize = 20480;
            memorySize = 4096;
          };

          imports = [ (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix") ];
          services.displayManager.autoLogin = {
            enable = false;
            user = user.userName;
          };
        };
      };
  };
}
