# system tools
{ pkgs, ... }:
with pkgs;
[
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
