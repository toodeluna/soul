{ lib, ... }:
{
  systems = [ "aarch64-darwin" ];
  imports = lib.soul.files.collectModuleImports ./.;
}
