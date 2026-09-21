{
  # https://git-scm.com/
  pkt.git = {
    homeManager.programs.git = {
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
  };
}
