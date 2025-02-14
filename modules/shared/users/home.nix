{ self, config, inputs, ... }:
let
  username = config.soul.users.me.shortName;
in
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = {
      inherit self;
      systemConfiguration = config;
    };

    users.${username}.imports = [
      inputs.catppuccin.homeManagerModules.catppuccin
      self.homeManagerModules.default
    ];
  };
}
