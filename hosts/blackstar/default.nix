{ pkgs, ... }:
{
  imports = [ ./disks.nix ./hardware.nix ];

  services.openssh.enable = true;

  soul = {
    system.name = "blackstar";

    users.me = {
      shortName = "luna";
      fullName = "Luna Heyman";
      password = "$y$j9T$mRU04ULTVP3VcjRv6w0Mh/$FHBN/V5MRcirNQx9pLpI.ISk7GSCbFWEedOoyRdoCz5";
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
