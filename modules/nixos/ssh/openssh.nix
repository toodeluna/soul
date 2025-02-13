{ lib, config, ... }:
let
  cfg = config.soul.ssh;
in
{
  options.soul.ssh.enable = lib.mkEnableOption "ssh";

  config = lib.mkIf cfg.enable {
    services.openssh.enable = true;
  };
}
