{ pkgs }:

self: super:

with { inherit (pkgs.stdenv) lib; };

with pkgs.haskell.lib;

{
  dura = (
    with rec {
      duraSource = pkgs.lib.cleanSource ../.;
      duraBasic  = self.callCabal2nix "dura" duraSource { };
    };
    overrideCabal duraBasic (old: {
    })
  );
}
