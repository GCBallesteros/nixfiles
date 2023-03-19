{ pkgs }:

pkgs.python3.withPackages (p:
  with p; [
    ipython # interactive shell
    jupyter # interactive notebooks
    jupyterlab # Better interactive notebooks
    matplotlib # plots
    numpy # numerical computation
    scipy # numerical computation
    pandas # data analysis
    requests # HTTP library
    setuptools # setup.py
  ])
