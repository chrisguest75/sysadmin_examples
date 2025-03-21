# flake.nix
{
    description = "A flake for using OSV scanner";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {nixpkgs, ...}: let
    system = "x86_64-linux";
    #       ↑ Swap it for your system if needed
    #       "aarch64-linux" / "x86_64-darwin" / "aarch64-darwin"
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    devShells.${system}.default = pkgs.mkShell {

      packages = [ 
          pkgs.osv-scanner
          pkgs.watchexec
       ];
      # ...
      env = {
      };

      shellHook = ''
        echo "***************************************************"
        echo "*** Welcome to osv-scanner environment ***"
        echo "***************************************************"
        echo ""
        echo "$(osv-scanner --version)"
        echo $(watchexec --version)
      '';

    };
  };
}
