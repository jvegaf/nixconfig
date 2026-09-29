{
  inputs,
  lib,
  __findFile,
  ...
}:
{
  flake-file.inputs = {
    llm-agents.url = "github:numtide/llm-agents.nix";
    omp-nix.url = "git+https://git.molez.org/mandlm/omp-nix";
  };

  pkt.pi-agent = { inputs, ... }: {
    nixos = {
      nix.settings = {
        extra-substituters = [ "https://cache.numtide.com" ];
        extra-trusted-public-keys = [
          "niks3.numtide.com-1:DTx8wZduET09hRmMtKdQDxNNthLQETkc/yaX7M4qK0g="
        ];
      };
    };

    homeManager = { pkgs, inputs, ... }: {

      home.packages = [
        inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.omp
      ];
    };
  };
}
