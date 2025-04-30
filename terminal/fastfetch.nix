{ pkgs, config, ... }:
{
  home.packages = [ pkgs.fastfetch ];

  xdg.configFile."fastfetch/config.jsonc".text = ''
    {
      "logo": {
        "source": "/home/lymee/images/misc/miku.png",
        "type": "kitty",
        "width": 50,
        "padding": {
          "top": 2
        }
      },
      "pipe": false,
      "display": {
        "separator": "",
        "size": {
          "binaryPrefix": "si",
          "ndigits": 0
        },
        "percent": {
          "type": 1
        },
        "key": {
          "Width": 1
        }
      },
      "modules": [
        {
          "type": "title",
          "color": {
            "user": "38;5;204",
            "host": "38;5;51"
          }
        },
        {
          "type": "separator",
          "string": "▔"
        },
        {
          "type": "os",
          "key": "╭─ ",
          "format": "{3} ({12})",
          "keyColor": "38;5;51"
        },
        {
          "type": "host",
          "key": "├─󰟀 ",
          "keyColor": "38;5;51"
        },
        {
          "type": "kernel",
          "key": "├─󰒔 ",
          "format": "{1} {2}",
          "keyColor": "38;5;51"
        },
        {
          "type": "shell",
          "key": "├─$ ",
          "format": "{1} {4}",
          "keyColor": "38;5;51"
        },
        {
          "type": "packages",
          "key": "├─ ",
          "keyColor": "38;5;51"
        },
        {
          "type": "uptime",
          "key": "╰─󰔚 ",
          "keyColor": "38;5;51"
        },
        {
          "type": "cpu",
          "key": "╭─ ",
          "keyColor": "38;5;204",
          "freqNdigits": 1
        },
        {
          "type": "gpu",
          "key": "├─󰢮 ",
          "format": "{1} {2} ({3})",
          "keyColor": "38;5;204"
        },
        {
          "type": "display",
          "key": "├─󰹑 ",
          "keyColor": "38;5;204"
        },
        {
          "type": "de",
          "key": "├─󰧨 ",
          "keyColor": "38;5;204"
        },
        {
          "type": "wm",
          "key": "├─ ",
          "keyColor": "38;5;204"
        },
        {
          "type": "theme",
          "key": "├─󰉼 ",
          "keyColor": "38;5;204"
        },
        {
          "type": "icons",
          "key": "├─ ",
          "keyColor": "38;5;204"
        },
        {
          "type": "cursor",
          "key": "├─󰳽 ",
          "keyColor": "38;5;204"
        },
        {
          "type": "font",
          "key": "├─ ",
          "format": "{2}",
          "keyColor": "38;5;204"
        },
        {
          "type": "terminal",
          "key": "╰─ ",
          "format": "{3}",
          "keyColor": "38;5;204"
        },
        {
          "type": "colors",
          "symbol": "block"
        }
      ]
    }
  '';
}

