{ lib, config, ... }:
{
  options.custom.fonts.extraPackages = lib.mkOption {
    description = "Extra fonts to install.";
    default = [ ];
    type = lib.types.listOf lib.types.package;
  };

  config.fonts.packages = lib.mkIf config.custom.fonts.enable config.custom.fonts.extraPackages;
}
