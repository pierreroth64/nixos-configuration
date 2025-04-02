#!/usr/bin/env bash
nix build .#nixosConfigurations.vm.config.system.build.vm && ./result/bin/run-adara-vm
