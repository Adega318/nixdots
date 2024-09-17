{ pkgs }:

pkgs.writeShellScriptBin "wofi-sesion" ''
	op=$( echo -e "  Poweroff\n Reboot\n  Suspend\n  Lock\n  Logout" | 
		wofi -b -i -L 6 --dmenu | 
		awk '{print tolower($2)}' )

	case $op in 
		poweroff);&
  	reboot);&
  	suspend)
    	systemctl $op;;
  	lock)
			hyprlock;;
  	logout)
    	hyprctl dispatch exit;;
	esac
''
