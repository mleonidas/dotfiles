{pkgs, ...}:
{
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

      envExtra =  ''
        source ~/.flowcode/functions/activate
        '';

      initExtra = ''
        export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'
        export LS_COLORS=$(vivid generate solarized-dark)
        export PATH=$PATH:$HOME/.bin
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
}
