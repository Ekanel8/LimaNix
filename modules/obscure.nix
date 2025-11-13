{ stdenv, fetchFromGitHub, lib }:

stdenv.mkDerivation rec {
  pname = "sddm-obscure-theme";
  version = "1.0";
  
  dontBuild = true;
  
  src = fetchFromGitHub {
    owner = "saatvik333";
    repo = "obscure-sddm-theme";
    rev = "main";
    sha256 = "sha256-ZpjdeC8BiriM9ayNOqkOD8eK7NXUU1ONYELuToUEN0E=";
  };
  
  installPhase = ''
    mkdir -p $out/share/sddm/themes
    cp -aR $src $out/share/sddm/themes/obscure
  '';
  
  meta = {
    description = "Minimal SDDM theme with IPA character-based password masking";
    homepage = "https://github.com/saatvik333/obscure-sddm-theme";
    license = lib.licenses.mit;
    platforms = lib.platforms.linux;
  };
}
