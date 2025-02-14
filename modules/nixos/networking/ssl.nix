{ self, lib, config, ... }:
let
  cfg = config.soul.networking.ssl;
  email = config.soul.users.me.email;
in
{
  options.soul.networking.ssl = {
    enable = lib.mkEnableOption "ssl";
  };

  config = lib.mkIf cfg.enable {
    age.secrets.porkbun-credentials.file = self + "/secrets/porkbun-credentials.age";

    security.acme = lib.mkIf cfg.enable {
      acceptTerms = true;
      defaults = { inherit email; };
    };
  };
}
