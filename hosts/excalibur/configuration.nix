{ pkgs, ... }:
{
  custom = {
    input.fingerprint.enable = true;
    shells.zsh.enable = true;
    fonts.enable = true;

    users.profile = {
      name = "Luna Heyman";
      username = "luna";
      email = "luna.heyman@proton.me";
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
}
