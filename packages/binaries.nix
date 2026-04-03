# system tools
{ pkgs, ... }:
with pkgs;
[
  wordnet
  direnv
  sops
  age
  xclip
  wl-clipboard-rs

  gemini-cli

  fzf
  ripgrep

  # lua
  lua-language-server
  stylua

  # nix
  nixd
  nixfmt

  prettier
]
