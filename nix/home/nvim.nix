{ pkgs, config, dotfilesDir, ... }:

{
    home.packages = with pkgs; [
        neovim  # moved off brew

        # LSP servers enabled in .config/nvim/lua/plugins/lspconfig.lua
        lua-language-server
        rust-analyzer
        gopls
        typescript-language-server
        bash-language-server
    ];

    # Out-of-store symlink to the checkout (not the read-only store copy):
    # lazy.nvim writes lazy-lock.json into the config dir.
    xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/${dotfilesDir}/.config/nvim";
}
