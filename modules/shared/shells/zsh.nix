{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.soul.shells.zsh;
in
{
  options.soul.shells.zsh.enable = lib.mkEnableOption "zsh";

  config = lib.mkIf cfg.enable {
    programs.zsh.enable = true;
    environment.shells = [ pkgs.zsh ];
  };
}
