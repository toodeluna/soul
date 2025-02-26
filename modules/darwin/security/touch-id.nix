{ config, ... }:
{
  config.security.pam.services.sudo_local.touchIdAuth = config.custom.input.fingerprint.enable;
}
