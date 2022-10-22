{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;

  home.username = "garfield";
  home.homeDirectory = "/Users/garfield";

  home.stateVersion = "22.05";

  home.packages = [
    pkgs.curl
    pkgs.exa
    pkgs.gdal
    pkgs.git
    pkgs.htop
    pkgs.jq
    pkgs.neovim
    pkgs.nmap
    pkgs.poetry
    (import ./python-packages.nix { pkgs = pkgs; })
    pkgs.ripgrep
    pkgs.rustup
    pkgs.tmux
    pkgs.unzip
    pkgs.wget
    pkgs.whois
  ];

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      username = {disabled = false;};
    };
  };

  programs.bat = {
    enable = true;
    config = {
      theme = "GitHub";
      italic-text = "always";
    };
  };

  xdg.configFile.nvim = {
    source = ./neovim;
    recursive = true;
  };

  programs.fzf = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    enableAutosuggestions = true;
    enableCompletion = true;
    shellAliases = {
      sl = "exa --color=auto";
      ls = "exa --color=auto";
      ll="exa -lah";
      la = "exa -la";
      mkdir = "mkdir -p";
      cat = "bat --style=plain";
    };
    history = {
      size = 5000;
      save = 5000;
      ignorePatterns = ["ls" "[bf]g" "exit" "reset" "clear" "cd" "cd .." "cd.."];
      share = true;
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
