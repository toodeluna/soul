{ pkgs, lib, config, ... }:
let
  cfg = config.soul.shells.fish;
in
{
  options.soul.shells.fish.enable = lib.mkEnableOption "fish";

  config = lib.mkIf cfg.enable {
    programs.fish.enable = true;
    environment.shells = [ pkgs.fish ];
  };
}
