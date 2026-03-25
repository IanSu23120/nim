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

    #rapperArgs = [
    #  "--run"
    #  "eval \"$(devenv direnvrc)\""
    #];
    wrapperArgs = [
        "--run" ''
        # 檢查當前目錄是否有 .envrc，有的話就加載環境
        if [ -f .envrc ] && command -v direnv >/dev/null; then
          echo "Devenv: Auto-loading environment via direnv..."
          eval "$(direnv export bash)"
        fi
      ''
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
