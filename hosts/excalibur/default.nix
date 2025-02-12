{
  self,
  inputs,
  pkgs,
  ...
}:
{
  services.nix-daemon.enable = true;

  programs.zsh.enable = true;
  environment.shells = [ pkgs.zsh ];

  users = {
    knownUsers = [ "luna" ];

    users.luna = {
      uid = 501;
      description = "Luna Heyman";
      shell = pkgs.zsh;
      home = "/Users/luna";
    };
  };

  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    mutableTaps = false;
    user = "luna";

    taps = {
      "homebrew/homebrew-core" = inputs.homebrew-core;
      "homebrew/homebrew-bundle" = inputs.homebrew-bundle;
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
    };
  };

  homebrew = {
    enable = true;

    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };

    casks = [
      "ghostty"
      "zen-browser"
      "microsoft-teams"
    ];
  };

  environment.systemPackages = with pkgs; [
    git
    neovim
    lazygit
    vscode
    discord
    just
  ];
}
