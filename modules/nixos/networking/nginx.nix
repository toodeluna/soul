{ lib, config, ... }:
{
  options.custom.networking.nginx.enable = lib.mkEnableOption "nginx";

  config.services.nginx = lib.mkIf config.custom.networking.nginx.enable {
    enable = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
  };
}
