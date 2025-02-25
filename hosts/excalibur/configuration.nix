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

    users.profile = {
      name = "Luna Heyman";
      username = "luna";
    };
  };

  programs.zsh.enable = true;
  environment.shells = [ pkgs.zsh ];

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
