{ lib, config, ... }:
{
  options.custom.fonts.enable = lib.mkEnableOption "fonts";
}
