{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        system = system;
        config.allowUnfree = true;
      };

    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          texliveFull
          tex-fmt
        ];
      };
    };
}
