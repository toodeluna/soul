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
  };

  programs.zsh.enable = true;
  environment.shells = [ pkgs.zsh ];

  users = {
    knownUsers = [ "luna" ];

    users.luna = {
      uid = 501;
      createHome = true;
      description = "Luna Heyman";
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
