{ config, ... }:
let colors = config.lib.stylix.colors;
in {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";

        modules-left =
          [ "custom/power" "hyprland/submap" "hyprland/workspaces" "tray" ];
        modules-center = [ "clock" ];
        modules-right =
          [ "network" "bluetooth" "pulseaudio" "backlight" "battery" ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          format = "{name}";
        };

        "custom/power" = {
          format = "";
          tooltip = false;
          on-click = "wofi-sesion";
        };

        "clock" = {
          timezone = "Europe/Madrid";
          format = "{:%H:%M}";
          format-alt = "{:%d/%m/%Y}";
          tooltip = false;
        };

        "battery" = {
          interval = 1;
          format = "{icon}   {capacity}%";
          format-charging = "  {capacity}%";
          format-icons = [ "" "" "" "" "" ];
          format-plugged = "  {capacity}%";
          states = {
            critical = 15;
            warning = 30;
          };
          on-click = "wofi-powerctl";
        };

        "backlight" = {
          format = "{icon}  {percent}%";
          format-icons = [ "" "" "" "" "" "" "" "" "" ];
        };

        "pulseaudio" = {
          reverse-scrolling = 1;
          format = "{icon}  {volume}% {format_source}";
          format-muted = "󰖁 {format_source}";
          format-source = " ";
          format-source-muted = " ";
          format-icons = { default = [ " " " " " " ]; };
          on-click = "pavucontrol";
        };

        "network" = {
          interval = 1;
          format-disconnected = "󰤮 ";
          format-ethernet = "󰈀 ";
          format-linked = "{ifname} (No IP)";
          format-wifi = "{icon} ";
          format-icons = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];
          tooltip-format = "{essid} ({signalStrength}%)";
          on-click = "nm-connection-editor";
        };

        "bluetooth" = {
          interval = 1;
          format-on = "";
          format-off = "󰂲";
          format-disabled = "󰂲";
          format-connected = "󰂱";
          format-connected-battery = "󰂱 {device_battery_percentage}%";
          tooltip-format = ''
            {controller_alias}	{controller_address}

            {num_connections} connected'';
          tooltip-format-connected = ''
            {controller_alias}	{controller_address}

            {num_connections} connected

            {device_enumerate}'';
          tooltip-format-enumerate-connected =
            "{device_alias}	{device_address}";
          tooltip-format-enumerate-connected-battery =
            "{device_alias}	{device_address}	{device_battery_percentage}%";
          on-click = "blueman-manager";
        };

        tray = {
          icon-size = 12;
          spacing = 8;
        };
      };
    };

    style = ''
      * {
      	margin-top: 2px;
      	min-height: 20px;
      	padding: 0px;
      }

      window#waybar {
      	background: transparent;
      	border: 0px solid transparent;
      	border-radius: 10px;
      }

      #workspaces button {
      	margin: 0 1px;
      	padding: 0 2px;
      	color: #${colors.base04};
      	border-radius: 0px;
      }

      #workspaces button:hover {
      	background: transparent;
      }

      #workspaces button.focused {
      	border-top: 2px solid transparent;
      }

      #workspaces button.active {
      	color: #${colors.base05}
      }

      #workspaces,
      #custom-power,
      #tray,
      #clock,
      #battery,
      #network,
      #pulseaudio,
      #bluetooth,
      #backlight {
      	padding: 0px 10px 0px 10px;
      	margin: 0px 8px 0px 8px;
      	background-color: #${colors.base00};
      	border-radius: 10px;
      	border: 2px solid transparent;
      	color: #${colors.base05};
      }

      #custom-power {
      	padding-right: 16px;
      	font-size: 16px;
      }

      #network {
        padding-right: 16px;
      }
    '';
  };
}
