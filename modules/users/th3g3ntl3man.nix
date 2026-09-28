{ den, __findFile, ... }:
{
  den.aspects.th3g3ntl3man = {
    includes = [
      <den/primary-user>
      (<den/user-shell> "fish")
    ];

    nixos = {
      users.users.th3g3ntl3man = {
        isNormalUser = true;
        description = "The Gentleman";

        # openssh.authorizedKeys.keys = [
        #   "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJSHAzMVnHblW0xy4tdMxCZBpEsDRlh+khOMmYzJs5K/"
        # ];
      };
    };

  };
}
