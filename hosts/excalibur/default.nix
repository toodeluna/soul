{
  self,
  inputs,
  pkgs,
  ...
}:
{
  soul = {
    users.me = {
      shortName = "luna";
      fullName = "Luna Heyman";
    };

    defaults = {
      shell = "zsh";
    };

    shells = {
      zsh.enable = true;
    };
  };

  homebrew.casks = [
    "ghostty"
    "zen-browser"
    "microsoft-teams"
  ];

  environment.systemPackages = with pkgs; [
    git
    neovim
    lazygit
    vscode
    discord
  ];
}
