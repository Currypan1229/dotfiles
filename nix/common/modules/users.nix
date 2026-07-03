{ pkgs, ... }:

{
  # User accounts and security
  users = {
    defaultUserShell = pkgs.zsh;
  };

  system.userActivationScripts.zshrc = "touch .zshrc";
}
