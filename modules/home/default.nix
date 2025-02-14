{ lib, systemConfiguration, ... }:
let
  username = systemConfiguration.soul.users.me.shortName;
  homeDirectory = systemConfiguration.users.users.${username}.home;
in
{
  imports = lib.soul.files.collectModuleImports ./.;

  home = {
    inherit username homeDirectory;
    stateVersion = "25.05";
  };
}
