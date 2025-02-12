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
