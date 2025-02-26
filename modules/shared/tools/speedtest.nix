{
  pkgs,
  lib,
  config,
  ...
}:
{
  options.custom.tools.speedtest.enable = lib.mkEnableOption "speedtest";

  config.custom.system.packages = lib.mkIf config.custom.tools.speedtest.enable {
    inherit (pkgs) speedtest-cli;
  };
}
