#!/usr/bin/env bash


sudo mv /etc/zshrc.backup-before-nix /etc/zshrc
sudo mv /etc/bashrc.backup-before-nix /etc/bashrc

sudo launchctl unload /Library/LaunchDaemons/org.nixos.darwin-store.plist
sudo rm -rf /Library/LaunchDaemons/org.nixos.darwin-store.plist

sudo launchctl unload /Library/LaunchDaemons/org.nixos.nix-daemon.plist
sudo rm -rf /Library/LaunchDaemons/org.nixos.nix-daemon.plist

sudo rm -rf /etc/nix /var/root/.nix-profile /var/root/.nix-defexpr /var/root/.nix-channels ~/.nix-profile ~/.nix-defexpr ~/.nix-channels

sudo rm -rf /etc/synthetic.conf \
    /etc/fstab \

sudo dscl . -rm /Groups/nixbld
for x in $(dscl . -list /Users|grep nix); do sudo dscl . -rm /Users/$x; done


sudo diskutil apfs deleteVolume /nix
sudo rm -rf /nix/

