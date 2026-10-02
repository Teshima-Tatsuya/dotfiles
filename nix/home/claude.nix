{ config, dotfilesDir, ... }:

let
    # Out-of-store so Claude Code can still write settings.json in place.
    link = path: config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/${dotfilesDir}/.claude/${path}";
in
{
    # ~/.claude, not XDG.
    home.file.".claude/CLAUDE.md".source = link "CLAUDE.md";
    home.file.".claude/settings.json".source = link "settings.json";
    home.file.".claude/hooks".source = link "hooks";
    home.file.".claude/skills".source = link "skills";
}
