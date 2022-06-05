{ config, lib, pkgs, ... }:

let sources = import ../../nix/sources.nix; in {
  xdg.enable = true;

  #---------------------------------------------------------------------
  # Packages
  #---------------------------------------------------------------------

  # Packages I always want installed. Most packages I install using
  # per-project flakes sourced with direnv and nix-shell, so this is
  # not a huge list.
  home.packages = [
    pkgs.bat
    pkgs.fd
    pkgs.firefox
    pkgs.fzf
    pkgs.git-crypt
    pkgs.htop
    pkgs.jq
    pkgs.lsd
    pkgs.unzip
    pkgs.vivid
    pkgs.awscli
    pkgs.ripgrep
    pkgs.rofi
    pkgs.starship
    pkgs.autojump
    pkgs.stow
    pkgs.tree
    pkgs.watch
    pkgs.zathura
    pkgs._1password

    pkgs.go
    pkgs.gopls
    pkgs.zig-master

    pkgs.renderdoc
    pkgs.tlaplusToolbox
    pkgs.tetex
  ];

  #---------------------------------------------------------------------
  # Env vars and dotfiles
  #---------------------------------------------------------------------

  home.sessionVariables = {
    LANG = "en_US.UTF-8";
    LC_CTYPE = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    EDITOR = "nvim";
    PAGER = "less -FirSwX";
    MANPAGER = "sh -c 'col -bx | ${pkgs.bat}/bin/bat -l man -p'";
  };

  home.file.".functions".source = ./zsh/functions;
  home.file.".gdbinit".source = ./gdbinit;
  home.file.".inputrc".source = ./inputrc;

  xdg.configFile."i3/config".text = builtins.readFile ./i3;

  #---------------------------------------------------------------------
  # Programs
  #---------------------------------------------------------------------

  programs.gpg.enable = true;

  programs.rofi  = {
    enable = true;
    terminal = "${pkgs.alacritty}/bin/alacritty";
    theme = ./theme.rafi;
  };

  programs.bash = {
    enable = true;
    shellOptions = [];
    historyControl = [ "ignoredups" "ignorespace" ];
    initExtra = builtins.readFile ./bashrc;

    shellAliases = {
      ga = "git add";
      gc = "git commit";
      gco = "git checkout";
      gcp = "git cherry-pick";
      gdiff = "git diff";
      gl = "git prettylog";
      gp = "git push";
      gs = "git status";
      gt = "git tag";
    };
  };

  programs.direnv= {
    enable = true;

    config = {
      whitelist = {
        prefix= [
          "$HOME/code/go/src/github.com/hashicorp"
          "$HOME/code/go/src/github.com/mleonidas"
        ];

        exact = ["$HOME/.envrc"];
      };
    };
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = lib.strings.concatStrings (lib.strings.intersperse "\n" [
      "source ${sources.theme-bobthefish}/functions/fish_prompt.fish"
      "source ${sources.theme-bobthefish}/functions/fish_right_prompt.fish"
      "source ${sources.theme-bobthefish}/functions/fish_title.fish"
      (builtins.readFile ./config.fish)
      "set -g SHELL ${pkgs.fish}/bin/fish"
    ]);

    shellAliases = {
      ga = "git add";
      gc = "git commit";
      gco = "git checkout";
      gcp = "git cherry-pick";
      gdiff = "git diff";
      gl = "git prettylog";
      gp = "git push";
      gs = "git status";
      gt = "git tag";

      # Two decades of using a Mac has made this such a strong memory
      # that I'm just going to keep it consistent.
      pbcopy = "xclip";
      pbpaste = "xclip -o";
    };

    plugins = map (n: {
      name = n;
      src  = sources.${n};
    }) [
      "fish-fzf"
      "fish-foreign-env"
      "theme-bobthefish"
    ];
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    autocd = true;
    enableCompletion = true;
    shellAliases = {
      pbcopy = "xclip";
      pbpaste = "xclip -o";
      ssh = "ssh -A";
      more = "less";
      vim = "nvim";
      grep = "grep --color";
      tmux = "tmux -2";
      gitpp = "git pull --prune --all";
      gitc = "git commit -m";
      gitp = "git push";
      gss = "git status -s";
      gita = "git add .";
      gitph = "git push origin HEAD";
      sha = "git log | head -1";
      dc = "docker-compose";
      k = "kubectl";
      ls = "lsd";
      l = "ls -lFh";
      la = "ls -lAFh";
      lr = "ls -tRFh";
      ll = "ls -l";
    };

    history = {
      expireDuplicatesFirst = true;
      save = 1000000;
      size = 10000000;
    };

    initExtra = ''
      export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'
      export LS_COLORS=$(vivid generate solarized-dark)
      source $HOME/.config/zsh/functions
      bindkey -e
      bindkey '^U' backward-kill-line
      bindkey '^Q' push-line-or-edit
      bindkey -s "^L" 'sesh^M'
      eval "$(starship init zsh)"
    '';
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions";}
        { name = "zsh-users/zsh-history-substring-search";}
        { name = "/zdharma-continuum/fast-syntax-highlighting";}
      ];

    };
  };

  programs.git = {
    enable = true;
    userName = "Michael Leone ";
    userEmail = "mike@powertools.dev";
    aliases = {
      prettylog = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(r) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
      root = "rev-parse --show-toplevel";
    };
    extraConfig = {
      branch.autosetuprebase = "always";
      color.ui = true;
      core.askPass = ""; # needs to be empty to use terminal for ask pass
      credential.helper = "store"; # want to make this more secure
      github.user = "mleonidas";
      push.default = "tracking";
      init.defaultBranch = "main";
    };
  };

  programs.go = {
    enable = true;
    goPath = "code/go";
    goPrivate = [ "github.com/powertooldev"];
  };

  programs.tmux = {
    enable = true;
    terminal = "xterm-256color";
    shortcut = "l";
    secureSocket = false;

    extraConfig = ''
      set -ga terminal-overrides ",*256col*:Tc"

      set -g @dracula-show-battery false
      set -g @dracula-show-network false
      set -g @dracula-show-weather false

      bind -n C-k send-keys "clear"\; send-keys "Enter"

      run-shell ${sources.tmux-pain-control}/pain_control.tmux
      run-shell ${sources.tmux-dracula}/dracula.tmux
    '';
  };

  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 9.0;
	antialias = true;
        normal.family = "MesloLGMDZ Nerd Font Mono";
	bold.family = "MesloLGMDZ Nerd Font Mono";
	italic.family = "MesloLGMDZ Nerd Font Mono";
      };

      colors = {
        primary = {
          background = "0x002b36";
          foreground = "0x839496";
	};

	  # Normal colors
        normal = {
          black =   "0x073642";
	  red =     "0xdc322f";
	  green =   "0x859900";
	  yellow =  "0xb58900";
	  blue =    "0x268bd2";
	  magenta = "0xd33682";
	  cyan =    "0x2aa198";
	  white =   "0xeee8d5";
        };

        bright = {
          black =   "0x002b36";
	  red =     "0xcb4b16";
	  green =   "0x586e75";
	  yellow =  "0x657b83";
	  blue =    "0x839496";
	  magenta = "0x6c71c4";
	  cyan =    "0x93a1a1";
	  white =   "0xfdf6e3";
        };
      };
    };
  };

  programs.i3status = {
    enable = true;

    general = {
      colors = true;
      color_good = "#8C9440";
      color_bad = "#A54242";
      color_degraded = "#DE935F";
    };

    modules = {
      ipv6.enable = false;
      "wireless _first_".enable = false;
      "battery all".enable = false;
    };
  };

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
  };

  programs.autojump = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "tty";

    # cache the keys forever so we don't get asked for a password
    defaultCacheTtl = 31536000;
    maxCacheTtl = 31536000;
  };

  xresources.extraConfig = builtins.readFile ./Xresources;

  # Make cursor not tiny on HiDPI screens
  home.pointerCursor = {
    name = "Vanilla-DMZ";
    package = pkgs.vanilla-dmz;
    size = 128;
    x11.enable = true;
  };
}
