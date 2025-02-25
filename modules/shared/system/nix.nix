{ pkgs, ... }:
let
  sudoers = if pkgs.stdenv.hostPlatform.isLinux then "@wheel" else "@admin";
in
{
  nix = {
    channel.enable = false;
    optimise.automatic = true;
    gc.automatic = pkgs.stdenv.hostPlatform.isDarwin;

    settings = {
      keep-going = true;
      warn-dirty = false;
      use-xdg-base-directories = true;

      allowed-users = [ sudoers ];
      trusted-users = [ sudoers ];

      experimental-features = [
        "nix-command"
        "flakes"
        "pipe-operators"
      ];
    };
  };
}
