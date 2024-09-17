{ lib, ...}:

{
  programs.wofi = {
    enable = true;

		settings = {
			location = "center";
			allow_markup = true;
			width = 500;
		};

		style = lib.mkForce ''
			* {
			}

			#window {
  			margin: auto;
  			padding: 10px;
  			border-radius: 20px;
  			border: 5px;
			}

			#input {
  			padding: 10px;
  			margin-bottom: 10px;
  			border-radius: 15px;
			}

			#outer-box {
  			padding: 20px;
			}

			#img {
  			margin-right: 6px;
			}

			#entry {
  			padding: 10px;
  			border-radius: 15px;
			}

			#text {
  			margin: 2px;
			}
		'';
	};
}
