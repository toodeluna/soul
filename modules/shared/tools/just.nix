{ pkgs, ... }:
{
  custom.system.packages = { inherit (pkgs) just; };
}
