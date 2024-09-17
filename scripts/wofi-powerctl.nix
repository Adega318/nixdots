{ pkgs }:

pkgs.writeShellScriptBin "wofi-powerctl" ''
	op=$( echo -e "Performance\nBalanced\nEco" | 
		wofi -b -i -L 4 --dmenu | 
		awk '{print tolower($2)}' )

	case $op in 
		performance)
			powerprofilesctl set performance;;
  	balanced)
			powerprofilesctl set balanced;;
  	eco)
			powerprofilesctl set power-saver;;
	esac
''
