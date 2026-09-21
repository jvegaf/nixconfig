{ den, __findFile, ... }:
{
  den.aspects.packet = {
    includes = [
      <den/primary-user>
      (<den/user-shell> "fish")
    ];

    nixos = {
      users.users.packet = {
        isNormalUser = true;
        description = "Tux User";
        initialHashedPassword = "$6$VdmHd0tV.cMZDMFC$CtdGlVaV/hPaZsIUoNqLNgOwmoYtEdqubc4FU3117Vz34LXl74uF6KOydC64LjOamMSd3X1a5AdI53mZOtRZv1";

        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJSHAzMVnHblW0xy4tdMxCZBpEsDRlh+khOMmYzJs5K/"
        ];
      };
    };

  };
}
