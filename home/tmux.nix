{ pkgs }:
{
  enable = true;
  aggressiveResize = true;
  baseIndex = 1;
  clock24 = true;
  escapeTime = 0;
  historyLimit = 10000;
  keyMode = "vi";
  sensibleOnTop = true;
  shortcut = "s";
  terminal = "xterm-256color";
  shell = "${pkgs.fish}/bin/fish";
  secureSocket = true;
  plugins = with pkgs; [
    {
      plugin = tmuxPlugins.resurrect;
      extraConfig = ''
        set -g @resurrect-save 'W'
        set -g @resurrect-strategy-nvim 'session'
        set -g @resurrect-capture-pane-contents 'on'
      '';
    }
    {
      plugin = tmuxPlugins.continuum;
      extraConfig = ''
        set -g @continuum-restore 'on'
      '';
    }
    tmuxPlugins.open
  ];
  extraConfig = with pkgs;
    let
      commonFiles = with builtins; [
        (readFile ./tmux/tmux.conf)
        (readFile ./tmux/srw-colourscheme.conf)
      ];
      darwinFiles = lib.optionals stdenv.isDarwin [
        (builtins.readFile ./tmux/tmux-osx.conf)
      ];
    in
    (builtins.concatStringsSep "\n" (commonFiles ++ darwinFiles));
}