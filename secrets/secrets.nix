with import ../config/ssh.nix;
{
  "password.age".publicKeys = [
    blackstar.luna
    blackstar.root
  ];

  "porkbun-credentials.age".publicKeys = [
    blackstar.luna
    blackstar.root
    excalibur.luna
  ];
}
