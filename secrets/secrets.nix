with import ../config/ssh.nix;
{
  "password.age".publicKeys = [
    blackstar.luna
    blackstar.root
  ];
}
