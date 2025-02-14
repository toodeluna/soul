{
  flake = {
    sharedModules.default = ../modules/shared;
    darwinModules.default = ../modules/darwin;
    nixosModules.default = ../modules/nixos;
    homeManagerModules.default = ../modules/home;
  };
}
