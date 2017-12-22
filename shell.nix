{ nixpkgs ? import <nixpkgs> {}, compiler ? "ghc821" }:
let
  inherit (nixpkgs) pkgs;
  ghc = import ./default.nix { inherit nixpkgs compiler; };
in
pkgs.stdenv.mkDerivation {
  name = "advent-of-code-env";
  buildInputs = [ ghc ];
  shellHook = "eval $(egrep ^export ${ghc}/bin/ghc)";
}
