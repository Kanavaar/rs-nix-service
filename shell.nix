{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/a1c45f32e6450f052525fec74b9db0154844c638.tar.gz) {} }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [ pkg-config ]
  buildInputs = with pkgs; [
    cargo
    mold
    openssl
    libressl
  ];
}
