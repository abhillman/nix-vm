{ config, pkgs, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  users.users.aryehh = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      cowsay
      lolcat
    ];
    initialPassword = "password";
  };


  services.getty.autologinUser = "aryehh";

  services.openssh.enable = true;
  services.openssh.settings.X11Forwarding = true;

  system.stateVersion = "23.11";
}

