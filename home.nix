{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;
  
  home.username = "guillem";
  home.homeDirectory = "/Users/guillem";

  home.stateVersion = "22.05";

  home.packages = [
    pkgs.curl
    pkgs.exa
    pkgs.fd
    pkgs.gdal
    pkgs.git
    pkgs.htop
    pkgs.jq
    pkgs.neovim
    pkgs.nixfmt
    pkgs.nmap
    pkgs.nodejs
    pkgs.octave
    pkgs.poetry
    (import ./python-packages.nix { pkgs = pkgs; })
    pkgs.ripgrep
    pkgs.rustup
    pkgs.tmux
    pkgs.unzip
    pkgs.wget
    pkgs.whois
    pkgs.yarn
  ];

  programs.git = {
    enable = true;
    userName = "GCBallesteros";
    userEmail = "dev+github@maxwellrules.com";
    extraConfig = {
      commit.gpgsign = true;
      gpg.format = "ssh";
      user.signingkey = "~/.ssh/github.pub";
    };
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

  xdg.configFile.nvim = {
    source = ./neovim;
    recursive = true;
  };

  xdg.configFile."tmux/tmux.conf".source = ./tmux/tmux.conf;

  programs.fzf = { enable = true; };

  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    enableAutosuggestions = true;
    enableCompletion = true;
    shellAliases = {
      sl = "exa --color=auto";
      ls = "exa --color=auto";
      ll = "exa -lah";
      la = "exa -la";
      mkdir = "mkdir -p";
      cat = "bat --style=plain";
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
      export PATH="$HOME/.pyenv/bin:$PATH"
      eval "$(pyenv init -)"
      eval "$(pyenv virtualenv-init -)"
    '';
  };

  home.sessionVariables = {
    PYENV_VIRTUALENV_DISABLE_PROMPT=1;
    EDITOR = "nvim";
  };
}
