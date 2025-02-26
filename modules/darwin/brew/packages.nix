{ lib, config, ... }:
{
  options.custom.brew.packages = lib.mkOption {
    description = "Extra homebrew packages to install.";
    default = [ ];
    type = lib.types.listOf lib.types.str;
  };

  config.homebrew.casks = config.custom.brew.packages;
}
