{
  inputs,
  den,
  lib,
  ...
}:
{
  imports = [ inputs.den.flakeModule ];

  den.schema.user.classes = lib.mkDefault [ "homeManager" ];

  den.hosts.x86_64-linux.hermes.users.xfeusw = { };

  den.aspects.igloo = {
    includes = [ den.batteries.hostname ];
    nixos = { pkgs, ... }: { environment.systemPackages = [ pkgs.hello ]; };
    homeManager = { pkgs, ... }: { home.packages = [ pkgs.vim ]; };
  };
}
