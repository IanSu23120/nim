{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable";
    mnw.url = "github:Gerg-L/mnw";
  };
  outputs = { self, nixpkgs, mnw, ...}@inputs:
  let
  allSystems = [
    "x86_64-linux"
    "aarch64-linux"
    "x86_64-darwin"
    "aarch64-darwin"
  ];
  forAllSystems = f: nixpkgs.lib.genAttrs allSystems (system: f system nixpkgs.legacyPackages.${system});
  in {
    # this is rule for flake need to name packages
    packages = forAllSystems (system: pkgs: {
      default = import ./default.nix { inherit mnw pkgs inputs; };
      dev = self.packages.${system}.default.devMode;
    });

    devShells = forAllSystems (system: pkgs:
      {
        default = pkgs.mkShellNoCC {
          packages = [
            pkgs.npins
            (pkgs.writeShellScriptBin "opt" ''
              npins --lock-file opt.json "$@"
            '')
            (pkgs.writeShellScriptBin "start" ''
              npins --lock-file start.json "$@"
            '')
            self.packages.${system}.dev
          ];
        };
      }
    );
  };
}
