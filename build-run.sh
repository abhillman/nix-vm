#!/usr/bin/env sh

nix-build '<nixpkgs/nixos>' \
  --attr vm \
  -I nixpkgs=channel:nixos-23.11 \
  -I nixos-config=./configuration.nix

QEMU_KERNEL_PARAMS=console=ttyS0 ./result/bin/run-nixos-vm -nographic
reset 
