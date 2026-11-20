{ inputs, ... }:
{
  pkt.neovim-plugins = {
    imports = [ inputs.nixvim.homeModules.nixvim ];

    homeManager = { pkgs, ... }: {
      programs.nixvim = {

        extraPlugins = with pkgs; [
          vimPlugins.blink-nerdfont-nvim
          vimPlugins.blink-ripgrep-nvim
          vimPlugins.blink-emoji-nvim
          vimPlugins.blink-cmp-tmux
        ];

        plugins = {
          blink-cmp = {
            enable = true;
            settings = {
              completion = {
                menu = {
                  border = "rounded";
                };
                documentation = {
                  auto_show = true;
                  auto_show_delay_ms = 500;
                };
                ghost_text = {
                  enabled = true;
                };
              };

              keymap = {
                preset = "enter";
              };

              sources = {
                default = [
                  "lsp"
                  "ripgrep"
                  "path"
                  "snippets"
                  "nerdfont"
                  "emoji"
                  "buffer"
                  "tmux"
                ];
                providers = {
                  lsp = {
                    fallbacks = [ ];
                    score_offset = 10;
                  };
                  snippets = {
                    opts = {
                      friendly_snippets = true;
                      extended_filetypes = {
                        sh = "shelldoc";
                      };
                    };
                  };
                  nerdfont = {
                    module = "blink-nerdfont";
                    name = "Nerd Fonts";
                    score_offset = 15;
                    opts = {
                      insert = true;
                      trigger = "nf";
                    };
                  };
                  emoji = {
                    module = "blink-emoji";
                    name = "Emoji";
                    score_offset = 15;
                    opts = {
                      insert = true;
                      trigger = ":";
                    };
                  };
                  ripgrep = {
                    async = true;
                    module = "blink-ripgrep";
                    name = "Ripgrep";
                    score_offset = -5;
                    opts = {
                      prefix_min_len = 3;
                      backend = {
                        context_size = 5;
                        max_filesize = "2M";
                        search_casing = "--smart-case";
                      };
                    };
                  };
                };
              };

              signature = {
                enabled = true;
              };
            };
          };
          blink-emoji = {
            enable = true;
          };
          blink-ripgrep = {
            enable = true;
          };
        };
      };
    };
  };
}
