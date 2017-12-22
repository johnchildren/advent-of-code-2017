{ nixpkgs ? import <nixpkgs> {}, compiler ? "ghc821" }:
let
  inherit (nixpkgs) pkgs;
in
  pkgs.haskell.packages.${compiler}.ghcWithHoogle
    (ps: with ps; [
      vector

      hlint
    ])
