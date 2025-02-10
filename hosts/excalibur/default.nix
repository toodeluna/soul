{ self, inputs, pkgs, ... }:
{
  services.nix-daemon.enable = true;
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
    "pipe-operator"
  ];

  programs.zsh.enable = true;
  environment.shells = [ pkgs.zsh ];

  system = {
    stateVersion = 6;
    configurationRevision = self.rev or self.dirtRev or null;
  };

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
  ];
}
