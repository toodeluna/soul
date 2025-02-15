{ pkgs, ... }:
{
  programs.bottom.enable = true;
  catppuccin.bottom.enable = true;
  home.shellAliases.bottom = "${pkgs.bottom}/bin/btm";
}
