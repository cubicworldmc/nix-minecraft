{
  lib,
  self,
  outputs,
  system,
  stdenvNoCC,
}:
stdenvNoCC.mkDerivation {
  name = "formatting-check";
  src = self;
  doCheck = false; # TODO: fix it
  phases = [
    "checkPhase"
    "installPhase"
  ];
  checkPhase = "${lib.getExe outputs.formatter.${system}} --no-cache --ci $src";
  installPhase = ''mkdir "$out"'';
}
