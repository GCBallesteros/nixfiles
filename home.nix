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
    pkgs.fzf
    pkgs.gdal
    pkgs.git
    pkgs.htop
    pkgs.hurl
    pkgs.imagemagick
    pkgs.jq
    pkgs.luajit
    pkgs.neovim
    pkgs.nixfmt-classic
    pkgs.nmap
    pkgs.nodejs
    pkgs.poetry
    (import ./python-packages.nix { pkgs = pkgs; })
    pkgs.postgresql_15
    pkgs.qmk
    pkgs.ripgrep
    pkgs.rsync
    pkgs.rustup
    pkgs.stylua
    pkgs.tmux
    pkgs.unzip
    pkgs.wget
    pkgs.whois
    pkgs.nix-prefetch-github
  ];

  programs.direnv = {
    enable = true;
    enableZshIntegration = true; # see note on other shells below
    nix-direnv.enable = true;
  };

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
      theme = "GitHub";
      italic-text = "always";
    };
  };

  programs.pyenv = { enable = true; };

  home.file."${config.xdg.configHome}/nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink ./neovim;
    recursive = true;
  };

  #xdg.configFile."tmux/tmux.conf".source = ./tmux/tmux.conf;

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    autosuggestion.enable = true;
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
      size = 10000;
      save = 10000;
      ignorePatterns =
        [ "ls" "[bf]g" "exit" "reset" "clear" "cd" "cd .." "cd.." ];
      share = true;
    };

    # Still need to remember to install pyenv-virtualenv manually
    # https://github.com/pyenv/pyenv-virtualenv
    initExtra = ''
      eval "$(pyenv virtualenv-init -)"
    '';
  };

  home.sessionVariables = {
    PYENV_VIRTUALENV_DISABLE_PROMPT = 1;
    EDITOR = "nvim";
  };
}
