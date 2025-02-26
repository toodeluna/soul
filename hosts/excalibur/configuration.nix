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

    system.packages = {
      inherit (pkgs)
        neovim
        vscode
        discord
        raycast
        ;
    };

    brew.packages = [
      "stremio"
      "ghostty"
      "zen-browser"
      "microsoft-teams"
    ];
  };

  fonts.packages = with pkgs; [
    jetbrains-mono
    nerd-fonts.jetbrains-mono
  ];
}
