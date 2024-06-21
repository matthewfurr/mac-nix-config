{ pkgs, pwnvim, ... }:
{
  # Don't change this when you change package input. Leave it alone.
  home.stateVersion = "23.11";
  # home-manager configs
  home.packages = with pkgs; [
    ripgrep
    fd
    curl
    less
    pwnvim.packages."aarch64-darwin".default
  ];
  home.sessionVariables = {
    PAGER = "less";
    CLICLOLOR = 1;
    EDITOR = "nvim";
  };
  programs.bat.enable = true;
  programs.bat.config.theme = "TwoDark";
  programs.fzf.enable = true;
  programs.fzf.enableZshIntegration = true;
  programs.exa.enable = true;
  programs.git.enable = true;
  programs.zsh.enable = true;
  programs.zsh.enableCompletion = true;
  programs.zsh.enableAutosuggestions = true;
  programs.zsh.enableSyntaxHighlighting = true;
  programs.zsh.shellAliases = {
    ls = "ls --color=auto -laF";
    nixswitch = "darwin-rebuild switch --flake ~/src/system-config/.#";
    nixup = "pushd ~/Code/nix-system-config; nix flake update; nixswitch; popd";
  };
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      scan_timeout = 10;
      character = {
        success_symbol = "➜";
        error_symbol = "➜";
      };
    };
  };
  programs.alacritty = {
    enable = true;
    # settings.font.normal.family = "MesloLGS Nerd Font Mono";
    # settings.font.size = 16;
  };
  home.file.".inputrc".source = ./dotfiles/inputrc;
}
