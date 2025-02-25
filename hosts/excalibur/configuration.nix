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
    taps = builtins.attrNames config.nix-homebrew.taps;

    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };

    casks = [
      "stremio"
      "ghostty"
      "zen-browser"
      "microsoft-teams"
    ];
  };

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
