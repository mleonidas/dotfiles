{ config, pkgs, ... }:

{

  imports = [
    ./dotfiles/zsh.nix
    ./dotfiles/starship.nix
    ./dotfiles/git.nix
  ];

  fonts.fontconfig.enable = true;

  home = {
    packages = with pkgs; [
      tree
      lsd
      ripgrep
      jq
      vivid
      autoconf
      automake
      bat
      stow
      awscli2
      glow
      direnv
      kubectl
      kubectx
      starship
      autojump
      bat
      tree-sitter
    ];
  };

  programs = {
    home-manager.enable = true;
    bottom.enable = true;
    direnv.enable = true;
    autojump.enable = true;
    };
  };
}
