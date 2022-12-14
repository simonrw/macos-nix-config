{ config, ... }:
{
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
    defaultCommand = ''rg --files --no-ignore --hidden --follow -g "!{.git,venv,node_modules}/*" 2> /dev/null'';
    defaultOptions = [
      "--tiebreak begin"
      "--ansi"
      "--no-mouse"
      "--tabstop 4"
      "--inline-info"
    ] ++ (if config.dark-mode then [ "--color dark" ] else [ "--color light" ]);
    tmux.enableShellIntegration = true;
  };
}
