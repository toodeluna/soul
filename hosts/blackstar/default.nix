{ pkgs, ... }:
{
  imports = [ ./disks.nix ];

  system.stateVersion = "24.11";
  networking.hostName = "blackstar";

  soul = {
    users.me = {
      shortName = "luna";
      fullName = "Luna Heyman";
    };
  };

  users.groups.luna = {};

  users.users.luna = {
    hashedPassword = "$y$j9T$mRU04ULTVP3VcjRv6w0Mh/$FHBN/V5MRcirNQx9pLpI.ISk7GSCbFWEedOoyRdoCz5";
    group = "luna";

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIxCvGO9OqARsPJl/bKRumMHC/zFgRyFLEVQrru/z7qr luna@excalibur"
    ];
  };

  environment.systemPackages = with pkgs; [
    git
    neovim
  ];
}
