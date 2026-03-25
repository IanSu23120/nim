{pkgs, mnw, inputs, ...}:
let
  npinsToPlugins = input: builtins.mapAttrs (_: v: v {inherit pkgs;}) (import ./npins.nix {inherit input;});
in
  mnw.lib.wrap pkgs {

    aliases = [
      "vi"
    ];
    appName = "nim";
    neovim = pkgs.neovim-unwrapped;

    luaFiles = [
      ./nvim/init.lua
    ];

    plugins = {
      dev.nim = {
        pure = ./nvim;
        impure = "/home/iansu/nim/nvim";
      };

      start = import ./packages/start.nix {inherit pkgs;};
      #startAttrs = npinsToPlugins ./packages/start.json;
      opt = import ./packages/opt.nix {inherit pkgs;};
      optAttrs = npinsToPlugins ./packages/opt.json;
    };
    extraBinPath = import ./packages/binaries.nix {inherit pkgs;};
  }
