{ lib, config, ... }:
let
  cfg = config.soul.networking;
in
{
  options.soul.networking.openPorts = lib.mkOption {
    description = "The open ports.";
    type = lib.types.listOf lib.types.ints.u16;
    default = [ ];
  };

  config.networking.firewall = {
    allowedTCPPorts = cfg.openPorts;
    allowedUDPPorts = cfg.openPorts;
  };
}
