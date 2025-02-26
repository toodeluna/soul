{ lib, config, ... }:
{
  options.custom.networking.ssl.enable = lib.mkEnableOption "ssl";

  config.security.acme = lib.mkIf config.custom.networking.ssl.enable {
    acceptTerms = true;
    defaults.email = config.custom.users.profile.email;
  };
}
