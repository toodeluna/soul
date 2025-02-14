{ self, systemConfiguration, ... }:
let
  user = systemConfiguration.soul.users.me;
  gitConfig = import (self + "/data/git-config.nix");
in
{
  programs.git = {
    inherit (gitConfig) aliases;
    enable = true;
    userName = user.fullName;
    userEmail = user.email;
    extraConfig = gitConfig.config;
  };
}
