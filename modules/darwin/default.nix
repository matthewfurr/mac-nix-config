{ pkgs, ... }:
{
  # here go the darwin preferences and config items
  programs.zsh.enable = true;
  environment = {
    shells = with pkgs; [
      bash
      zsh
    ];
    loginShell = pkgs.zsh;
    systemPackages = [ pkgs.coreutils ];
    # systemPath = [ "/opt/homebrew/bin" ];
    # pathsToLink = [ "/Applications" ];
  };
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = false;
  fonts.fontDir.enable = false; # Will not work with Adobe CC Fonts
  fonts.packages = [
    (pkgs.nerdfonts.override {
      fonts = [
        "Hack"
        "IBMPlexMono"
        "Iosevka"
        "IosevkaTerm"
        "IosevkaTermSlab"
        "JetBrainsMono"
        "Meslo"
        "SourceCodePro"
      ];
    })
  ];
  services.nix-daemon.enable = true;
  system = {
    defaults = {
      dock = {
        autohide = true;
        appswitcher-all-displays = true;
        launchanim = false;
        magnification = false;
        mineffect = "genie";
        minimize-to-application = true;
        mru-spaces = false;
        orientation = "bottom";
        # persistent-apps = [
        #   [
        #     "/Applications/Safari.app"
        #     "/System/Applications/Utilities/Terminal.app"
        #   ]
        # ];
        persistent-others = [ [ "~/Downloads" ] ];
        show-process-indicators = true;
        show-recents = false;
        wvous-bl-corner = 2;
        wvous-br-corner = 1;
        wvous-tl-corner = 1;
        wvous-tr-corner = 4;
      };
      finder = {
        AppleShowAllExtensions = true;
        FXDefaultSearchScope = "SCcf";
        FXPreferredViewStyle = "Nlsv";
        QuitMenuItem = true;
        ShowPathbar = true;
        ShowStatusBar = true;
        _FXShowPosixPathInTitle = true;
      };
      NSGlobalDomain = {
        AppleShowAllExtensions = true;
        InitialKeyRepeat = 14;
        KeyRepeat = 1;
      };
      spaces = {
        spans-displays = true;
      };

    };
    startup = {
      chime = false;
    };
    # backwards compatible
    stateVersion = 4;
  };
  time = {
    timeZone = "America/New_York";
  };
#   homebrew = {
#     enable = true;
#     caskArgs.no_quarantine = true;
#     global.brewfile = true;
#     masApps = { };
#     casks = [ "amethyst" ];
#     #taps = [ "" ];
#     #brews = [ "" ];
#   };
}
