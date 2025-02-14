{ self, lib, systemConfiguration, ... }:
let
  cfg = systemConfiguration.soul.system.theme;
in
{
  catppuccin = {
    enable = cfg.enable;
    flavor = import (self + "/data/catppuccin-flavor.nix");
  };
}
