{
  programs.nixvim.plugins = {
    lsp-format = { enable = true; };
    lsp = {
      enable = true;
      servers = {
        nixd = { enable = true; };
        html = { enable = true; };
        lua-ls = { enable = true; };
        nil-ls = { enable = true; };
        marksman = { enable = true; };
        pyright = { enable = true; };
        gopls = { enable = true; };
        terraformls = { enable = true; };
        ts-ls = { enable = false; };
        yamlls = { enable = true; };
        clangd = { enable = true; };
        java-language-server = { enable = true; };
        ocamllsp = { enable = true; };
      };
      keymaps = {
        silent = true;
        lspBuf = {
          gd = {
            action = "definition";
            desc = "Goto Definition";
          };
          gr = {
            action = "references";
            desc = "Goto References";
          };
          gD = {
            action = "declaration";
            desc = "Goto Declaration";
          };
          gI = {
            action = "implementation";
            desc = "Goto Implementation";
          };
          gT = {
            action = "type_definition";
            desc = "Type Definition";
          };
          K = {
            action = "hover";
            desc = "Hover";
          };
          "<leader>cw" = {
            action = "workspace_symbol";
            desc = "Workspace Symbol";
          };
          "<leader>cr" = {
            action = "rename";
            desc = "Rename";
          };
        };
        diagnostic = {
          "<leader>cd" = {
            action = "open_float";
            desc = "Line Diagnostics";
          };
          "[d" = {
            action = "goto_next";
            desc = "Next Diagnostic";
          };
          "]d" = {
            action = "goto_prev";
            desc = "Previous Diagnostic";
          };
        };
      };
    };
  };
}
