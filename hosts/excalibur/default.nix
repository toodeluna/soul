{
  self,
  inputs,
  pkgs,
  ...
}:
{
  soul = {
    fonts.enable = true;

    users.me = {
      shortName = "luna";
      fullName = "Luna Heyman";
      email = "luna.heyman@proton.me";
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
    neovim
    vscode
    discord
  ];
}
