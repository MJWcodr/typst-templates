{
	inputs = { 
		nixpkgs = { 
			url = "github:NixOS/nixpkgs/nixos-unstable";
		};
	};
  outputs = { self, nixpkgs, ... }: 
	let
		system = "x86_64-linux";
		pkgs = nixpkgs.legacyPackages.${system};
	in
	{
		
		defaultPackage.x86_64-linux = pkgs.mkShell {
			name = "typst";
			buildInputs = with pkgs; [
				typst
				typstfmt
				typstyle
				roboto
			];
		};
	};

}
