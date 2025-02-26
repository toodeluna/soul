{
  lib,
  config,
  pkgs,
  ...
}:
let
  shell = config.custom.users.profile.shell;
in
{
  options.custom.users.profile.shell = lib.mkOption {
    description = "The default shell for the main user.";
    default = "bash";

    type = lib.types.enum [
      "bash"
      "zsh"
    ];
  };

  config = {
    users.users.profile.shell = if shell == "bash" then pkgs.bashInteractive else pkgs.${shell};

    assertions = [
      {
        assertion = shell == "bash" || config.custom.shells.${shell}.enable;
        message = "The default shell must be enabled.";
      }
    ];
  };
}
