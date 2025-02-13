{ pkgs, inputs, ... }:
{
  environment.systemPackages = [ inputs.agenix.packages.${pkgs.stdenv.system}.default ];
}
