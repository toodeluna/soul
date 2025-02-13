{ lib, config, ... }:
{
  options.soul.system.name = lib.mkOption {
    description = "The host name of the system.";
    example = "excalibur";
    type = lib.types.str;
  };

  config.networking.hostName = config.soul.system.name;
}
