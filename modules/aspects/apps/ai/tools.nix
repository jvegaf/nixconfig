{
  inputs,
  lib,
  __findFile,
  ...
}:
{
  flake-file.inputs.llm-agents.url = "github:numtide/llm-agents.nix";

  pkt.ai-tools = { pkgs, inputs, ... }: {
    nixos = {
      nix.settings = {
        extra-substituters = [ "https://cache.numtide.com" ];
        extra-trusted-public-keys = [
          "niks3.numtide.com-1:DTx8wZduET09hRmMtKdQDxNNthLQETkc/yaX7M4qK0g="
        ];
      };
    };

    homeManager = {
      home.packages = with inputs.llm-agents.packages.${pkgs.stdenv.system}; [
        codegraph
        skills
        semble
      ];
    };
  };

}
