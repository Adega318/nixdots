{
  programs.nixvim.plugins.alpha = {
    enable = true;
    layout = [

      {
        type = "padding";
        val = 2;
      }
      {
        opts = {
          hl = "Type";
          position = "center";
        };
        type = "text";
        val = [
          "███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗"
          "████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║"
          "██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║"
          "██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║"
          "██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║"
          "╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝"
        ];
      }
      {
        type = "padding";
        val = 4;
      }
      {
        type = "group";
        val =
          let
            mkButton = shortcut: cmd: val: hl: {
              type = "button";
              inherit val;
              opts = {
                inherit hl shortcut;
                keymap = [
                  "n"
                  shortcut
                  cmd
                  { }
                ];
                position = "center";
                cursor = 0;
                width = 40;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
              };
            };
          in
          [
            (mkButton "e" "<CMD>ene <BAR> startinsert <CR>" "󰈔 New file" "String")
            (mkButton "f" "<CMD>lua require('telescope.builtin').find_files({hidden = true})<CR>" "󰱼 Find File"
              "String"
            )
            (mkButton "r" "<CMD> Telescope oldfiles <CR>" " Recently used files" "String")
            (mkButton "t" "<CMD> Telescope live_grep <CR>" "󱘢 Find text" "String")
            (mkButton "q" "<CMD>qa<CR>" "󰅚 Quit Neovim" "String")
          ];
      }
    ];
  };
}
