{ pkgs, ... }:

{
  users.users.mleone = {
    isNormalUser = true;
    home = "/home/mleone";
    extraGroups = [ "docker" "wheel" ];
    shell = pkgs.zsh;
    hashedPassword = "$6$5s822HvW7ds8laRP$T2ocJA3zYacwE3RFH3J79/DI2hPa8viTC.rjhTKehoPSKIbK3ukHoV9emP/kXih7R91egfxcNN6n6APkzjMkq1"; 
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBnsHRUgsp35/Bsae3afaJbQhCOfLZVK5hAxStuRkriF mike@powertools.dev"
    ];
  };

  nixpkgs.overlays = import ../../lib/overlays.nix ++ [
    (import ./vim.nix)
  ];
}
