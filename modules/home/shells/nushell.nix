{ lib, systemConfiguration, ... }:
let
  cfg = systemConfiguration.soul.shells.nushell;
in
{
  config = lib.mkIf cfg.enable {
    programs.nushell.enable = true;
  };
}
