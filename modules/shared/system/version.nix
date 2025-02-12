{
  self,
  pkgs,
  lib,
  ...
}:
{
  system = {
    stateVersion = lib.soul.systems.ternary pkgs "24.11" 6;
    configurationRevision = self.rev or self.dirtRev or null;
  };
}
