{ config, ... }:
{
  environment.variables.FLAKE = config.custom.system.flakePath;
}
