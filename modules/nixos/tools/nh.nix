{ config, ... }:
{
  programs.nh = {
    enable = true;
    flake = config.custom.system.flakePath;
    clean.enable = true;
  };
}
