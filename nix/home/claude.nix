{ config, dotfilesDir, ... }:

{
    # Global Claude Code instructions (~/.claude, not XDG).
    home.file.".claude/CLAUDE.md".source = config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/${dotfilesDir}/.claude/CLAUDE.md";
}
