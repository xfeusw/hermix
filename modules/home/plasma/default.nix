{
  config,
  pkgs,
  inputs,
  ...
}:
let
  space-grotesk = inputs.space-grotesk.packages.${pkgs.system}.default;
in
{
  home.packages = [
    # space-grotesk
  ];
}
