{ config, pkgs, ... } :

{
  environment.systemPackages = (with pkgs; [
    ardour
  ]);
}
