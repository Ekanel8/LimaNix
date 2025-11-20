{
  description = "Jarvis Configuration v1";

  inputs = {
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

  };

  outputs = inputs@{ self, nixpkgs, unstable, home-manager, ... }:
	let
		lib = nixpkgs.lib;
		system = "x86_64-linux";
		pkgs = nixpkgs.legacyPackages.${system};
		unstablepkgs = import unstable {
      inherit system;
      config.allowUnfree = true;
    };
	in {
	nixosConfigurations = {
      jarvis = lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit unstablepkgs;
        };
        modules = [
          ./configuration.nix
        ];
      };
    };

	homeConfigurations = {
		doc = home-manager.lib.homeManagerConfiguration {
			inherit pkgs;
			modules = [ ./home.nix ];
	    };
	};
  };
}
