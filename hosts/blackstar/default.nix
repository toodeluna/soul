{ pkgs, ... }:
{
  imports = [
    ./disks.nix
    ./hardware.nix
  ];

  services.openssh.enable = true;

  soul = {
    system.name = "blackstar";

    users.me = {
      shortName = "luna";
      fullName = "Luna Heyman";
    };
  };

  users.users.root = {
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIxCvGO9OqARsPJl/bKRumMHC/zFgRyFLEVQrru/z7qr luna@excalibur"
    ];
  };

  users.users.luna = {
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIxCvGO9OqARsPJl/bKRumMHC/zFgRyFLEVQrru/z7qr luna@excalibur"
    ];
  };

  environment.systemPackages = with pkgs; [
    git
    neovim
  ];
}
