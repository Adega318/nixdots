{
  imports = [ ./autocommands.nix ./keys.nix ./sets.nix ./plugins ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    performance = {
      combinePlugins = {
        enable = false;
        standalonePlugins = [ "hmts.nvim" "nvim-treesitter" ];
      };
      byteCompileLua.enable = true;
    };

    viAlias = true;
    vimAlias = true;

    luaLoader.enable = true;
  };
}
