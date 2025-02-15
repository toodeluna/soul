{ self, systemConfiguration, ... }:
let
  user = systemConfiguration.soul.users.me;
in
{
  programs.git = {
    enable = true;
    userName = user.fullName;
    userEmail = user.email;

    aliases = {
      lga = "log --all --decorate --graph --oneline";
      put = "push --set-upstream";
    };

    extraConfig = {
      init.defaultBranch = "main";
      core.ignorecase = false;
      pull.rebase = true;
    };
  };
}
