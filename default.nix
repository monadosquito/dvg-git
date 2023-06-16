let
    nixpkgs = pin.nixpkgs {};
    pin = import ./chr/pin.nix;
in
    {
        pkgs ? nixpkgs,
    }
    :
    pkgs.stdenv.mkDerivation
        {
            installPhase = pkgs.lib.readFile ./scr/instl.sh;
            name = "dvg-git";
            phases = ["installPhase"];
            src = ./src;
            gfg = 123;
        }
