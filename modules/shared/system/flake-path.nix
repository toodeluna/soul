{ lib, config, ... }:
{
  options.custom.system.flakePath = lib.mkOption {
    description = "The path to this flake.";
    example = "/home/luna/flake";
    type = lib.types.str;
  };
}
