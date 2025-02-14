{
  self,
  lib,
  config,
  ...
}:
let
  cfg = config.soul.system.theme;
in
{
  catppuccin = {
    enable = cfg.enable;
    flavor = import (self + "/data/catppuccin-flavor.nix");
  };
}
