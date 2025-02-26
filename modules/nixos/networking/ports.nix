{ lib, config, ... }:
{
  options.custom.networking.ports = lib.mkOption {
    description = "The open ports.";
    type = lib.types.listOf lib.types.ints.u16;
    default = [ ];
  };

  config.networking.firewall = {
    allowedTCPPorts = config.custom.networking.ports;
    allowedUDPPorts = config.custom.networking.ports;
  };
}
