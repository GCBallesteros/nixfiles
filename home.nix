{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;
  
  home.username = "guillem";
  home.homeDirectory = "/Users/guillem";

  home.stateVersion = "22.05";

  home.packages = [
    pkgs.curl
    pkgs.cmake
    pkgs.dbmate
    pkgs.eza
    pkgs.fd
    pkgs.gdal
    pkgs.git
    pkgs.htop
    pkgs.hurl
    pkgs.jq
    pkgs.luajit
    pkgs.neovim
    pkgs.nixfmt
    pkgs.nmap
    pkgs.nodejs
    pkgs.octave
    pkgs.poetry
    (import ./python-packages.nix { pkgs = pkgs; })
    pkgs.postgresql_15
    pkgs.radare2
    pkgs.ripgrep
    pkgs.rustup
    pkgs.tmux
    pkgs.unzip
    pkgs.wget
    pkgs.whois
    pkgs.yarn
    pkgs.zellij
  ];

  programs.git = {
    enable = true;
    userName = "GCBallesteros";
    userEmail = "dev+github@maxwellrules.com";
    #extraConfig = {
    #  commit.gpgsign = true;
    #  gpg.format = "ssh";
    #  user.signingkey = "~/.ssh/github.pub";
    #};
  };

  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = {
        identityFile = "~/.ssh/github";
        identitiesOnly = true;
      }; 
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = { username = { disabled = false; }; };
  };

  programs.bat = {
    enable = true;
    config = {
      theme = "Dracula";
      italic-text = "always";
    };
  };

  # xdg.configFile.nvim = {
  #  source = ./neovim;
  #  recursive = true;
  # };

  xdg.configFile."tmux/tmux.conf".source = ./tmux/tmux.conf;
  xdg.configFile."zellij/config.kdl".source = ./zellij/config.kdl;

  programs.atuin = { enable = true; };

  xdg.configFile."atuin/config.toml".source = ./atuin/config.toml;

  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    enableAutosuggestions = true;
    enableCompletion = true;
    shellAliases = {
      sl = "eza --color=auto";
      ls = "eza --color=auto";
      ll = "eza -lah";
      la = "eza -la";
      mkdir = "mkdir -p";
      cat = "bat";
    };
    history = {
      size = 5000;
      save = 5000;
      ignorePatterns =
        [ "ls" "[bf]g" "exit" "reset" "clear" "cd" "cd .." "cd.." ];
      share = true;
    };

    initExtra = ''
      export PYENV_ROOT=$HOME/.pyenv
      export PATH="$HOME/.pyenv/bin:/opt/homebrew/bin:$PATH"
      eval "$(pyenv init -)"
      eval "$(pyenv virtualenv-init -)"
    '';
  };

  home.sessionVariables = {
    PYENV_VIRTUALENV_DISABLE_PROMPT=1;
    EDITOR = "nvim";
  };
}
