{
  description = "Nix flake to build and run a NixOS VM for aarch64";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs }:
  let
    pkgs = import nixpkgs { system = "x86_64-linux"; };
    pkgsAarch64 = import nixpkgs { system = "aarch64-linux"; };

    iso = (pkgsAarch64.nixos {
      imports = [ "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-base.nix" ];
    }).config.system.build.isoImage;

    vmScript = pkgs.writeScriptBin "run-nixos-vm" ''
      #!${pkgs.runtimeShell}
      ${pkgs.qemu}/bin/qemu-system-aarch64 \
        -machine virt,gic-version=max \
        -cpu max \
        -m 2G \
        -smp 4 \
        -drive file=$(echo ${iso}/iso/*.iso),format=raw,readonly=on \
        -nographic \
        -bios ${pkgsAarch64.OVMF.fd}/FV/QEMU_EFI.fd
    '';

  in {
    defaultPackage.x86_64-linux = vmScript;
  };
}