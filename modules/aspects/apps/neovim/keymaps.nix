{
  inputs,
  lib,
  __findFile,
  ...
}:
{
  pkt.neovim-keymaps = {
    imports = [ inputs.nixvim.homeModules.nixvim ];

    homeManager = {
      programs.nixvim.keymaps = [
        {
          mode = [
            "i"
            "n"
          ];
          key = "<esc>";
          action = "<cmd>noh<cr><esc>";
          options = {
            desc = "Escape and Clear hlsearch";
          };
        }
        {
          mode = "n";
          key = "<leader>ur";
          action = "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>";
          options = {
            desc = "Redraw / Clear hlsearch / Diff Update";
          };
        }
        # Easier movements
        {
          mode = "n";
          key = "<A-j>";
          action = "<cmd>m .+1<cr>==";
          options = {
            desc = "Move Down";
          };
        }
        {
          mode = "n";
          key = "<A-k>";
          action = "<cmd>m .-2<cr>==";
          options = {
            desc = "Move Up";
          };
        }
        {
          mode = "i";
          key = "<A-j>";
          action = "<esc><cmd>m .+1<cr>==gi";
          options = {
            desc = "Move Down";
          };
        }
        {
          mode = "i";
          key = "<A-k>";
          action = "<esc><cmd>m .-2<cr>==gi";
          options = {
            desc = "Move Up";
          };
        }
        {
          mode = "v";
          key = "<A-j>";
          action = ":m '>+1<cr>gv=gv";
          options = {
            desc = "Move Down";
          };
        }
        {
          mode = "v";
          key = "<A-k>";
          action = ":m '<-2<cr>gv=gv";
          options = {
            desc = "Move Up";
          };
        }
        {
          mode = "v";
          key = ">";
          action = ">gv";
          options.desc = "Indent the highlighted line(s)";
        }
        {
          mode = "v";
          key = "<";
          action = "<gv";
          options.desc = "Unindent the highlighted line(s)";
        }
        # Navigate vim panes better
        {
          mode = "n";
          key = "<c-k>";
          action = ":wincmd k<CR>";
          options.desc = "Move to the pane above";
        }
        {
          mode = "n";
          key = "<c-j>";
          action = ":wincmd j<CR>";
          options.desc = "Move to the pane below";
        }
        {
          mode = "n";
          key = "<c-h>";
          action = ":wincmd h<CR>";
          options.desc = "Move to the pane left";
        }
        {
          mode = "n";
          key = "<c-l>";
          action = ":wincmd l<CR>";
          options.desc = "Move to the pane right";
        }
        # Rebind c-i to itself to distinguish between c-i and tab
        {
          mode = "n";
          key = "<c-i>";
          action = "<c-i>";
        }
        # Recenter the screen after <c-u> and <c-d>
        {
          mode = "n";
          key = "<c-u>";
          action = "<c-u>zz";
          options.desc = "Scroll up half a page and recenter";
        }
        {
          mode = "n";
          key = "<c-d>";
          action = "<c-d>zz";
          options.desc = "Scroll down half a page and recenter";
        }
        # Recenter the screen after searching
        {
          mode = "n";
          key = "n";
          action = "nzzzv";
          options.desc = "Search next and recenter";
        }
        {
          mode = "n";
          key = "N";
          action = "Nzzzv";
          options.desc = "Search previous and recenter";
        }
        # System clipboard helpers
        # Yank into system clipboard
        {
          mode = [
            "n"
            "v"
          ];
          key = "<leader>y";
          action = ''"+y'';
          options.desc = "yank to clipboard motion";
        }
        {
          mode = [
            "n"
          ];
          key = "vv";
          action = "V";
        }
        {
          mode = [
            "n"
          ];
          key = "W";
          action = ":w<cr>";
        }
        {
          mode = [
            "n"
            "v"
          ];
          key = "<leader>D";
          action = ''"+D'';
          options.desc = "delete to clipboard line";
        }
        # Paste from system clipboard
        {
          mode = "n";
          key = "<leader>p";
          action = ''"+p'';
          options.desc = "paste from clipboard after cursor";
        }
        {
          mode = "n";
          key = "<leader>P";
          action = ''"+P'';
          options.desc = "paste from clipboard before cursor";
        }
        # Close current buffer
        {
          mode = "n";
          key = "<leader>q";
          action = ":q<CR>";
          options.desc = "Close current window";
        }
        {
          action = "<ESC>";
          key = "jk";
          mode = "i";
        }
        {
          action = "<ESC>";
          key = "jj";
          mode = "i";
        }
        {
          action = "<cmd>LazyGit<CR>";
          key = "<leader>gg";
        }
        {
          action = "<esc>:URLOpenUnderCursor<cr>";
          key = "gx";
        }
        {
          action = "<cmd>UrlView buffer<cr>";
          key = "<leader>bu";
        }
        {
          action = "<cmd>checkhealth<cr>";
          key = "<leader>zh";
        }
        {
          action = "<cmd>messages<cr>";
          key = "<leader>zm";
        }
        {
          action = "<cmd>UrlView lazy<cr>";
          key = "<leader>zu";
        }
      ];
    };
  };
}
