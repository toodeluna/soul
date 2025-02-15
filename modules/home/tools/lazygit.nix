{ pkgs, ... }:
{
  programs.lazygit.enable = true;
  catppuccin.lazygit.enable = true;
  home.shellAliases.lg = "${pkgs.lazygit}/bin/lazygit";
}
