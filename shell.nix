{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    cargo
    mold
    openssl
    pkg-config
  ];

  shellHook = ''
    pkg-config
  ''
}
