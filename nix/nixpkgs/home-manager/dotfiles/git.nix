{ pkgs, ... }:
{
  programs.git = {
      enable = true;
      userName = "Michael Leone ";
      userEmail = "mike@powertools.dev";
      aliases = {
        prettylog = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(r) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
        root = "rev-parse --show-toplevel";
        lgr = "log --oneline --decorate --tags --parents --graph";
        br = "branch";
        co = "checkout";
        lgf = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''%C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all";
        ci = "commit";
        fl = "log -u";
        dl = "!git ll -1";
        gr = "grep -Ii";
        la = "!git config -l | grep alias | cut -c 7-";
        ir = "reset";
        r1 = "reset HEAD^";
        r2 = "reset HEAD^^";
        rh = "reset --hard";
        rh1 = "reset HEAD^ --hard";
        rh2 = "reset HEAD^^ --hard";
        wip = "commit -m {WIP}";

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
}
