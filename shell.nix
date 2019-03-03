{ pkgs ? import <nixpkgs> {} }:

let
  pp2n = import (pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "psc-package2nix";
    rev = "cc48ccd64862366a44b4185a79de321f93755782";
    sha256 = "0cvd1v3d376jiwh4rfhlyijxw3j6jp9rkm9hdb7k7sjxqs1dsviv";
  }) { inherit pkgs; };

  easy-ps = import (pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "easy-purescript-nix";
    rev = "5d8808480436f178ccdc6593744cb6ca642cbb6c";
    sha256 = "0r80d4dmagvkgm44rpjszl84xwgcwdbks2x9inad7akcpmkc8nnh";
  });

in pkgs.stdenv.mkDerivation {
  name = "pp2n-test-shell";
  buildInputs = [pp2n easy-ps.purs];
}
