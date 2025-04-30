{ config, colors, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    fish
    starship
    eza                  # modern ls replacement
    zoxide               # smart cd
    fzf                  # fuzzy finder
    fishPlugins.bass     # run bash init scripts in fish
    python3
  ];

  programs.fish = {
    enable = true;

    shellAliases = {
      rebuild =  "sudo nixos-rebuild switch --flake /home/lymee/dotfiles#nixos";
      garbage = "nix-collect-garbage";
      fast = "fastfetch";
      garbo = "sudo nix-env --delete-generations +5 --profile /nix/var/nix/profiles/system";
      ls = "eza --icons";  # use eza instead of ls
    };

    interactiveShellInit = ''
      # zoxide init
      zoxide init fish | source

      # fish-style navigation improvements
      bind \e\[A history-search-backward
      bind \e\[B history-search-forward

      # fish colors (Miku style)
      set -g fish_color_autosuggestion 137a7f     # subtle teal
      set -g fish_color_command 86cecb            # Miku teal
      set -g fish_color_param bec8d1              # soft silver
      set -g fish_color_error e12885              # vibrant pink
      set -g fish_color_end 373b3e                # statement terminators

    '';

  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      add_newline = false;
      format = "$directory$git_branch$git_status$cmd_duration$memory_usage$time\n[ ](fg:#86cecb)  ";

      directory.style = "#86cecb";
      git_branch.style = "#e12885";
      git_status.style = "#bec8d1";
      cmd_duration.style = "#137a7f";

      character = {
        success_symbol = "[💙](bold #86cecb)";
        error_symbol = "[💔](bold #e12885)";
      };

      memory_usage = {
        disabled = false;
        threshold = 80;
        style = "bold #e12885";
      };

      time = {
        disabled = false;
        format = "[🕒 $time]($style) ";
        style = "#bec8d1";
        time_format = "%I:%M %p";
      };

      battery.disabled = false;
      command_timeout = 500;
    };
  };
}

