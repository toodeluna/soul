{ lib, config, ... }:
{
  options.soul.system.flake = lib.mkOption {
    description = "The path where the flake is located.";
    example = "/home/luna/soul";
    type = lib.types.nullOr lib.types.str;
  };

  config.programs.nh = {
    enable = true;
    flake = config.soul.system.flake;
    clean.enable = true;
  };
}
