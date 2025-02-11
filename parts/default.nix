{ inputs, lib, ... }:
{
  systems = import inputs.systems;
  imports = lib.soul.files.collectModuleImports ./.;
}
