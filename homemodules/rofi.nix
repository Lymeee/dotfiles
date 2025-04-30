{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    rofi-wayland
    numix-icon-theme-circle
  ];

  programs.rofi = {
    enable = true;
  };

  # Define rofi config file location using xdg.configFile for user config
  xdg.configFile."rofi/config".text = ''
    modi: "drun";
    icon-theme: "Numix-Circle";  # Ensure the icon theme is available
    font: "JetBrains Mono Regular 13";
    show-icons: true;
    terminal: "wezterm";
    drun-display-format: "{icon} {name}";
    location: 0;
    disable-history: false;
    hide-scrollbar: true;
    display-drun: "   Apps ";
    sidebar-mode: true;
    border-radius: 10;
  '';

  # Define rofi style (CSS) to match your miku theme
  xdg.configFile."rofi/style.css".text = ''
    * {
      --bg-col: #373b3e;
      --text-col: #bec8d1;
      --highlight-col: #86cecb;
      --hover-col: #e12885;
      --border-col: #137a7f;
      --accent-col: #8bd5ca;
      --width: 600px;
      --height: 400px;
      --border-radius: 10px;
    }

    window {
      height: var(--height);
      border: 2px solid var(--border-col);
      background-color: var(--bg-col);
      border-radius: var(--border-radius);
    }

    mainbox {
      background-color: var(--bg-col);
    }

    inputbar {
      children: [prompt, entry];
      background-color: var(--bg-col);
      border-radius: 5px;
      padding: 2px;
    }

    prompt {
      background-color: var(--highlight-col);
      padding: 6px;
      text-color: var(--bg-col);
      border-radius: 3px;
      margin: 20px 0px 0px 20px;
    }

    entry {
      padding: 6px;
      margin: 20px 0px 0px 10px;
      text-color: var(--text-col);
      background-color: var(--bg-col);
    }

    listview {
      border: 0px;
      padding: 6px 0px 0px;
      margin: 10px 0px 0px 20px;
      columns: 2;
      lines: 5;
      background-color: var(--bg-col);
    }

    element {
      padding: 5px;
      background-color: var(--bg-col);
      text-color: var(--text-col);
    }

    element.selected {
      background-color: var(--highlight-col);
      text-color: var(--bg-col);
    }

    button {
      padding: 10px;
      background-color: var(--bg-col);
      text-color: var(--accent-col);
      vertical-align: 0.5;
      horizontal-align: 0.5;
    }

    button.selected {
      background-color: var(--bg-col);
      text-color: var(--highlight-col);
    }

    message {
      background-color: var(--bg-col-light);
      margin: 2px;
      padding: 2px;
      border-radius: 5px;
    }

    textbox {
      padding: 6px;
      margin: 20px 0px 0px 20px;
      text-color: var(--highlight-col);
      background-color: var(--bg-col-light);
    }
  '';
}

