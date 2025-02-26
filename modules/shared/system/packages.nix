{ lib, config, ... }:
{
  options.custom.system.packages = lib.mkOption {
    description = "Extra packages to install.";
    default = { };
    type = lib.types.attrsOf lib.types.package;
  };

  config.environment.systemPackages = builtins.attrValues config.custom.system.packages;
}
