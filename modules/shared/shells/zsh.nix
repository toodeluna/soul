{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.custom.shells.zsh.enable = lib.mkEnableOption "zsh";

  config = lib.mkIf config.custom.shells.zsh.enable {
    programs.zsh.enable = true;
    environment.shells = [ pkgs.zsh ];
  };
}
