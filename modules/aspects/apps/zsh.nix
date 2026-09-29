{
  pkt.zsh = {
    homwManager =

      { config, ... }: {
        programs.zsh = {
          enable = true;
          enableCompletion = true;
          autosuggestion.enable = true;
          syntaxHighlighting.enable = true;

          shellAliases =
            let
              mngClients = ''
                mmsg get all-clients | jq -r '
                  ["ID", "APP_ID", "TAG", "FLOAT", "FOCUS", "TITULO"],
                  ["--", "------", "---", "-----", "-----", "------"],
                  (.clients[] | [
                    .id,
                    .appid,
                    (.tags | join(",")),
                    .is_floating,
                    .is_focused,
                    .title
                  ]) | @tsv' | column -ts $'\t'
              '';
            in
            {
              mncl = mngClients;

              ".." = "cd ..";
              "..." = "cd ../..";
              "...." = "cd ../../..";
            };

          history.size = 10000;
          history.path = "${config.xdg.dataHome}/zsh/history";

          initContent = ''
            # Start Tmux automatically if not already running. No Tmux in TTY
            # if [ -z "$TMUX" ] && [ -n "$DISPLAY" ]; then
            #   tmux attach-session -t default || tmux new-session -s default
            # fi

            fastfetch

            # Start UWSM
            # if uwsm check may-start > /dev/null && uwsm select; then
            #   exec systemd-cat -t uwsm_start uwsm start default
            # fi
          '';
        };
      };
  };
}
