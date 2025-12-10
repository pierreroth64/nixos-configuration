{ userName, ... }:
{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.my.${userName}.programming;
in
{

  config = lib.mkIf cfg.enable {
    home-manager.users.${userName}.home.packages = with pkgs; [
      bacon
      cargo
      cargo-audit
      cargo-binutils
      cargo-bloat
      cargo-deny
      cargo-flamegraph
      cargo-fuzz
      cargo-generate
      cargo-llvm-cov
      cargo-modules
      cargo-nextest
      cargo-semver-checks
      cargo-watch
      clippy
      rustc
      rust-analyzer
      rustfmt
    ];
  };
}
