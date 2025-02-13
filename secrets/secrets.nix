let
  blackstar = {
    user = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG5YtxIGH31mTyTOfyXC30XhFJw7k1WBN2vbStIjs/0v luna@blackstar";
    system = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKC2rUpoEfhGY22ymkfmH5ZiYBUfvDUpHUbBy5ZwdzyY root@blackstar";
  };
in
{
  "password.age".publicKeys = [ blackstar.user blackstar.system ];
}
