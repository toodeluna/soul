{
  self,
  inputs,
  pkgs,
  config,
  ...
}:
{
  programs.zsh.enable = true;
  environment.shells = [ pkgs.zsh ];

  system = {
    stateVersion = 6;
    configurationRevision = self.rev or self.dirtRev or null;
    activationScripts.postUserActivation.text = "/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u";

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };

    defaults = {
      LaunchServices.LSQuarantine = false;

      dock = {
        orientation = "left";
        autohide = true;
        autohide-delay = 0.0;
        autohide-time-modifier = 1.0;
        static-only = false;
        show-recents = false;
        showhidden = false;
        mru-spaces = false;
      };

      trackpad = {
        Clicking = true;
        TrackpadRightClick = true;
      };

      NSGlobalDomain = {
        KeyRepeat = 3;
        InitialKeyRepeat = 15;
        AppleInterfaceStyle = "Dark";
        AppleMeasurementUnits = "Centimeters";
        AppleTemperatureUnit = "Celsius";
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
      };
    };
  };

  nix = {
    channel.enable = false;
    optimise.automatic = true;
    gc.automatic = true;

    settings = {
      keep-going = true;
      warn-dirty = false;
      use-xdg-base-directories = true;

      allowed-users = [ "@admin" ];
      trusted-users = [ "@admin" ];

      experimental-features = [
        "nix-command"
        "flakes"
        "pipe-operators"
      ];
    };
  };

  security = {
    pam.services.sudo_local.touchIdAuth = true;
    sudo.extraConfig = "Defaults env_reset,pwfeedback";
  };

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

  nixpkgs.config = {
    allowUnfree = true;
    allowAliases = false;
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
