{ den, __findFile, ... }:
{
  den.aspects.nixos = {
    includes = [
      <den/primary-user>
      (<den/user-shell> "zsh")
    ];

    nixos = {
      users.users.nixos = {
        isNormalUser = true;
        description = "Tux User";

        # openssh.authorizedKeys.keys = [
        #   "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJSHAzMVnHblW0xy4tdMxCZBpEsDRlh+khOMmYzJs5K/"
        # ];
      };
    };

  };
}
