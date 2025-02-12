{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.soul.defaults.shell;
  username = config.soul.users.me.shortName;

  shellPackages = {
    bash = pkgs.bashInteractive;
    zsh = pkgs.zsh;
  };
in
{
  options.soul.defaults.shell = lib.mkOption {
    description = "The default shell.";
    default = "bash";
    type = lib.types.enum [
      "bash"
      "zsh"
    ];
  };

  config.users.users.${username}.shell = shellPackages.${cfg};
}
