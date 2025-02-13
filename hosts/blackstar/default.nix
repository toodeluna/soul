{ pkgs, ... }:
{
  imports = [ ./disks.nix ./hardware.nix ];

  system.stateVersion = "24.11";
  networking.hostName = "blackstar";
  services.openssh.enable = true;

  soul = {
    users.me = {
      shortName = "luna";
      fullName = "Luna Heyman";
    };
  };

  users.users.root = {
    hashedPassword = "$y$j9T$mRU04ULTVP3VcjRv6w0Mh/$FHBN/V5MRcirNQx9pLpI.ISk7GSCbFWEedOoyRdoCz5";

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIxCvGO9OqARsPJl/bKRumMHC/zFgRyFLEVQrru/z7qr luna@excalibur"
    ];
  };

  users.groups.luna = {};

  users.users.luna = {
    hashedPassword = "$y$j9T$mRU04ULTVP3VcjRv6w0Mh/$FHBN/V5MRcirNQx9pLpI.ISk7GSCbFWEedOoyRdoCz5";
    group = "luna";
    extraGroups = [ "wheel" ];

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIxCvGO9OqARsPJl/bKRumMHC/zFgRyFLEVQrru/z7qr luna@excalibur"
    ];
  };

  environment.systemPackages = with pkgs; [
    git
    neovim
  ];
}
