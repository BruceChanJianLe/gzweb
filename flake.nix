{
  description = "Gzweb here we go!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=release-20.03";
    nix_unstable_pkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { nixpkgs, ... } @ inputs:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      unstable_pkgs = inputs.nix_unstable_pkgs.legacyPackages.x86_64-linux;
    in
    {

      devShells.x86_64-linux.default = unstable_pkgs.mkShell {
        buildInputs = [
          unstable_pkgs.micromamba
          unstable_pkgs.protobuf3_21
          unstable_pkgs.cmake
          unstable_pkgs.libsForQt5.full
          unstable_pkgs.libsForQt5.qwt
          unstable_pkgs.tinyxml
          unstable_pkgs.freeimage
          unstable_pkgs.libtar
          unstable_pkgs.boost
          pkgs.nodejs-10_x
        ];

      };
    };
}
