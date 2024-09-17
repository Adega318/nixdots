{ settings, ...}:

{
	programs.hyprlock = {
		enable = true;
		
		settings = {
			general.hide_cursor = false;
			background = {
				monitor = "";
				path = "${settings.wallpaper}";
			};

			input-field = [
				{
					size = "200, 50";
      		monitor = "";
      		dots_center = true;
      		fade_on_empty = false;
      		outline_thickness = 2;
      		shadow_passes = 2;
					outer_color = "rgba(0, 0, 0, 0)";
    			inner_color = "rgba(0, 0, 0, 0.5)";
    			font_color = "rgb(200, 200, 200)";
				}
			];
		};
	};
}
