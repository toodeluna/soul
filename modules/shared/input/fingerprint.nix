{ lib, ... }:
{
  options.custom.input.fingerprint.enable = lib.mkEnableOption "fingerprint";
}
