{ lib, config, ... }:
let
  cfg = config.soul.networking.nginx;
in
{
  options.soul.networking.nginx = {
    enable = lib.mkEnableOption "nginx";
  };

  config.services.nginx = lib.mkIf cfg.enable {
    enable = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
  };
}
