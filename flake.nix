{
  description = "Jarvis Configuration v1";

  inputs = {
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "unstable";
    };

  };

  outputs = inputs@{ self, nixpkgs, unstable, home-manager, noctalia, ... }:
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
          inherit unstablepkgs inputs;
        };
        modules = [
          ./configuration.nix
          ./noctalia.nix
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
