{ den, ... }:
{
  den.schema.host.home-manager.enable = true;
  den.schema.host.includes = [ den.batteries.user-aspects ];
}
