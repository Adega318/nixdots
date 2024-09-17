{ lib, ... }: {
  programs.nixvim.plugins.obsidian = {
    enable = true;
    settings = {
      completion = {
        min_chars = 2;
        nvim_cmp = true;
      };
      new_notes_location = "current_dir";
      workspaces = [
        {
          name = "Notes";
          path = "~/Documents/Notes";
        }
      ];
      daily_notes = {
        # template = "~/obsidian/templates/daily_note_template.md";
        # folder = "~/obsidian/work/daily_notes";
      };
      mappings = {
        gf = {
          action = "require('obsidian').util.gf_passthrough";
          opts = {
            noremap = false;
            expr = true;
            buffer = true;
          };
        };
        "<leader>ch" = {
          action = "require('obsidian').util.toggle_checkbox";
          opts.buffer = true;
        };
      };
      templates = {
        # subdir = "~/obsidian/templates";
      };
    };
  };
}
