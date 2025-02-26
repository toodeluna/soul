{ lib, config, ... }:
{
  options.custom.ssh.enable = lib.mkEnableOption "ssh";
  config.services.openssh.enable = config.custom.ssh.enable;
}
