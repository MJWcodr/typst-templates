{
  description = "A Typst Template";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		
		fontawesome = {
			url = "github:duskmoon314/typst-fontawesome";
			flake = false;	
		};

		linguify = {
			url = "github:typst-community/linguify";
			flake = false;
		};
	
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs @ {
    nixpkgs,
    flake-utils,
    ...
  }:

	let 
		pkgs = nixpkgs.legacyPackages.x86_64-linux;

		fontawesome = inputs.fontawesome;
		linguify = inputs.linguify;
		font-awesome = inputs.font-awesome;
	in {

		# Copy the dependencies to the output
		defaultPackage.x86_64-linux = pkgs.stdenv.mkDerivation {
			name = "typst";
			src = ./.;
			installPhase = ''
				mkdir -p $out

				# Copy source files
				cp -r * $out

				# Copy dependencies
				cp -r ${fontawesome}/ $out/fontawesome
				cp -r ${linguify}/ $out/linguify
			'';
		};

	};
}
