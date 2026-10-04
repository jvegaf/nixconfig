{
  inputs,
  lib,
  __findFile,
  ...
}:
{
  flake-file.inputs = {
    # llm-agents.url = "github:numtide/llm-agents.nix";
    superpowers = {
      url = "github:obra/superpowers";
      flake = false;
    };
  };

  pkt.opencode = { inputs, pkgs, ... }: {
    # nixos = {
    #   nix.settings = {
    #     extra-substituters = [ "https://cache.numtide.com" ];
    #     extra-trusted-public-keys = [
    #       "niks3.numtide.com-1:DTx8wZduET09hRmMtKdQDxNNthLQETkc/yaX7M4qK0g="
    #     ];
    #   };
    # };

    homeManager =
      let

        superpowers = rec {
          src = inputs.superpowers;
          skills = "${src}/skills";
          opencode-plugin = "${src}/.opencode/plugins/superpowers.js";
        };
      in
      {

        programs.opencode = {
          enable = true;
          # package = inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.opencode;
          enableMcpIntegration = true;

          settings = {
            autoshare = false;
            autoupdate = false;

            plugin = [
              # Dynamic context pruning
              "@tarquinen/opencode-dcp@latest"
              # Support background shell commands
              "opencode-pty"
              "@plannotator/opencode@latest"
              "@mohak34/opencode-notifier@latest"
              "@tarquinen/opencode-smart-title"
              # "oh-my-opencode@latest"
              "@simonwjackson/opencode-direnv@latest"
            ];
          };

          agents = ./ai-tools/agents;

          skills = {
            skills = ./ai-tools/skills;
            superpowers = superpowers.skills;
          };

          context = builtins.readFile ./ai-tools/base.md;
        };

      };
  };
}
