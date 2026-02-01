{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-new.url = "github:nixos/nixpkgs/nixos-25.11";
  };

  outputs =
    { nixpkgs, nixpkgs-new, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        system = system;
        config.allowUnfree = true;
      };

      pkgs-new = import nixpkgs-new {
        system = system;
        config.allowUnfree = true;
      };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          texliveFull
          pkgs-new.tex-fmt
        ];
      };
    };
}
