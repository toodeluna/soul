{ lib, systemConfiguration, ... }:
{
  imports = lib.soul.files.collectModuleImports ./.;
}
