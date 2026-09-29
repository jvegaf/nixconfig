{
  # https://git-scm.com/
  pkt.git = {
    homeManager = {
      programs.git = {
        enable = true;

        signing = {
          format = "ssh";
          key = "~/.ssh/id_ed25519.pub";
          signByDefault = false;
        };

        settings = {
          user = {
            name = "Jose Vega";
            email = "josevega234@gmail.com";
          };

          init.defaultBranch = "main";
          pull.rebase = true;
        };
      };

      home.shellAliases = {
        gs = "git status";
        ga = "git add";
        gaa = "git add .";
        gc = "git commit";
        gps = "git push";
        gpl = "git pull --rebase --autostash";
        gco = "git checkout";
        gcl = "git clone";
      };
    };
  };
}
