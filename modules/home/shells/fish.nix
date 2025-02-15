{ lib, systemConfiguration, ... }:
let
  cfg = systemConfiguration.soul.shells.fish;
in
{
  config = lib.mkIf cfg.enable {
    catppuccin.fish.enable = true;

    programs.fish = {
      enable = true;
      interactiveShellInit = "fish_vi_key_bindings";
    };
  };
}
