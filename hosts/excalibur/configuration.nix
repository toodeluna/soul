{
  self,
  inputs,
  pkgs,
  config,
  ...
}:
{
  custom = {
    input.fingerprint.enable = true;
    shells.zsh.enable = true;

    users.profile = {
      name = "Luna Heyman";
      username = "luna";
      shell = "zsh";
    };
  };

  homebrew.casks = [
    "stremio"
    "ghostty"
    "zen-browser"
    "microsoft-teams"
  ];

  environment.systemPackages = with pkgs; [
    just
    neovim
    vscode
    discord
    raycast
    speedtest-cli
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    nerd-fonts.jetbrains-mono
  ];
}
