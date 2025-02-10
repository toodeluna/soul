{ self, pkgs, ... }:
{
  services.nix-daemon.enable = true;
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
    "pipe-operators"
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

  environment.systemPackages = with pkgs; [
    git
    neovim
    lazygit
    vscode
    discord
  ];
}
