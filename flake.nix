{
  description = "Gzweb here we go!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=release-20.03";
    # nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { nixpkgs, ... } @ inputs:
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in
  {

    packages.x86_64-linux.hello = pkgs.hello;

    devShells.x86_64-linux.default = pkgs.mkShell {
      buildInputs = [
        # pkgs.cowsay
        pkgs.nodejs-10_x
      ];
    };

  };
}
