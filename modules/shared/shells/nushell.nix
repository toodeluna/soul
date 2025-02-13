{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.soul.shells.nushell;
in
{
  options.soul.shells.nushell.enable = lib.mkEnableOption "nushell";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ pkgs.nushell ];
    environment.shells = [ pkgs.nushell ];
  };
}
