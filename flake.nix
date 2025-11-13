{
  description = "Eka's global NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    quickshell = {
          url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
          inputs.nixpkgs.follows = "nixpkgs";
        };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
	let
		lib = nixpkgs.lib;
		system = "x86_64-linux";
		pkgs = nixpkgs.legacyPackages.${system};
	in {
	nixosConfigurations = {
      jarvis = lib.nixosSystem {
        inherit system;
        modules = [ ./configuration.nix ];
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
