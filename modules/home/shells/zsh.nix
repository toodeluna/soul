{ lib, systemConfiguration, ... }:
let
  cfg = systemConfiguration.soul.shells.zsh;
in
{
  config = lib.mkIf cfg.enable {
    catppuccin.zsh-syntax-highlighting.enable = true;

    programs.zsh = {
      enable = true;
      syntaxHighlighting.enable = systemConfiguration.soul.system.theme.enable;
    };
  };
}
