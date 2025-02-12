{ lib, ... }:
{
  imports = lib.soul.files.collectModuleImports ./.;
}
