{ pkgs, lib, ... }:
{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = [
    pkgs._1password
  ];

  users.users.simon = {
    name = "simon";
    home = "/Users/simon";
    shell = pkgs.fish;
  };

  environment.shells = [
    pkgs.fish
  ];

  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;
  documentation.enable = true;
  nix.extraOptions = ''
    keep-outputs = true
    keep-derivations = true
    auto-optimise-store = true
    experimental-features = nix-command flakes
  '' + lib.optionalString (pkgs.system == "aarch64-darwin") ''
    extra-platforms = x86_64-darwin aarch64-darwin
  '';

  programs.fish.enable = true;
  programs.zsh.enable = true;
  programs.nix-index.enable = true;

  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = true;

  homebrew = {
    enable = true;
    casks = [
      "alacritty"
      "alfred"
      "barrier"
      "dash"
      "docker"
      "element"
      "firefox"
      "google-chrome"
      "hammerspoon"
      "karabiner-elements"
      "visual-studio-code"
      "vlc"
    ];
    masApps =
      {
        DaisyDisk = 411643860;
      };
  };
}
